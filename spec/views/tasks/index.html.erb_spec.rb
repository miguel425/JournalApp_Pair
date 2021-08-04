require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        header: "Header",
        description: "MyText",
        category: nil
      ),
      Task.create!(
        header: "Header",
        description: "MyText",
        category: nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", text: "Header".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
