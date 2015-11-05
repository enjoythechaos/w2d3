require 'towers_of_hanoi'

describe "Towers of Hanoi" do
  context "#initialize" do

    let(:brand_new_game) { Game.new }
    it "makes sure it initializes with the right number of pegs" do
      expect(brand_new_game.pegs.size).to eq(3)
    end

    it "makes sure it defaults to 4 rings" do
      expect(brand_new_game.pegs[0].size).to eq(4)
    end

    let(:non_standard_game) { Game.new(19) }
    it "allows you to set up a game with a number of rings other than 4" do
      expect(non_standard_game.pegs[0].size).to eq(19)
    end

    it "initializes with the necessary instance variables" do
      [:@pegs, :@rings].each do |variable|
        expect(brand_new_game.instance_variable_get(variable)).to_not be(nil)
      end
    end

    it "doesn't have rings in the second or third peg" do
      [1, 2].each do |peg_index|
        expect(brand_new_game.pegs[peg_index].empty?).to be_truthy
      end
    end

    it "make sure the rings are in order on the first peg when initialized" do
      first_peg = brand_new_game.instance_variable_get(:@pegs).first
      expect(first_peg).to eq(first_peg.sort { |x, y| y <=> x })
    end

  end

  describe "#move" do

    let(:new_game) { Game.new }

    it "correctly moves a ring from peg 1 to peg 2" do
      first = [[4, 3, 2], [1], []]
      new_game.move([0, 1])
      expect(new_game.pegs).to eq(first)
    end

    it "correctly moves a ring from peg 1 to peg 3" do
      second = [[4, 3, 2], [], [1]]
      new_game.move([0, 2])
      expect(new_game.pegs).to eq(second)
    end
  end

  # describe "#check_array_for_errors" do
  #
  #   let(:g) { Game.new }
  #   it "Raises an out of bounds error when passed an invalid peg number" do
  #     expect{ g.move([3, 0]) }.to raise_error(TowersOfHanoiError)
  #   end
  #
  #   it "Raises an error when you choose the same peg for both origin and destination" do
  #     expect{ g.move([0, 0]) }.to raise_error(TowersOfHanoiError)
  #   end
  #
  #   it "Doesn't raise an error when a correct move is made" do
  #     expect{ g.move([0, 1]) }.to_not raise_error
  #   end
  #
  #   let(:game_in_progress) do
  #     game_in_progress = Game.new
  #     game_in_progress.pegs = [[2, 1], [3], [4]]
  #     game_in_progress
  #   end
  #
  #   it "Doesn't let you move a larger ring onto a smaller ring" do
  #     expect{ game_in_progress.move([2, 1])}.to raise_error(TowersOfHanoiError)
  #   end
  #
  # end

  describe "#check_array_for_errors" do
    g = Game.new

    # g.stub(:get_move) do |fake_input|
    #   move = fake_input
    #   m = check_input_for_errors(move)
    #   array = m.map{|x| x.to_i}
    #   check_array_for_errors(array)
    # end


    it "doesn't let you move a large ring on to a small ring" do
      allow(g).to receive(:get_move) do |fake_input|
        m = g.check_input_for_errors(fake_input)
        if m.nil?
          raise TowersOfHanoiError,
            "That is not a valid input string"
        end
        array = fake_input.chomp.split(", ").map{|x| x.to_i}
        g.check_array_for_errors(array)
        g.move(array)
      end
      g.pegs = [[2, 1], [3], [4]]
      #g.get_move("0, 1")
      # expect(g.pegs[1].size).to eq(1)
      expect{ g.get_move("2, 1") }.to raise_error(TowersOfHanoiError)
      # expect{g.get_move("foobar")}.to raise_error(TowersOfHanoiError)
    end


  end

  describe "#get_move" do
  end

  describe "#play" do
  end

  describe "#won?" do
    first_game = Game.new

    first_configuration = [[4, 3, 2, 1], [], []]
    second_configuration = [[], [4, 3, 2, 1], []]
    third_configuration = [[], [], [4, 3, 2, 1]]
    random_configuration = [[3, 2], [4], [1]]
    pathological_configuration = [[], [3, 2, 4, 1], []]

    it "doesn't think the game is over in the first configuration" do
      first_game.pegs = first_configuration
      expect(first_game.won?).to be_falsey
    end

    it "recognizes that the game is over because
        all the rings are on the second peg in order" do
      first_game.pegs = second_configuration
      expect(first_game.won?).to be_truthy
    end

    it "recognizes that the game is over because
        all the rings are on the third peg in order" do
      first_game.pegs = third_configuration
      expect(first_game.won?).to be_truthy
    end

    it "doesn't prematurely say that the game is over" do
      first_game.pegs = random_configuration
      expect(first_game.won?).to be_falsey
    end

    it "doesn't fall for a pathological case" do
      first_game.pegs = pathological_configuration
      expect(first_game.won?).to be_falsey
    end

  end

end
