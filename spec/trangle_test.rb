require_relative "../trangle"

RSpec.describe 'Trangle' do
  it "expects 3 equal vars to return :equilateral" do
    expect(classify(3, 3, 3)).to eq(:equilateral)
  end
end
