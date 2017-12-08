class Admin::Proje < ApplicationRecord
	self.per_page = 6	
  searchkick
  validates :projeadi, :projeaciklama, :nasil, :sonuc, :ek, presence: true
	has_attached_file :ek
	validates_attachment :ek, content_type: {
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
 
  def default_baskiisleri
    self.baskiisleri ||= ""
  end
end
