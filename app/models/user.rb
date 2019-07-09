class User < ApplicationRecord
  has_many :articles

  validates :email, uniqueness: true
  has_secure_password
end