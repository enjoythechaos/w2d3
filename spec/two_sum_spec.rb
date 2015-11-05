require 'two_sum'

describe "Array" do
  describe "#two_sum" do
    # let(:array) { [-1, 0, 2, -2, 1] }
    # let(:array_answer) { [[0, 4], [2, 3]] }
    it "returns the correct indices" do
      array = [-1, 0, 2, -2, 1]
      array_answer = [[0, 4], [2, 3]]
      expect(array.two_sum).to eq(array_answer)
    end

    # it "shows us a little more about how scope, expect, and errors work" do
    #   expect{ array }.to raise_error(NameError)
    # end

    it "works on a one element array" do
      one_element_array = [1]
      expect(one_element_array.two_sum).to eq([])
    end

    it "works on an empty array" do
      empty_array = []
      expect(empty_array.two_sum).to eq([])
    end
  end
end
