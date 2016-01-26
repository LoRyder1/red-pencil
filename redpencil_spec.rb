require_relative 'redpencil'

describe RedPencil do
  before(:each) do 
    @promotion = RedPencil.new(100,80,31)
    @promotion1 = RedPencil.new(100,98,31)
    @promotion2 = RedPencil.new(100,68,31)
    @promotion3 = RedPencil.new(100,68,29)
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

    it 'if discount stablility > 30 days' do
      expect(@promotion3.promo?).to eq false
    end
  end

  describe 'product promotion' do
    it 'lasts maximum 30 days' do
      @product = Product.new(29)
      @product = Product.new(31)
      expect(@promotion.valid(@product)).to eq true
      expect(@promotion.valid(@product)).to eq false
    end
  end
end