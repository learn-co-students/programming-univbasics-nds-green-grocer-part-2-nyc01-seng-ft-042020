require_relative './part_1_solution.rb'
# def apply_coupons(cart, coupons) #this seems to work but not passing
  # Consult README for inputs and outputs
  # new_cart = consolidate_cart(cart)
  #  new_cart.clone.each do |product_hash|
  #   coupons.each do |coupon_hash|
  #     if product_hash[:item] == coupon_hash[:item] && product_hash[:count] % coupon_hash[:num] == 0 && product_hash[:count] > 1
  #       product_hash[:item] = "#{product_hash[:item]} W/COUPON" ##{product_hash[:item]}
  #       v = product_hash[:count] / coupon_hash[:num]
  #       product_hash[:price] = coupon_hash[:cost] * v#/ v / product_hash[:count]
  #     elsif product_hash[:item] == coupon_hash[:item] && product_hash[:count] % coupon_hash[:num] != 0 && product_hash[:count] > 1
  #       temp_hash = {}
  #       temp_hash.merge!(product_hash)
  #       temp_hash[:count] = 1
  #
  #
  #       product_hash[:count] -=  1
  #       if product_hash[:item] == coupon_hash[:item] && product_hash[:count] % coupon_hash[:num] == 0 && product_hash[:count] > 1
  #         product_hash[:item] = "#{product_hash[:item]} W/COUPON"
  #         v = product_hash[:count] / coupon_hash[:num]
  #         product_hash[:price] = coupon_hash[:cost] * v
  #       end
  #       new_cart << temp_hash
  #     end
  #
  #   end
  # end
  #
  #  p new_cart
# end

def apply_coupons(cart, coupons)
  counter = 0 #passing but error no method >= for nil class
   while counter < coupons.length
     cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
     couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
     cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name,cart)
     if cart_item&& cart_item[:count] >= coupons[counter][:num]
       if cart_item_with_coupon
          cart_item_with_coupon[:count] += coupons[count][:num]
          cart_item[:count] -= coupons[counter][:num]
        else
          cart_item_with_coupon = {
            :item => couponed_item_name,
            :price => coupons[counter][:cost] / coupons[counter][:num],
            :count => coupons[counter][:num],
            :clearance => cart_item[:clearance]
          }
       cart << cart_item_with_coupon
       cart_item[:count] -= coupons[counter][:num]
     end
   end
   counter += 1
 end
 cart
 end

def apply_clearance(cart)
cart.each do |item_hash|
  if item_hash[:clearance] == true
    item_hash[:price] -= item_hash[:price] * 0.2
  end
end
cart

end

def checkout(cart, coupons)
consolidate_cart = consolidate_cart(cart)
couponed_cart = apply_coupons(consolidate_cart, coupons)
 final_cart = apply_clearance(couponed_cart)

total = 0
final_cart.each do |item|
  total  += item[:price] * item[:count]
 end

 if total > 100
   total -= (total * 0.10)
 end


total.round(2)
end
