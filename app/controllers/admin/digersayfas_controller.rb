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

    respond_to do |format|
      if @admin_digersayfa.save
        format.html { redirect_to @admin_digersayfa, notice: 'Digersayfa was successfully created.' }
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
