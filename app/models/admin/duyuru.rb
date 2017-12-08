class Admin::Duyuru < ApplicationRecord
  validates :aciklama, :tur, presence:true 
end
