require 'rails_helper'

RSpec.describe "EditTasks", type: :system do
  before do
    driven_by(:rack_test)
    @category = Category.create(title: 'Food')
   # @task = Task.create(header: 'Make lunch!', description: 'Prepare a chicken dish for four people.')
  end

  it "Edits and saves a task" do
    visit "/categories/#{@category.id}"
    
    fill_in 'Header', with: 'Make lunch!'
    fill_in 'Description', with: 'Prepare a chicken dish for four people.'

    click_on 'Create Task'

    expect(page).to have_content('Make lunch!')
    expect(page).to have_content('Prepare a chicken dish for four people.')

    task = @category.tasks.last
    expect(task.header).to eq('Make lunch!')
    expect(task.description).to eq('Prepare a chicken dish for four people.')

    click_link 'Edit Task'

    expect(page).to have_current_path("/categories/#{@category.id}/edit_category_task")

    fill_in 'Header', with: 'Make dinner!'
    fill_in 'Description', with: 'Heat leftovers'
    
    click_on 'Update Task'

    expect(page).to have_current_path("/categories/#{@category.id}")
    
    expect(page).to have_content('Make dinner!')
    expect(page).to have_content('Heat leftovers')

    task = @category.tasks.last
    expect(task.header).to eq('Make dinner!')
    expect(task.description).to eq('Heat leftovers')
  end
end
