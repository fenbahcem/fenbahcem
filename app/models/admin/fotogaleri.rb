class Admin::Fotogaleri < ApplicationRecord
	has_attached_file :resim, styles: { thumb: "100x100#" }
	validates_attachment :resim, content_type: {
		content_type: [
			"image/png",
			"image/jpg",
			"image/jpeg",
			"image/gif"
		]
	}
end
