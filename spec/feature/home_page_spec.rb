require "rails_helper"

RSpec.feature "Home Page", :type => :feature do
  scenario "Visit index page" do
    stub_advice_api_call(url: "https://api.adviceslip.com/advice", quote: "Work is never as important as you think it is.")

    visit "/"

    expect(page).to have_text("Basic Rails API Usage")
  end
end