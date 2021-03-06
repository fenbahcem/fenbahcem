class Admin::VideosController < ApplicationController
  layout "admin"
	before_action :authenticate_user!
  before_action :set_admin_video, only: [:show, :edit, :update, :destroy]

  # GET /admin/videos
  # GET /admin/videos.json
  def index
		@admin_videos = Admin::Video.paginate(page: params[:page]).order('created_at DESC')
  end

  # GET /admin/videos/1
  # GET /admin/videos/1.json
  def show
  end

  # GET /admin/videos/new
  def new
    @admin_video = Admin::Video.new
  end

  # GET /admin/videos/1/edit
  def edit
  end

  # POST /admin/videos
  # POST /admin/videos.json
  def create
		@videotur = { 0 => ["deney videosu","deneyvideolari"], 1 => ["diğer video","digervideolar"]}
    @admin_video = Admin::Video.new(admin_video_params)

    respond_to do |format|
      if @admin_video.save
				Admin::Duyuru.create(aciklama: @admin_video.created_at.to_s.split(" ")[0] + " " + "Yeni " + @videotur[@admin_video.tur][0] + " eklenmiştir.<a href='/" + @videotur[@admin_video.tur][1] + "/'> Videoyu görüntülemek için tıklayınız. </a>" , tur: 0)
				format.html { redirect_to @admin_video, notice: 'Video başarılı bir şekilde oluşturuldu.' }
        format.json { render :show, status: :created, location: @admin_video }
      else
        format.html { render :new }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/videos/1
  # PATCH/PUT /admin/videos/1.json
  def update
    respond_to do |format|
      if @admin_video.update(admin_video_params)
				format.html { redirect_to @admin_video, notice: 'Video başarılı bir şekilde güncellendi.' }
        format.json { render :show, status: :ok, location: @admin_video }
      else
        format.html { render :edit }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/videos/1
  # DELETE /admin/videos/1.json
  def destroy
    @admin_video.destroy
    respond_to do |format|
			format.html { redirect_to admin_videos_url, notice: 'Video başarılı bir şekilde silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_video
      @admin_video = Admin::Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_video_params
      params.require(:admin_video).permit(:baslik, :videolink, :tur)
    end
end
