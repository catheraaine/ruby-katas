require_relative "../lib/triangle"

RSpec.describe Triangle do

  context 'when there are three equal sides' do
    it "is Equilateral" do
      equilateral_triangle = Triangle.new(4, 4, 4)
      expect(equilateral_triangle).to be_equilateral
    end

    it 'is not Isosceles' do
      isosceles_triangle = Triangle.new(3, 3, 4)
      expect(isosceles_triangle).to_not be_equilateral
    end

    it 'has a type of Equilateral' do
      equilateral_triangle = Triangle.new(4, 4, 4)
      expect(equilateral_triangle.type).to eq(:equilateral)
    end

  end

  context 'when only two sides are equal' do
    it 'is Isosceles' do
      isosceles_triangle = Triangle.new(3, 3, 4)
      expect(isosceles_triangle).to be_isosceles
    end

    it 'is not Equilateral' do
      equilateral_triangle = Triangle.new(4, 4, 4)
      expect(equilateral_triangle).to_not be_isosceles
    end

    it 'has a type of Isosceles' do
      isosceles_triangle = Triangle.new(3, 3, 4)
      expect(isosceles_triangle.type).to eq(:isosceles)
    end
  end

  context 'when no sides are equal' do
    it 'is Scalene' do
      scalene_triangle = Triangle.new(2, 3, 4)
      expect(scalene_triangle).to be_scalene
    end

    it 'has a type of Scalene' do
      scalene_triangle = Triangle.new(2, 3, 4)
      expect(scalene_triangle.type).to eq(:scalene)
    end
  end

  context 'when any side is less than or equal to zero' do
    it 'raises an error' do
      expect {Triangle.new(1, 0, 1)}.to raise_error(TriangleError)
    end
  end

  context 'when the sum of two sides is less than the third side' do
    it 'raises an error' do
      expect {Triangle.new(42,5,2)}.to raise_error(TriangleError)
    end
  end


end
