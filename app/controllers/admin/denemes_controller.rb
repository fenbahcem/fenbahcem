class Admin::DenemesController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_deneme, only: [:show, :edit, :update, :destroy]

  # GET /admin/denemes
  # GET /admin/denemes.json
  def index
    @admin_denemes = Admin::Deneme.all
  end

  # GET /admin/denemes/1
  # GET /admin/denemes/1.json
  def show
  end

  # GET /admin/denemes/new
  def new
    @admin_deneme = Admin::Deneme.new
		@unite = Admin::Unite.where(params[:sinif])
  end

  # GET /admin/denemes/1/edit
  def edit
  end

  # POST /admin/denemes
  # POST /admin/denemes.json
  def create
    @admin_deneme = Admin::Deneme.new(admin_deneme_params)

    respond_to do |format|
      if @admin_deneme.save
        format.html { redirect_to @admin_deneme, notice: 'Deneme was successfully created.' }
        format.json { render :show, status: :created, location: @admin_deneme }
      else
        format.html { render :new }
        format.json { render json: @admin_deneme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/denemes/1
  # PATCH/PUT /admin/denemes/1.json
  def update
    respond_to do |format|
      if @admin_deneme.update(admin_deneme_params)
        format.html { redirect_to @admin_deneme, notice: 'Deneme was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_deneme }
      else
        format.html { render :edit }
        format.json { render json: @admin_deneme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/denemes/1
  # DELETE /admin/denemes/1.json
  def destroy
    @admin_deneme.destroy
    respond_to do |format|
      format.html { redirect_to admin_denemes_url, notice: 'Deneme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_deneme
      @admin_deneme = Admin::Deneme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_deneme_params
      params.require(:admin_deneme).permit(:sinif, :uniteadi, :denemeadi, :aciklama, :dosya)
    end
end
