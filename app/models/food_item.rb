    class FoodItem < ApplicationRecord
  belongs_to :food, foreign_key: 'food_id'
  has_many :condiments, foreign_key: 'food_items_id'
  has_many :orders
  has_one_attached :image
end
