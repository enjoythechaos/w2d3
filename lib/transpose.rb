class Array
  def my_transpose
    if self.empty?
      return []
    end
    self.take(1).first.zip(*self.drop(1))
  end
end
