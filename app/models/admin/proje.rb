class Admin::Proje < ApplicationRecord
	self.per_page = 6	
	has_attached_file :ek
	validates_attachment :ek, content_type: {
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
