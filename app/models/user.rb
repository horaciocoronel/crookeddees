class User < ApplicationRecord
  has_secure_password
  has_many :appointments

  validates :name, :email, :phone, :password, presence:true
  validates :email, uniqueness: true
end
