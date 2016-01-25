
class RedPencil
  def initialize price, promo_price
    @price, @promo_price = price, promo_price
  end

  def promo?
    @price > @promo_price
  end
end