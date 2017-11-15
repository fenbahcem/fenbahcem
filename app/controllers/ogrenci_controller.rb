class OgrenciController < ApplicationController
	layout "app-other", only: [:bilimfuari, :proje_show, :fotogaleri, :video, :gonderinyayinlayalim, :onerivesikayet, :biliminsanlari, :resmievraklar, :motivasyon, :sinavsistemi, :ilgincbilgiler]  
	helper_method :sayac
	helper_method :toplamgoruntuleme
	
	def index
		@duyuru = Admin::Duyuru.where(tur:0).order('created_at DESC')
		@haber = Admin::Duyuru.where(tur:1).order('created_at DESC')
    @resim = Admin::Fotogaleri.where(anasayfabaglantisi: true).order('created_at DESC')
  end
	
	def uniteler
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@unitesinif = params[:sinif]
	end
	
	def unite_konu
		@konu = Admin::Konuanlatimi.where(sinif: params[:sinif]).where(unite_id: params[:unite_id]) 
		@unite_konu = params[:uniteadi]
	end
	
	def konuanlatimi_incele
		@konuanlatimi = Admin::Konuanlatimi.find(params[:konuanlatimi_id])
		@unite_konu = Admin::Unite.find(params[:unite_id]).uniteadi
	end
	
	def bilimfuari
		@proje = Admin::Proje.all.order('created_at DESC')
	end
		
	def gonderinyayinlayalim
		@ogrencicalisma = Ogrencicalisma.new	
	end
	
	def ogrencicalisma
		@ogrencicalisma = Ogrencicalisma.new(ogrenci_params)	
		if @ogrencicalisma.save
			redirect_to "/gonderinyayinlayalim", notice: "<div class='container'><div class='jumbotron' style='color: #3c763d; background-color: #dff0d8; border-color: #d6e9c6'><h1>Tebrikler!</h1>Çalışmanız başarılı bir şekilde sisteme kaydedilmiştir. Uzman ekibimiz çalışmanızı inceleyip, onaylandıktan sonra çalışmanız en kısa sürede yayınlanacaktır. İyi günler ve iyi çalışmalar dileriz.</div></div>"
		else
			redirect_to "/gonderinyayinlayalim", notice: "<div class='container'><div class='jumbotron' style='color: #a94442; background-color: #f2dede; border-color: #ebccd1'><h1>Üzgünüz!</h1>Formda bulunan adı, soyadı, e-posta ve çalışma açıklama sekmelerinin doldurulması zorunludur. </div></div>"
		end
	end


	def onerivesikayet
		@adisoyadi = params[:adisoyadi]
		@email = params[:email]
		@konu = params[:konu]
		@aciklama = params[:aciklama]
		KullaniciMailer.onerivesikayet_email(@adisoyadi, @email, @konu, @aciklama).deliver_later
	end

	def biliminsanlari
		@digersayfa = Admin::Digersayfa.limit(5).order('id desc')
		@biliminsanlari = Admin::Digersayfa.where(tur: 0).paginate(page: params[:page]).order('created_at DESC')
	end

	def resmievraklar
		@digersayfa = Admin::Digersayfa.limit(5).order('id desc')		
		@resmievraklar = Admin::Digersayfa.where(tur: 1).paginate(page: params[:page]).order('created_at DESC')
	end

	def ilgincbilgiler
		@digersayfa = Admin::Digersayfa.limit(5).order('id desc')	
		@ilgincbilgiler = Admin::Digersayfa.where(tur: 2).paginate(page: params[:page]).order('created_at DESC')
	end

	def motivasyon
		@digersayfa = Admin::Digersayfa.limit(5).order('id desc')	
		@motivasyon = Admin::Digersayfa.where(tur: 3).paginate(page: params[:page]).order('created_at DESC')
	end

	def sinavsistemi
		@digersayfa = Admin::Digersayfa.limit(5).order('id desc')	
		@sinavsistemi = Admin::Digersayfa.where(tur: 4).paginate(page: params[:page]).order('created_at DESC')
	end

	def fotogaleri
		@fotogaleri = Admin::Fotogaleri.paginate(page: params[:page]).order('created_at DESC')		
	end

	def video
		@video = Admin::Video.where(tur: params[:tur]).paginate(page: params[:page]).order('created_at DESC')
	end

	def proje_show
		@proje = Admin::Proje.find(params[:id])
	end

  # --------Denemeler--------
	def deneme
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@deneme =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end
  def deneme_goruntule
    @materyal = Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur]).where(unite_id: params[:unite_id])  
		@unite = params[:uniteadi]
  end
  def deneme_incele
    @materyal = Admin::Materyal.find(params[:id])
    file = @materyal.dosya_file_name
    unless File.exists?(File.dirname(@materyal.dosya.path) + "/" + File.basename(file, File.extname(file)) + "_1.png")
      if ["application/zip","application/x-zip","application/x-zip-compressed"].include?@materyal.dosya.content_type
        Zip::File.open(@materyal.dosya.path) do |zip|
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
  # -------------------------
	def yapraktest
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@yapraktest =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def yazili
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@yazili =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def calismakagitlari
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@calismakagitlari =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def cikmissinavsorulari
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@cikmissinavsorulari =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def kazanimlar
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@kazanimlar =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def yillikplan
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@yillikplan =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def gunlukplan
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@gunlukplan =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

	def bep
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@bep =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

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
