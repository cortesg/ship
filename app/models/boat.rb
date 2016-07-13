class Boat < ActiveRecord::Base
  has_many :jobs
  has_many :users
  validates :name, uniqueness: true
end
