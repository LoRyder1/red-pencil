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
    before(:each) do
      @product = Product.new(29)
      @product1 = Product.new(31)
    end

    it 'lasts maximum 30 days' do
      expect(@promotion.valid?(@product)).to eq true
      expect(@promotion.valid?(@product1)).to eq false
    end

    it 'if price reduced further, promo length same' do
      expect(@product.sale_length).to eq 29
      @promotion.reduce_promo_price(5)
      expect(@product.sale_length).to eq 29
    end

    it 'if price increased promo will end immediately' do
      @promotion.increase_promo_price(5)
      expect(@promotion.promo?).to eq false
    end
  end
end
