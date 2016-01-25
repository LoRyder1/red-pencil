require_relative 'redpencil'

describe RedPencil do
  before(:each) do 
    @promotion = RedPencil.new(100,80)
    @promotion1 = RedPencil.new(100,98)
    @promotion2 = RedPencil.new(100,68)
  end

  describe 'promotion begin' do
    it 'because of reduction of price' do
      expect(@promotion.promo?).to eq true
    end

    it 'with at least 5% reduction?' do
      expect(@promotion1.promo?).to eq false
    end

    it 'but no more than 30% reduction' do
      expect(@promotion2.promo?).to eq false
    end
  end
end