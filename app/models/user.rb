class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 , maximum: 72 }

  has_secure_password
end
