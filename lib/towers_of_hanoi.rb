class TowersOfHanoiError < RuntimeError
end

class Game
  attr_accessor :rings, :pegs
  def initialize(rings = 4)
    @rings = rings
    @pegs = Array.new(3){[]}
    @pegs[0] = (@rings.downto(1).to_a)
  end

  def move(array)
    origin, destination = array
    pegs[destination] << pegs[origin].pop
  end

  def check_array_for_errors(array)
    origin, destination = array
    if array.any?{|x| !(0..2).cover?(x)}
      raise TowersOfHanoiError,
        "One or both of your peg numbers is out of bounds."
    end

    if origin == destination
      raise TowersOfHanoiError,
        "You chose the same peg for your origin and destination"
    end

    if pegs[origin].empty?
      raise TowersOfHanoiError,
        "There are no rings for you to move"
    end

    if !pegs[destination].empty?
      if pegs[destination].last < pegs[origin].last
        raise TowersOfHanoiError,
          "You can't put a bigger ring on a smaller ring"
      end
    end

  end

  def check_input_for_errors(string)
    m = string.chomp.match(/\A([0-9]+), ([0-9]+)\z/)
    if m.nil?
      raise TowersOfHanoiError,
        "That input can't be converted into an ordered pair of numbers"
    end
    return m
  end

  def get_move

    begin
      move = gets.chomp
      m = check_input_for_errors(move)
      array = m.map{|x| x.to_i}
      check_array_for_errors(array)
    rescue => e
      puts e.message
      retry
    end

  end

  def play
  end

  def won?

    if pegs[1] == (@rings.downto(1).to_a)
      return true
    elsif pegs[2] == (@rings.downto(1).to_a)
      return true
    end

    return false
  end
end
