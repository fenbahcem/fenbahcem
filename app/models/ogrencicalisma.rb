class Ogrencicalisma < ApplicationRecord
	validates :ad, presence: true
	validates :soyad, presence: true
	validates :email, presence: true
	validates :aciklama, presence: true

	has_attached_file :dosya
	validates_attachment :dosya, content_type: {
		content_type: [
			"application/vnd.ms-excel",
			"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
			"application/pdf",
			"application/msword",
			"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
			"text/plain",
			"image/png",
			"image/jpg",
			"image/jpeg",
			"image/gif",
			"application/zip",
			"application/x-zip",
			"application/rar"

		]
	}
end
