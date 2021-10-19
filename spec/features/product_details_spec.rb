require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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


  scenario "They click on product details" do
    # ACT
    visit root_path
    first('.product').first(:link, "Details »").click
    # DEBUG / VERIFY
    sleep(2)
    #puts page.html
    save_screenshot('product_details.png')
    expect(page).to have_content 'Name', count:1
    expect(page).to have_content 'Description', count:1
    expect(page).to have_content 'Price', count:1
    expect(page).to have_content 'Quantity', count:1
  end
end
