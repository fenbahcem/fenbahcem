class OgrenciController < ApplicationController
	layout "app-other", only: [:bilimfuari, :proje_show]  
	def index
  end
	
	def uniteler
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@unitesinif = params[:sinif]
	end
	
	def unite_konu
		@konu = Admin::Konuanlatimi.where(sinif: params[:sinif]).where(uniteadi: params[:uniteadi]) 
		@unite_konu = params[:uniteadi]
	end
	
	def konuanlatimi_incele
		@konuanlatimi = Admin::Konuanlatimi.find(params[:id])
		@unite_konu = params[:uniteadi]
	end
	
	def deneme_uniteler
		@unite = Admin::Unite.where(sinif: params[:sinif])
		@deneme =  Admin::Deneme.where(sinif: params[:sinif])
		@unitesinif = params[:sinif]
	end

	def bilimfuari
		@proje = Admin::Proje.all
	end

	def proje_show
		@proje = Admin::Proje.find(params[:id])
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

end
