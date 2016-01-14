require "rails_helper"

feature "validates that product code in item has no special characters" do 
  scenario "successfully" do
  	visit new_item_path

  	fill_in "Name", with: "cereal"
    fill_in "Product code", with: "12TGH7YQPL93NMA*"
    fill_in "Price", with: 3.46
    click_on "New item"

    expect(page).to have_css "p", text: "New item"
  end
end