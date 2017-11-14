class Admin::DigersayfasController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_digersayfa, only: [:show, :edit, :update, :destroy]

  # GET /admin/digersayfas
  # GET /admin/digersayfas.json
  def index
    @admin_digersayfas = Admin::Digersayfa.all
  end

  # GET /admin/digersayfas/1
  # GET /admin/digersayfas/1.json
  def show
  end

  # GET /admin/digersayfas/new
  def new
    @admin_digersayfa = Admin::Digersayfa.new
  end

  # GET /admin/digersayfas/1/edit
  def edit
  end

  # POST /admin/digersayfas
  # POST /admin/digersayfas.json
  def create
    @admin_digersayfa = Admin::Digersayfa.new(admin_digersayfa_params)
    @turad = { 0 => "Bilim İnsanları", 1 => "Resmi Evraklar", 2 => "İlginç Bilgiler", 3 => "Motivasyon", 4 => "Sınav Sistemi"}
    @tur = { 0 => "biliminsanlari", 1 => "resmievraklar", 2 => "ilgincbilgiler", 3 => "motivasyon", 4 => "sinavsistemi"}

    respond_to do |format|
      if @admin_digersayfa.save
        Admin::Duyuru.create(aciklama: @admin_digersayfa.created_at.to_s.split(" ")[0] + " " + @turad[@admin_digersayfa.tur] + " " + @admin_digersayfa.baslik + " yazısı eklenmiştir.<a href=/" + @tur[@admin_digersayfa.tur] + "> Yazıya ulaşmak için tıklayınız. </a>", tur: 0)
        format.html { redirect_to @admin_digersayfa, notice: 'Yazı başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_digersayfa }
      else
        format.html { render :new }
        format.json { render json: @admin_digersayfa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/digersayfas/1
  # PATCH/PUT /admin/digersayfas/1.json
  def update
    respond_to do |format|
      if @admin_digersayfa.update(admin_digersayfa_params)
        format.html { redirect_to @admin_digersayfa, notice: 'Digersayfa was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_digersayfa }
      else
        format.html { render :edit }
        format.json { render json: @admin_digersayfa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/digersayfas/1
  # DELETE /admin/digersayfas/1.json
  def destroy
    @admin_digersayfa.destroy
    respond_to do |format|
      format.html { redirect_to admin_digersayfas_url, notice: 'Digersayfa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_digersayfa
      @admin_digersayfa = Admin::Digersayfa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_digersayfa_params
      params.require(:admin_digersayfa).permit(:baslik, :metin, :tur, :dosya) 
    end
end
