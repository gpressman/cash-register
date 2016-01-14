require "rails_helper"

feature "total function sums item prices and applies tax" do 
  scenario "succesfully" do 
    visit new_item_path

    fill_in "Name", with: "cereal"
    fill_in "Product code", with: "A12TGH7YQPL93NMA"
    fill_in "Price", with: 3.46
    click_on "New item"

    visit new_item_path

    fill_in "Name", with: "tuna"
    fill_in "Product code", with: "65P1UDGMXH2MLQW2"
    fill_in "Price", with: 5.89
    click_on "New item"

   visit new_purchase_path

   fill_in "purchase_codes", with: "A12TGH7YQPL93NMA;65P1UDGMXH2MLQW2"
   click_on "Total price"

   expect(page).to have_css "p", text: 10.17
  end
end