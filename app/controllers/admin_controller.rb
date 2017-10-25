class AdminController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  def index
  end
	def yapraktest
		@yapraktest = Admin::Materyal.where(materyaltur: 1)
	end
end
