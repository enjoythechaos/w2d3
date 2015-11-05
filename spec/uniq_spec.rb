require 'uniq'

describe "Array" do
  describe "#my_uniq" do
    it "removes duplicates from a simple example" do
      expect([1, 2, 2, 3, 3, 4].my_uniq).to eq([1, 2, 3, 4])
    end

    it "returns array if there are no duplicates" do
      expect([1, 2, 3, 4].my_uniq).to eq([1, 2, 3, 4])
    end

    it "returns elements in the right order even if the duplicates aren't next to each other" do
      expect([1, 2, 1, 3].my_uniq).to eq([1, 2, 3])
    end

    it "works on an empty array" do
      expect([].my_uniq).to eq([])
    end

    it "works on a single element array" do
      expect([1].my_uniq).to eq([1])
    end
  end


end
