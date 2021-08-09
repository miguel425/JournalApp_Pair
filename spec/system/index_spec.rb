require 'rails_helper'

class IndexTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

RSpec.describe "Index", type: :feature do
  before do
    @user = User.create!(email: 'test@test.com', password: 'test123')
    sign_in(@user)
    @user.categories.create!(title: 'Food')
    @user.categories.create!(title: 'Drinks')
    @user.categories.create!(title: 'Movies')
  end
  it 'displays all existing categories' do
    visit "/categories"

    expect(page).to have_content('Food')
    expect(page).to have_content('Drinks')
    expect(page).to have_content('Movies')
    end

  it 'does not display categories if not signed in' do
    sign_out(@user)

    visit "/categories"

    expect(page).not_to have_content('Food')
    expect(page).not_to have_content('Drinks')
    expect(page).not_to have_content('Movies')
  end

  it 'does not display categories made by other users' do
    @usertwo = User.create!(email: 'testtwo@test.com', password: 'test234')
    @usertwo.categories.create!(title: 'Not Food')
    @usertwo.categories.create!(title: 'Not Drinks')

    sign_out(@user)

    visit "/categories"

    expect(page).not_to have_content('Not Food')
    expect(page).not_to have_content('Not Drinks')

  end
end
