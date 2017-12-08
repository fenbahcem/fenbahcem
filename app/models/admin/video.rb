class Admin::Video < ApplicationRecord
  searchkick
  validates :videolink, :tur, presence: true
end
