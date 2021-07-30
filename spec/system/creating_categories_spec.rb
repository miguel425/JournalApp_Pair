require 'rails_helper'

RSpec.describe "CreatingCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the category' do
    visit '/categories/new'

    fill_in 'Title', with: 'Food'

    click_on 'Create Category'

    expect(page).to have_content('Food')
    
    category = Category.order('id').last
    expect(category.title).to eq('Food')
  end

  it 'edits and saves the category' do
    visit '/categories/new'

    fill_in 'Title', with: 'Food'

    click_on 'Create Category'

    expect(page).to have_content('Food')
    
    category = Category.order('id').last

    visit "/categories/#{category.id}"

    expect(page).to have_content('Food')

    click_on 'Edit Category'
    
    expect(page).to have_current_path("/categories/#{category.id}/edit")

    fill_in 'Title', with: 'Snacks'
    click_on 'Update Category'
    expect(page).to have_content('Snacks')

    category = Category.order('id').last
    
    expect(category.title).to eq('Snacks')
  end
end
