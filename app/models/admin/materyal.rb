class Admin::Materyal < ApplicationRecord
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
			"application/rar"

		]
	}
end
