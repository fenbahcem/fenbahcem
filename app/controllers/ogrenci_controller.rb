class OgrenciController < ApplicationController
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
end
