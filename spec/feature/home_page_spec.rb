require "rails_helper"

RSpec.feature "Home Page", :type => :feature do
  scenario "Visit index page" do
    visit "/"

    expect(page).to have_text("Basic Rails API Usage")
  end
end