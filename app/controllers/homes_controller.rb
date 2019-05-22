class HomesController < ApplicationController
  def index
    @net_http = JSON.parse(net_http)["slip"]["advice"]
    @http_party = JSON.parse(http_party)["slip"]["advice"]
  end

  def net_http
    uri = URI.parse("https://api.adviceslip.com/advice")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.body
  end

  def http_party
    HTTParty.get("https://api.adviceslip.com/advice").response.body
  end
end
