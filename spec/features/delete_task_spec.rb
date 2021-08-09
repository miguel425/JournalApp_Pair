require 'rails_helper'

RSpec.feature "DeleteTasks", type: :feature do
  before do 
    @user = User.create!(email: 'test@test.com', password: 'test123')
    @category = @user.categories.create!(title: 'Food')
    @task = @category.tasks.create!(header: "Make lunch", description: "Have a good lunch!")
  end

  it 'deletes a task from the category show' do
    visit "/categories/#{@category.id}"

    click_on "Delete Task"

    expect(page).not_to have_content("Make lunch")
    expect(page).not_to have_content("Have a good lunch!")

    expect { @task.destroy }.to change { Task.count }.by(-1)
  end
end
