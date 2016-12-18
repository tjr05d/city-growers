class Group < ApplicationRecord
  attr_accessor :creator

  has_many :memberships
  has_many :users, through: :memberships
  has_many :products, through: :users

  validates :name, presence: :true
  validates :city, presence: :true
  validates :description, presence: :true

  geocoded_by :city
  after_validation :geocode
  after_create :add_creator

  def add_creator
    self.users << creator
  end

end
