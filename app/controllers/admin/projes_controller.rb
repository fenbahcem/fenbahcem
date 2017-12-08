class Admin::ProjesController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_proje, only: [:show, :edit, :update, :destroy]

  # GET /admin/projes
  # GET /admin/projes.json
  def index
		@admin_projes = Admin::Proje.all.order('created_at DESC')
  end

  # GET /admin/projes/1
  # GET /admin/projes/1.json
  def show
  end

  # GET /admin/projes/new
  def new
    @admin_proje = Admin::Proje.new
  end

  # GET /admin/projes/1/edit
  def edit
  end

  # POST /admin/projes
  # POST /admin/projes.json
  def create
    @admin_proje = Admin::Proje.new(admin_proje_params)

    respond_to do |format|
      if @admin_proje.save
				Admin::Duyuru.create(aciklama: @admin_proje.created_at.to_s.split(" ")[0] + " " +  @admin_proje.projeadi + " projesi eklenmiştir.<a href='/bilimfuari/proje/" + @admin_proje.id.to_s + "'> Projeyi görüntülemek için tıklayınız. </a>" , tur: 0)
				format.html { redirect_to @admin_proje, notice: 'Proje başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_proje }
      else
        format.html { render :new }
        format.json { render json: @admin_proje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/projes/1
  # PATCH/PUT /admin/projes/1.json
  def update
    respond_to do |format|
      if @admin_proje.update(admin_proje_params)
				format.html { redirect_to @admin_proje, notice: 'Proje başarılı bir şekilde güncellendi.' }
        format.json { render :show, status: :ok, location: @admin_proje }
      else
        format.html { render :edit }
        format.json { render json: @admin_proje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/projes/1
  # DELETE /admin/projes/1.json
  def destroy
    @admin_proje.destroy
    respond_to do |format|
			format.html { redirect_to admin_projes_url, notice: 'Proje başarılı bir şekilde silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_proje
      @admin_proje = Admin::Proje.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_proje_params
      params.require(:admin_proje).permit(:projeadi, :projeaciklama, :nasil, :sonuc, :ek, :baskiisleri)
    end
end
