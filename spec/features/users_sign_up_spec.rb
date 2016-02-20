require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do

  scenario "with valid credentials" do
    visit("/")

    click_link "Sign Up"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "test1234"
    fill_in "Password Confirmation", with: "test1234"
    click_button "Sign Up"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Thank you for singing up! you can now login in and start being productive!")

    #flunk
  end

end