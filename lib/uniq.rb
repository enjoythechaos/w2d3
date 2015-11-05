class Array
  def my_uniq
    h = Hash.new { |h, k| h[k] = 0}

    self.each do |el|
      h[el] += 1
    end

    h.keys

  end
end
