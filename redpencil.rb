
class RedPencil
  def initialize price, promo_price
    @price, @promo_price = price, promo_price
  end

  def promo?
    @price > @promo_price && promo_in_range?
  end

  def promo_in_range?
    percent_off > 5 && percent_off < 30
  end

  def percent_off
    (@price - @promo_price)/@price.to_f * 100
  end

end

x = RedPencil.new(100,80)

# p x.percent_off