require 'rails_helper'

RSpec.describe "CategoryValidation", type: :model do
  it "does not accept empty string" do 
    category = Category.new(title: nil)
    expect(category).to_not be_valid

    # expect(page).to have_content("Title can't be blank")
  end
end
