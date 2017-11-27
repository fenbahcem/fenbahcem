class Admin::MateryalsController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_materyal, only: [:show, :edit, :update, :destroy]

  # GET /admin/materyals
  # GET /admin/materyals.json
  def index
    @admin_materyals = Admin::Materyal.where(materyaltur: params[:materyaltur])
  end

  # GET /admin/materyals/1
  # GET /admin/materyals/1.json
  def show
  end

  # GET /admin/materyals/new
  def new
    @admin_materyal = Admin::Materyal.new
	end

  # GET /admin/materyals/1/edit
  def edit
  end

  # POST /admin/materyals
  # POST /admin/materyals.json
  def create
    @admin_materyal = Admin::Materyal.new(admin_materyal_params)

    respond_to do |format|
      if @admin_materyal.save
				
				Admin::Duyuru.create(aciklama: @admin_materyal.created_at.to_s.split(" ")[0] + " " + @admin_materyal.sinif.to_s + ". Sınıf " + @admin_materyal.materyaladi + " materyali eklenmiştir.<a href=" + @admin_materyal.dosya.url + "> İndirmek için tıklayınız. </a>" , tur: 0)
				format.html { redirect_to @admin_materyal, notice: 'Materyal başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_materyal }
      else
        format.html { render :new }
        format.json { render json: @admin_materyal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/materyals/1
  # PATCH/PUT /admin/materyals/1.json
  def update
    respond_to do |format|
      if @admin_materyal.update(admin_materyal_params)
				
				format.html { redirect_to @admin_materyal, notice: 'Materyal başarılı bir şekilde güncellendi.' }
        format.json { render :show, status: :ok, location: @admin_materyal }
      else
        format.html { render :edit }
        format.json { render json: @admin_materyal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/materyals/1
  # DELETE /admin/materyals/1.json
  def destroy
		@tur = @admin_materyal.materyaltur
    @admin_materyal.destroy
		@materyaltur = {0 => "konuanlatimi", 1 => "yapraktest", 2 => "denemesinavlari", 3 => "yazililar", 4 =>  "calismakagitlari", 5 => "cikmissinavsorulari", 6 => "kazanimlar", 7 => "yillikplan", 8 => "gunlukplan", 9 => "bep" }
    respond_to do |format|
			format.html { redirect_to "/admin/" + @materyaltur[@tur], notice: 'Materyal başarılı bir şekilde silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_materyal
      @admin_materyal = Admin::Materyal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_materyal_params
      params.require(:admin_materyal).permit(:sinif, :materyaltur, :materyaladi, :materyalaciklama, :dosya, :unite_id)
    end
end
