require 'stock_picker'

describe "#stock_picker" do
  random_stock_prices = Array.new(1_000){rand(10_001)}
  t1 = Time.now

  let(:stock_prices) {[25, 62, 100, 10, 90]}

  it "returns the best buying and selling days (with buying day < selling day)" do
    expect(stock_picker(stock_prices)).to eq([3, 4])
  end

  # it "makes sure it doesn't return any pair that gives you a profit"
  # end

  # it "doesn't simply return the difference between the smallest and largest elements in the array, ignoring their sequence"
  # end


end
