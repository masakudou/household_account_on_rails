class User < ApplicationRecord
  before_save { email.downcase! }
  mount_uploader :img, ImgUploader
  mount_uploader :header_image, HeaderImageUploader
  validates(:name, presence: true, length: { maximum: 20 })
  REGEX_FOR_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: { maximum: 128 }, uniqueness: { case_sensitive: false }, format: { with: REGEX_FOR_VALID_EMAIL })
  validates(:password, presence: true, length: { minimum: 8 })
  has_secure_password
end
