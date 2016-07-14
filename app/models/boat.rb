class Boat < ActiveRecord::Base
  has_many :jobs
  belongs_to :user
  validates :name, uniqueness: true
end
