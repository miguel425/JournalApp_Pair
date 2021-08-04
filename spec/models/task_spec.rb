require 'rails_helper'

RSpec.describe "Creates a new task model", type: :model do
  before do
    @category = Category.create(title: 'Food')
  end

  it "creates a new task under the category" do
    task = @category.tasks.create(header: "Sample Task", description: "Sample description")
  end
end
