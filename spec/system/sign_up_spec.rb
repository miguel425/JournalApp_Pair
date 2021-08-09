require 'rails_helper'

RSpec.describe "Sign Up", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "creates a new user" do
    visit root_path
    
    click_on "Sign Up"

    expect(page).to have_current_path(new_user_registration_path)

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    expect{ click_on 'Sign up' }.to change(User, :count).by(1)
  end
end
