require "rails_helper"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "They can click a product" do
    visit root_path

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    expect(page).to have_css "article.product"

    page.find("article.product", match: :first).find("header").find("a").find("h4").click

    expect(page).to have_css "article.product-detail"
    expect(page).to have_css "img.main-img"

    # save_and_open_screenshot
  end
end
