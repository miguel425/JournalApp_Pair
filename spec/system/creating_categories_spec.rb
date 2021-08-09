require 'rails_helper'

class CategoriesTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

RSpec.describe "CreatingCategories", type: :feature do
  before do
    @user = User.create!(email: 'test@test.com', password: 'test123')
    sign_in(@user)
  end

  it 'saves and displays the category' do
    visit '/categories/new'

    fill_in 'Title', with: 'Food'

    click_on 'Create Category'

    expect(page).to have_content('Food')
    
    category = Category.order('id').last
    expect(category.title).to eq('Food')
  end
end
