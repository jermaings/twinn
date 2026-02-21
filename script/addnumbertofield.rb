i = 1
Food.find_each do |food_item|
  food_item.update(food_items_id: i)
  i += 1
end
