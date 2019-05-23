require "rails_helper"

RSpec.feature "Home Page", :type => :feature do
  scenario "Visit index page" do
    stub_request(:get, "https://api.adviceslip.com/advice").
    with(
      headers: {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "{\"slip\": {\"advice\":\"Work is never as important as you think it is.\",\"slip_id\":\"74\"}}", headers: {})
    visit "/"

    expect(page).to have_text("Basic Rails API Usage")
  end
end