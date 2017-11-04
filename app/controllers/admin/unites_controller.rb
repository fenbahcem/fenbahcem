class Admin::UnitesController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_unite, only: [:show, :edit, :update, :destroy]

  # GET /admin/unites
  # GET /admin/unites.json
  def index
    @admin_unites = Admin::Unite.all
  end

  # GET /admin/unites/1
  # GET /admin/unites/1.json
  def show
  end

  # GET /admin/unites/new
  def new
    @admin_unite = Admin::Unite.new
  end

  # GET /admin/unites/1/edit
  def edit
  end

  # POST /admin/unites
  # POST /admin/unites.json
  def create
    @admin_unite = Admin::Unite.new(admin_unite_params)

    respond_to do |format|
      if @admin_unite.save
				format.html { redirect_to @admin_unite, notice: 'Ünite başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_unite }
      else
        format.html { render :new }
        format.json { render json: @admin_unite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/unites/1
  # PATCH/PUT /admin/unites/1.json
  def update
    respond_to do |format|
      if @admin_unite.update(admin_unite_params)
        format.html { redirect_to @admin_unite, notice: 'Ünite başarılı bir şekilde güncellendi.' }
        format.json { render :show, status: :ok, location: @admin_unite }
      else
        format.html { render :edit }
        format.json { render json: @admin_unite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/unites/1
  # DELETE /admin/unites/1.json
  def destroy
    @admin_unite.destroy
    respond_to do |format|
			format.html { redirect_to admin_unites_url, notice: 'Ünite başarılı bir şekilde silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_unite
      @admin_unite = Admin::Unite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_unite_params
      params.require(:admin_unite).permit(:uniteadi, :aciklama, :sinif, :uniteresmi)
    end
end
