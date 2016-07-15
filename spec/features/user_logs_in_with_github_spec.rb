require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "user can login with github" do
    visit root_path
    mock_omniauth
    expect(page).to have_content "Login Using GitHub"

    click_link "Login Using GitHub"
    expect(page).to have_content("Hello, robbiejaeger!")
    expect(page).to have_link("Logout")
  end
end
