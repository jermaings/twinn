class Order < ApplicationRecord
  belongs_to :food_items
  has_many :foods, through: :food_items
  has_many_attachments :images
end
