class HomesController < ApplicationController
  def index
    uri = URI.parse("https://api.adviceslip.com/advice")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @advice = JSON.parse(response.body)["slip"]["advice"]
  end
end
