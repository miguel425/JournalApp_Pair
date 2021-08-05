require 'rails_helper'

RSpec.feature "CreateTasks", type: :system do
  before do 
    driven_by(:rack_test)
    @category = Category.create(title: 'Food')
  end

  it 'creates and saves a new task for the category' do
      visit "/categories/#{@category.id}"
      
      fill_in 'Header', with: 'Make lunch!'
      fill_in 'Description', with: 'Prepare a chicken dish for four people.'

      click_on 'Create Task'

      expect(page).to have_content('Make lunch!')
      expect(page).to have_content('Prepare a chicken dish for four people.')

      task = @category.task('id').last
      expect(task.header).to eq('Make lunch!')
      expect(task.description).to eq('Prepare a chicken dish for four people.')
  end
end
