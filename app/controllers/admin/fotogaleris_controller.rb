class Admin::FotogalerisController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_fotogaleri, only: [:show, :edit, :update, :destroy]

  # GET /admin/fotogaleris
  # GET /admin/fotogaleris.json
  def index
		@admin_fotogaleris = Admin::Fotogaleri.paginate(page: params[:page]).order('created_at DESC')
  end

  # GET /admin/fotogaleris/1
  # GET /admin/fotogaleris/1.json
  def show
  end

  # GET /admin/fotogaleris/new
  def new
    @admin_fotogaleri = Admin::Fotogaleri.new
  end

  # GET /admin/fotogaleris/1/edit
  def edit
  end

  # POST /admin/fotogaleris
  # POST /admin/fotogaleris.json
  def create
    @admin_fotogaleri = Admin::Fotogaleri.new(admin_fotogaleri_params)

    respond_to do |format|
      if @admin_fotogaleri.save
				Admin::Duyuru.create(aciklama: @admin_fotogaleri.created_at.to_s.split(" ")[0] + " " + "Yeni resim eklenmiştir.<a href='/fotogaleri/'> Fotogaleriyi görüntülemek için tıklayınız. </a>" , tur: 0)
				format.html { redirect_to @admin_fotogaleri, notice: 'Resim başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_fotogaleri }
      else
        format.html { render :new }
        format.json { render json: @admin_fotogaleri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/fotogaleris/1
  # PATCH/PUT /admin/fotogaleris/1.json
  def update
    respond_to do |format|
      if @admin_fotogaleri.update(admin_fotogaleri_params)
				format.html { redirect_to @admin_fotogaleri, notice: 'Resim başarılı bir şekilde güncellendi.' }
        format.json { render :show, status: :ok, location: @admin_fotogaleri }
      else
        format.html { render :edit }
        format.json { render json: @admin_fotogaleri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/fotogaleris/1
  # DELETE /admin/fotogaleris/1.json
  def destroy
    @admin_fotogaleri.destroy
    respond_to do |format|
			format.html { redirect_to admin_fotogaleris_url, notice: 'Resim başarılı bir şekilde silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_fotogaleri
      @admin_fotogaleri = Admin::Fotogaleri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_fotogaleri_params
      params.require(:admin_fotogaleri).permit(:baslik, :resim, :anasayfabaglantisi)
    end
end
