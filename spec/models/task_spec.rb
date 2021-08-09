require 'rails_helper'

class TasksTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

RSpec.describe "Creates a new task model", type: :feature do
  before do
    @user = User.create!(email: 'test@test.com', password: 'test123')
    sign_in(@user)
    @category = @user.categories.create!(title: 'Food')
  end

  it "creates a new task under the category" do
    task = @category.tasks.create!(header: "Sample Task", description: "Sample description")
  end
end
