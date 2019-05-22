class HomesController < ApplicationController
  def index
    @net_http = JSON.parse(Home.net_http("https://api.adviceslip.com/advice"))["slip"]["advice"]
    @http_party = JSON.parse(Home.http_party("https://api.adviceslip.com/advice"))["slip"]["advice"]
  end
end
