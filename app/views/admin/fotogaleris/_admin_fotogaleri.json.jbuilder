json.extract! admin_fotogaleri, :id, :baslik, :aciklama, :created_at, :updated_at
json.url admin_fotogaleri_url(admin_fotogaleri, format: :json)
