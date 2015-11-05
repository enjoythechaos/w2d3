require_relative 'stock_picker'

test_array = Array.new(10_000){rand(10_001)}

t1 = Time.now
first_result = stock_picker_linear(test_array)
t2 = Time.now
second_result = stock_picker_quadratic(test_array)
t3 = Time.now

time_of_linear = t2 - t1
time_of_quadratic = t3 - t2

puts "Time of the linear algorithm was #{time_of_linear}"
puts "Time of the quadratic algorithm was #{time_of_quadratic}"
