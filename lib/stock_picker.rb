def stock_picker_linear(array)
  index_of_minimum_up_til_now = nil
  max_profit = -1.0 / 0.0
  best_days = [nil, nil]
  array.each_with_index do |element, index|
    if index_of_minimum_up_til_now
      if element - array[index_of_minimum_up_til_now]
        max_profit = element - array[index_of_minimum_up_til_now]
        best_days = [index_of_minimum_up_til_now, index]
      end
      if element < array[index_of_minimum_up_til_now]
        index_of_minimum_up_til_now = index
      end
    else
      index_of_minimum_up_til_now = index
    end
  end

  best_days
end

def stock_picker_quadratic(array)
  if array.size <= 1
    return []
  end

  max_profit = -1.0/0.0
  best_days = [nil, nil]
  (0..array.size - 2).each do |first_day|
    ((first_day + 1)..(array.size - 1)).each do |second_day|
      this_profit = array[second_day] - array[first_day]
      if this_profit > max_profit
        best_days = [first_day, second_day]
      end
    end
  end

  best_days
end
