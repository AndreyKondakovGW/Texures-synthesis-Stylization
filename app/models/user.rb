class User < ApplicationRecord
  has_many :style, dependent: :destroy
  validates_presence_of :login
  validates_uniqueness_of :login

  has_secure_password
end
