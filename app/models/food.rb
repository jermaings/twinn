class Food < ApplicationRecord
  has_many :food_types, dependent: :destroy
  has_many :food_items, dependent: :destroy, foreign_key: 'food_id'
  has_one_attached :image
 end
