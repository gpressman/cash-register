require "rails_helper"

feature "user creates new item" do 
  scenario "successfully" do 
    visit new_item_path

    fill_in "Name", with: "cereal"
    fill_in "Product code", with: "A12TGH7YQPL93NMA"
    fill_in "Price", with: 3.46
    click_on "New item"

    expect(page).to have_css "p", text: "cereal"

  end
end