class User < ApplicationRecord
  has_secure_password

  validates :name, :nickname, :email, :password_digest, presence: true
end
