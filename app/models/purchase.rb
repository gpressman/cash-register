class Purchase < ActiveRecord::Base
	

  def checkout(items)

    cart = []
    #splits the items by individual code
  	items = items.split(";")
    #uses the code to find the corresponding item and pushes the item price into an array
  	items.each do |code|
  	  item = Item.find_by(product_code: code)
       cart << item.price	  
    end
    #adds prices together and applies tax
  return (cart.reduce(:+)*1.0875).round(2)
  
  end
end
