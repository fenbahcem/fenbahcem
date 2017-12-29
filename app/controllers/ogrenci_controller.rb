class OgrenciController < ApplicationController
	layout "app-other", only: [:bilimfuari, :proje_show, :fotogaleri, :video, :gonderinyayinlayalim, :onerivesikayet, :digersayfalar]  
	helper_method :sayac
	helper_method :toplamgoruntuleme

  def arama
    Admin::Materyal.reindex
    Admin::Proje.reindex
    Admin::Digersayfa.reindex
    Admin::Fotogaleri.reindex
    Admin::Video.reindex
    Admin::Geneldosya.reindex
    @indis1 = Admin::Materyal.search params[:arama], fields: [:materyaladi, :materyalaciklama], execute: false, operator: "or"
    @indis2 = Admin::Proje.search params[:arama], fields: [:projeadi, :projeaciklama], execute: false, operator: "or"
    @indis3 = Admin::Digersayfa.search params[:arama], fields: [:baslik, :metin], execute: false, operator: "or"
    @indis4 = Admin::Fotogaleri.search params[:arama], fields: [:baslik, :aciklama], execute: false, operator: "or"
    @indis5 = Admin::Video.search params[:arama], fields: [:baslik], execute: false, operator: "or"
    @indis6 = Admin::Geneldosya.search params[:arama], fields: [:baslik], execute: false, operator: "or"
    @arama = Searchkick.multi_search([@indis1, @indis2, @indis3, @indis4, @indis5, @indis6])
  end

	def index
		@duyuru = Admin::Duyuru.where(tur:0).order('created_at DESC')
		@haber = Admin::Duyuru.where(tur:1).order('created_at DESC')
    @resim = Admin::Fotogaleri.where(anasayfabaglantisi: true).order('created_at DESC')
  end
	
	def bilimfuari
		@proje = Admin::Proje.paginate(page: params[:page]).order('created_at DESC')
	end
		
	def proje_show
		@proje = Admin::Proje.find(params[:id])
	end
	
  def gonderinyayinlayalim
		@ogrencicalisma = Ogrencicalisma.new	
	end
	
	def ogrencicalisma
		@ogrencicalisma = Ogrencicalisma.new(ogrenci_params)	
		if @ogrencicalisma.save
      redirect_to "/gonderinyayinlayalim", notice: "<div class='container'><div class='jumbotron' style='color: #3c763d; background-color: #dff0d8; border-color: #d6e9c6'><h1>Talebiniz alınmıştır.</h1>Talebiniz uzman ekibimiz tarafından titzlikle incelenip, en kısa sürede geri bildirim yapılacaktır. İyi günler ve iyi çalışmalar dileriz.</div></div>"
		else
			redirect_to "/gonderinyayinlayalim", notice: "<div class='container'><div class='jumbotron' style='color: #a94442; background-color: #f2dede; border-color: #ebccd1'><h1>Üzgünüz!</h1>Formda bulunan adı, soyadı, e-posta ve açıklama sekmelerinin doldurulması zorunludur. </div></div>"
		end
	end


	def onerivesikayet
		@adisoyadi = params[:adisoyadi]
		@email = params[:email]
		@konu = params[:konu]
		@aciklama = params[:aciklama]
     
		KullaniciMailer.onerivesikayet_email(@adisoyadi, @email, @konu, @aciklama).deliver_later
	end

	def digersayfalar
		@digersayfa = Admin::Digersayfa.limit(5).order('id desc')
		@digersayfalar = Admin::Digersayfa.where(tur: params[:tur]).paginate(page: params[:page]).order('created_at DESC')
	end

	def fotogaleri
		@fotogaleri = Admin::Fotogaleri.paginate(page: params[:page]).order('created_at DESC')		
	end

	def video
		@video = Admin::Video.where(tur: params[:tur]).paginate(page: params[:page]).order('created_at DESC')
	end
  
  def geneldosya
    @geneldosya = Admin::Geneldosya.all
  end

  def geneldosyaincele
    @geneldosya = Admin::Geneldosya.find(params[:id])
  end
  # -----Materyal-----
	
  def materyal
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@materyal =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]

#    fresh_when etag: @materyal, public: true
	end

  def materyal_goruntule
    @materyal = Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur]).where(unite_id: params[:unite_id]).order('created_at DESC')  
		@unite = params[:uniteadi]
    
#    fresh_when etag: @materyal, public: true
  end

  def materyal_incele
    @randommateryal = Admin::Materyal.order("RANDOM()").first(4)
    @randommateryal2 = Admin::Materyal.order("RANDOM()").last(4)

    @materyal = Admin::Materyal.find(params[:id])
    
 #   fresh_when last_modified: @materyal.created_at.utc, public: true, etag: @materyal 
    
    file = @materyal.dosya_file_name
    unless File.exists?(File.dirname(@materyal.dosya.path) + "/" + File.basename(file, File.extname(file)) + "_1.png")
      if ["application/zip","application/x-zip","application/x-zip-compressed"].include?@materyal.dosya.content_type
        ::Zip::File.open(@materyal.dosya.path) do |zip|
          zip.each do |file|
            unless File.exists?(File.dirname(file.zipfile) + "/" + file.name)
              zip.extract(file, File.dirname(@materyal.dosya.path) + "/" + file.name)
            end
          end
        end 
        Dir[File.dirname(@materyal.dosya.path)+ "/*"].each do |i|
          unless Dir[File.dirname(@materyal.dosya.path) + "/*"].include?(File.dirname(i) + "/" + File.basename(i, File.extname(i)) + ".png")
            unless [".zip", ".rar"].include?(File.extname(i))
              unless File.directory?(i)
                Docsplit.extract_images(i, output: File.dirname(@materyal.dosya.path))
              end
            end
          end
        end
        
       
      
      else
        Docsplit.extract_images(@materyal.dosya.path, output: File.dirname(@materyal.dosya.path))
      end
    end 
    
    
    @imagelist = []
    Dir[File.dirname(@materyal.dosya.path)+"/*.png"].each do |i|
      @imagelist.append(File.basename(i))
    end
  end
  # -----Materyal-----

	def sayac(sinif, materyaltur, uniteid)
		return Admin::Materyal.where(sinif: sinif).where(materyaltur: materyaltur).where(unite_id: uniteid).count
	end
	
  def toplamgoruntuleme(materyal)
    @materyal = materyal
    @materyal.increment!(:sayac)
  end

	private	
    def ogrenci_params
      params.require(:ogrencicalisma).permit(:ad, :soyad, :email, :aciklama, :dosya)
    end
end
