require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see cart increase by 1" do
    visit '/'
    first('.actions').click_on('Add')
    # commented out b/c it's for debugging only
    save_and_open_screenshot
    expect(page).to have_content("My Cart (1)")
    # puts page.html
  end


end
