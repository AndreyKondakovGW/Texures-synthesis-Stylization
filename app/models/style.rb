class Style < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates_presence_of :path
end
