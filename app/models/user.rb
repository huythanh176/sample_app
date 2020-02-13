class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.maximum},
                    format: {with: Settings.user.email.valid},
                    uniqueness: true
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.minimum}
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
end
