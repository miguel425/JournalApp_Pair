require 'rails_helper'

RSpec.describe "Index", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'displays all existing categories' do
    visit "/categories"

    @category.each do |cat|
      expect(page).to have_content(cat)
      
    end
  end
end
