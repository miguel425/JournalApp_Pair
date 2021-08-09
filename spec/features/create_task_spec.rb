require 'rails_helper'

class TasksTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end


RSpec.feature "CreateTasks", type: :feature do
  before do 
    @user = User.create!(email: 'test@test.com', password: 'test123')
    sign_in(@user)
    @category = @user.categories.create!(title: 'Food')
  end

  it 'creates and saves a new task for the category' do
      visit "/categories/#{@category.id}"
      
      fill_in 'Header', with: 'Make lunch!'
      fill_in 'Description', with: 'Prepare a chicken dish for four people.'

      click_on 'Create Task'

      expect(page).to have_content('Make lunch!')
      expect(page).to have_content('Prepare a chicken dish for four people.')

      task = @category.tasks.last
      expect(task.header).to eq('Make lunch!')
      expect(task.description).to eq('Prepare a chicken dish for four people.')
      expect(task.category_id).to eq(@category.id)
      expect(@category.user_id).to eq(@user.id)
  end
end
