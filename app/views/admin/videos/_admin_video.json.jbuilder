json.extract! admin_video, :id, :baslik, :videolink, :tur, :created_at, :updated_at
json.url admin_video_url(admin_video, format: :json)
