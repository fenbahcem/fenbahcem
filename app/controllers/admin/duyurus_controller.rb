class Admin::DuyurusController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_duyuru, only: [:show, :edit, :update, :destroy]

  # GET /admin/duyurus
  # GET /admin/duyurus.json
  def index
    @admin_duyurus = Admin::Duyuru.all
  end

  # GET /admin/duyurus/1
  # GET /admin/duyurus/1.json
  def show
  end

  # GET /admin/duyurus/new
  def new
    @admin_duyuru = Admin::Duyuru.new
  end

  # GET /admin/duyurus/1/edit
  def edit
  end

  # POST /admin/duyurus
  # POST /admin/duyurus.json
  def create
    @admin_duyuru = Admin::Duyuru.new(admin_duyuru_params)

    respond_to do |format|
      if @admin_duyuru.save
				format.html { redirect_to @admin_duyuru, notice: 'Duyuru başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_duyuru }
      else
        format.html { render :new }
        format.json { render json: @admin_duyuru.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/duyurus/1
  # PATCH/PUT /admin/duyurus/1.json
  def update
    respond_to do |format|
      if @admin_duyuru.update(admin_duyuru_params)
				format.html { redirect_to @admin_duyuru, notice: 'Duyuru başarılı bir şekilde güncellendi.' }
        format.json { render :show, status: :ok, location: @admin_duyuru }
      else
        format.html { render :edit }
        format.json { render json: @admin_duyuru.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/duyurus/1
  # DELETE /admin/duyurus/1.json
  def destroy
    @admin_duyuru.destroy
    respond_to do |format|
			format.html { redirect_to admin_duyurus_url, notice: 'Duyuru başarılı bir şekilde silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_duyuru
      @admin_duyuru = Admin::Duyuru.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_duyuru_params
      params.require(:admin_duyuru).permit(:aciklama, :tur)
    end
end
