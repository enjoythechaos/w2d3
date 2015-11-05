class TestError < RuntimeError
end

begin
  puts "Please enter your move."
  move = gets.chomp
  if move == ""
    puts "We got to the error part..."
    raise TestError, "input was empty"
  end
  puts move.upcase
rescue
  puts $stderr.to_s
  retry
end
