class AdminController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  def index
  end
	def ogrencicalisma
		@ogrencicalisma = Ogrencicalisma.paginate(page: params[:page]).order('created_at DESC')
	end
end
