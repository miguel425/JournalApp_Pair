require 'rails_helper'

class LoginTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

RSpec.describe "Login", type: :feature do
  before do
    @user = User.create!(email: 'test@test.com', password: 'test123')
  end
  
  it "let's existing user log-in" do
    visit root_path
    
    click_on "Sign In"

    expect(page).to have_current_path(new_user_session_path)

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test123'

    click_on 'Sign In'
    
    expect(page).to have_current_path(user_session_path)
  end
end
