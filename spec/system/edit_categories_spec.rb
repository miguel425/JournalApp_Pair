require 'rails_helper'

class CategoriesTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

RSpec.describe "EditCategories", type: :feature do
  before do
    @user = User.create!(email: 'test@test.com', password: 'test123')
    sign_in(@user)
    @category = @user.categories.create!(title: 'Food')
  end

  it 'edits and saves the category' do
    visit "/categories/#{@category.id}"

    expect(page).to have_content('Food')

    click_on 'Edit Category'
    
    expect(page).to have_current_path("/categories/#{@category.id}/edit")

    fill_in 'Title', with: 'Snacks'
    click_on 'Update Category'
    expect(page).to have_content('Snacks')

    @category = Category.order('id').last
    
    expect(@category.title).to eq('Snacks')
  end
end
