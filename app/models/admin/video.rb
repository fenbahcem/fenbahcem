class Admin::Video < ApplicationRecord
  validates :videolink, :tur, presence: true
end
