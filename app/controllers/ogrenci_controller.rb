class OgrenciController < ApplicationController
	layout "app-other", only: [:bilimfuari, :proje_show, :fotogaleri, :video]  
	helper_method :sayac
	
	def index
		@duyuru = Admin::Duyuru.where(tur:0).order('created_at DESC')
		@haber = Admin::Duyuru.where(tur:1).order('created_at DESC')
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
	
	def fotogaleri
		@fotogaleri = Admin::Fotogaleri.paginate(page: params[:page]).order('created_at DESC')		
	end

	def video
		@video = Admin::Video.where(tur: params[:tur]).paginate(page: params[:page]).order('created_at DESC')
	end

	def proje_show
		@proje = Admin::Proje.find(params[:id])
	end

	def deneme
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@deneme =  Admin::Materyal.where(sinif: params[:sinif]).where(materyaltur: params[:materyaltur])
		@unitesinif = params[:sinif]
	end

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

end
