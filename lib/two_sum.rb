class Array
  def two_sum
    result = []
    self.each_with_index do |element, first_index|
      ((first_index + 1)...self.size).each do |second_index|
        if element + self[second_index] == 0
          result << [first_index, second_index]
        end
      end
    end

    result
  end
end
