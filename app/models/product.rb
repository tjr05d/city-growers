class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: :true
  validates :price, presence: :true
  validates :grow_rate, presence: :true

end
