require 'rails_helper'

class LogoutTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

RSpec.describe "Logout", type: :feature do
  before do
    @user = User.create!(email: 'test@test.com', password: 'test123')
    sign_in(@user)
  end
  
  it "let's existing user log-out" do
    visit root_path
    
    click_on "Sign Out"

    expect(page).to have_content("Signed out successfully.")
  end
end
