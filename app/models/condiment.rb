class Condiment < ApplicationRecord
  belongs_to :food_item, foreign_key: 'condiments_id'
end
