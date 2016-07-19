class Boat < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  has_many :user, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy 
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follower(other)
    active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end


  validates :name, uniqueness: true
  validates :location, presence: true

  has_attached_file :avatar, 
  	styles: { medium: "300x300>", thumb: "100x100>" }, 
  	default_url: "/images/:style/missing.png" 
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

