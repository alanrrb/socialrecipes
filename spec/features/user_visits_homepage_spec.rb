require "rails_helper"

feature "User visits homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_css 'h3', text: 'Last Recipes'
    expect(page).to have_css 'h3', text: 'Most favorites'
  end
end
