class Admin::Unite < ApplicationRecord
	has_many :konuanlatimi
	has_many :materyal
	has_attached_file :uniteresmi, styles: { thumb: "180x114#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :uniteresmi, content_type: /\Aimage\/.*\z/i	
end
