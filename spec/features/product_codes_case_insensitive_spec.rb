require "rails_helper"

feature "purchase works with case insensitive inputs" do 
  scenario do "successfully"
    visit new_item_path 
  
    fill_in "Name", with: "cereal"
    fill_in "Product code", with: "A12TGH7YQPL93NMA"
    fill_in "Price", with: 3.46
    click_on "New item"

    visit new_purchase_path
    
    fill_in "purchase_codes", with: "A12TGH7YQPL93NMa"
    click_on "Total price"

    expect(page).to have_css "p", text: 3.76
  end
end