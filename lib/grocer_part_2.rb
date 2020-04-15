require_relative './part_1_solution.rb'
require "pry"
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    if item_with_coupon != nil and item_with_coupon[:count] >= coupon[:num]
      cart << { item: "#{item_with_coupon[:item]} W/COUPON",
      price: coupon[:cost] / coupon[:num],
      clearance: item_with_coupon[:clearance],
      count: coupon[:num] }
      item_with_coupon[:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item|
    if item[:clearance]
       item[:price] *= 0.8
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |item|
    total += item[:price] * item[:count]
  end
  if total > 100
    total *= 0.9

  end
  total.round(2)

end
