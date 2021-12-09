class User < ApplicationRecord
  has_many :style, dependent: :destroy
  validates_presence_of :login,:password
end
