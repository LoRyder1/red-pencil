require_relative 'redpencil'

describe RedPencil do
  before(:each) do 
    @promotion = RedPencil.new(100,80)
  end

  describe 'promotion begin' do
    it 'because of reduction of price' do
      expect(@promotion.promo?).to eq true
    end

    it 'with at least 5% reduction?' do
      @promotion = RedPencil.new(100,98) 
      expect(@promotion.promo?).to eq false
    end
  end
end