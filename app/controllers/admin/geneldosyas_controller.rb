class Admin::GeneldosyasController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_geneldosya, only: [:show, :edit, :update, :destroy]

  # GET /admin/geneldosyas
  # GET /admin/geneldosyas.json
  def index
    @admin_geneldosyas = Admin::Geneldosya.all
  end

  # GET /admin/geneldosyas/1
  # GET /admin/geneldosyas/1.json
  def show
  end

  # GET /admin/geneldosyas/new
  def new
    @admin_geneldosya = Admin::Geneldosya.new
  end

  # GET /admin/geneldosyas/1/edit
  def edit
  end

  # POST /admin/geneldosyas
  # POST /admin/geneldosyas.json
  def create
    @admin_geneldosya = Admin::Geneldosya.new(admin_geneldosya_params)

    respond_to do |format|
      if @admin_geneldosya.save
        format.html { redirect_to @admin_geneldosya, notice: 'Geneldosya was successfully created.' }
        format.json { render :show, status: :created, location: @admin_geneldosya }
      else
        format.html { render :new }
        format.json { render json: @admin_geneldosya.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/geneldosyas/1
  # PATCH/PUT /admin/geneldosyas/1.json
  def update
    respond_to do |format|
      if @admin_geneldosya.update(admin_geneldosya_params)
        format.html { redirect_to @admin_geneldosya, notice: 'Geneldosya was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_geneldosya }
      else
        format.html { render :edit }
        format.json { render json: @admin_geneldosya.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/geneldosyas/1
  # DELETE /admin/geneldosyas/1.json
  def destroy
    @admin_geneldosya.destroy
    respond_to do |format|
      format.html { redirect_to admin_geneldosyas_url, notice: 'Geneldosya was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_geneldosya
      @admin_geneldosya = Admin::Geneldosya.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_geneldosya_params
      params.require(:admin_geneldosya).permit(:baslik, :sinif, :dosya)
    end
end
