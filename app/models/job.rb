class Job < ActiveRecord::Base
  belongs_to :boat
  validates :cargo, :length => { minimum: 50 }
  validates :cost, numericality: { only_integer: true, greater_than: 1000 }
  validates :name, uniqueness: true 
end
