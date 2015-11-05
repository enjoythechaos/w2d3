require 'transpose'

describe 'Array' do
  describe '#my_transpose' do
    let(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    let(:array_transpose) { [[1, 4, 7], [2, 5, 8], [3, 6, 9]]}

    it "transposes a 3x3 matrix correctly" do
      expect(array.my_transpose).to eq(array_transpose)
    end

    it "transposes a 1x1 matrix correctly" do
      array = [[1]]
      expect(array.my_transpose).to eq(array)
    end

    it "transposes rectangular matrices" do
      array = [[1,2,3],[4,5,6]]
      expect(array.my_transpose).to eq([[1,4],[2,5],[3,6]])
    end

    it "works on an array containing only an empty array" do
      expect([[]].my_transpose).to eq([])
    end

    it "works on a truly empty array" do
      expect([].my_transpose).to eq([])
    end
  end
end
