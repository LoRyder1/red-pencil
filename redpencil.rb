
class RedPencil
  def initialize price, promo_price, stability
    @price, @promo_price, @stability = price, promo_price, stability
  end

  def promo?
    price_larger? && promo_in_range? && stable?
  end

  def stable?
    @stability >= 30  
  end

  def price_larger?
    @price > @promo_price
  end

  def promo_in_range?
    percent_off > 5 && percent_off < 30
  end

  def percent_off
    (@price - @promo_price)/@price.to_f * 100
  end

end

# x = RedPencil.new(100,80,30)

# p x.percent_off