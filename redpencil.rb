
class RedPencil
  def initialize price, promo_price
    @price, @promo_price = price, promo_price
  end

  def promo?
    @price > @promo_price && percent_off > 5
  end

  def percent_off
    (@price - @promo_price)/@price.to_f * 100
  end

end

x = RedPencil.new(100,80)

# p x.percent_off