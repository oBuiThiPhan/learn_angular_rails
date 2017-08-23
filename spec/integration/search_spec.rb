require 'spec_helper.rb'

RSpec.describe "Looking up recipes", js: true do
  it "finding recipes" do
    visit root_path
    fill_in "keywords", with: "baked"
    click_on "Search"

    expect(page).to have_content("Baked Potato")
    expect(page).to have_content("Baked Brussel Sprouts")
  end
end
