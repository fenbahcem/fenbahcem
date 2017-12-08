class Admin::Geneldosya < ApplicationRecord
	has_attached_file :dosya
  searchkick
  validates :sinif, :baslik, :dosya, presence: true
	validates_attachment :dosya, content_type: {
		content_type: [
			"application/vnd.ms-excel",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
			"application/pdf",
			"application/msword",
			"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      "application/vnd.openxmlformats-officedocument.presentationml.presentation",
			"text/plain",
			"image/png",
			"image/jpg",
			"image/jpeg",
			"image/gif",
			"text/html",
			"application/zip",
			"application/x-zip",
      "application/x-zip-compressed"
		]
	}
end
