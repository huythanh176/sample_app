class User < ApplicationRecord
  attr_accessor :remember_token
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.maximum},
                    format: {with: Settings.user.email.valid},
                    uniqueness: true
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.minimum},
                       allow_nil: true
  before_save :mail
  has_secure_password

  def mail
    email.downcase!
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end
end
