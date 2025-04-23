class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader

  validates :name, presence: true
  validates :picture, presence: true
end
