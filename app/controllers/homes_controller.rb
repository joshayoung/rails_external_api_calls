class HomesController < ApplicationController
  def index
    @net_http = JSON.parse(Home.net_http)["slip"]["advice"]
    @http_party = JSON.parse(Home.http_party)["slip"]["advice"]
  end
end
