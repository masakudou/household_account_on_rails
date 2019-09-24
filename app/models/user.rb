class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  mount_uploader :img, ImgUploader
  mount_uploader :header_image, HeaderImageUploader
  validates(:name, presence: true, length: { maximum: 20 })
  REGEX_FOR_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: { maximum: 128 }, uniqueness: { case_sensitive: false }, format: { with: REGEX_FOR_VALID_EMAIL })
  validates(:password, presence: true, length: { minimum: 8 }, allow_nil: true)
  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def set_remember_digest
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def login_cookie_forget
    update_attribute(:remember_digest, nil)
  end
end
