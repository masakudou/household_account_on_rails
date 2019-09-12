class User < ApplicationRecord
  before_save { email.downcase! }
  validates(:name, presence: true, length: { maximum: 20 })
  REGEX_FOR_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: { maximum: 128 }, uniqueness: { case_sensitive: false }, format: { with: REGEX_FOR_VALID_EMAIL })
  has_secure_password
end
