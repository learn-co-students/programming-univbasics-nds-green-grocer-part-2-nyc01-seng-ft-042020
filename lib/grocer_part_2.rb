require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.length.times do |i|
    if(find_item_by_name_in_collection(cart[i][:item], coupons)!=nil)
      activeCoupon = coupons.select{|item| item[:item]==cart[i][:item]}[0]
      if(cart[i][:count] >= activeCoupon[:num])
        coupCount = (cart[i][:count]/activeCoupon[:num]).floor()
        cart[i][:count]-=(activeCoupon[:num]*coupCount)
        newItem = cart[i].clone
        newItem[:item]=cart[i][:item]+" W/COUPON"
        newItem[:count] = activeCoupon[:num]*coupCount
        newItem[:price] = activeCoupon[:cost]*coupCount/newItem[:count]
        cart.push(newItem);
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
    onClearance = cart.select{|item| item[:clearance]==true}
    onClearance.length.times do |i|
        onClearance[i][:price]-=(onClearance[i][:price]*(0.2))
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
  myCart = consolidate_cart(cart)
  myCart = apply_coupons(myCart,coupons)
  myCart = apply_clearance(myCart)
  total=0
  myCart.length.times do |i|
    total += myCart[i][:price]*myCart[i][:count]
  end
  if(total>100)
    total-=(total*0.1)
  end
  total
  
end
