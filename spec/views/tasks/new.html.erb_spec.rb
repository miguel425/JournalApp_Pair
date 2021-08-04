require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      header: "MyString",
      description: "MyText",
      category: nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[header]"

      assert_select "textarea[name=?]", "task[description]"

      assert_select "input[name=?]", "task[category_id]"
    end
  end
end
