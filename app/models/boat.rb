class Boat < ActiveRecord::Base
  has_many :jobs
  belongs_to :user
  validates :name, uniqueness: true
  validates :location, presence: true

  has_attached_file :avatar, 
  	styles: { medium: "300x300>", thumb: "100x100>" }, 
  	default_url: "/images/:style/missing.png" 
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

