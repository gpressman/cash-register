class Item < ActiveRecord::Base
  validates :product_code, length: {is: 16}
  validates :product_code, format:  {with: /\A[A-Za-z0-9]+\z/}
  
  
  #takes code converts all characters to uppercase and adds a - after every 4 chars
  def format_code(code)
    code.upcase!
    code.scan(/.{4}|.+/).join("-") 
  end
end
