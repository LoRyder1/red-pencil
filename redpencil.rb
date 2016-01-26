
class RedPencil
  def initialize price, promo_price, stability
    @price, @promo_price, @stability = price, promo_price, stability
    @price_increase = false
  end

  def promo?
    price_larger? && promo_in_range? && stable? && !@price_increase
  end

  def valid? product
    product.sale_length < 30  
  end

  def reduce_promo_price amount
    @promo_price -= amount  
  end

  def increase_promo_price amount
    @promo_price += amount
    @price_increase = true
  end

  private

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

class Product
  attr_reader :sale_length
  def initialize sale_length
    @sale_length = sale_length
  end
end
# x = RedPencil.new(100,80,30)

# p x.percent_off