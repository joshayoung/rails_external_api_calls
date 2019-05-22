class Home < ApplicationRecord
  class << self
    def net_http(url = "https://api.adviceslip.com/advice/1")
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        response.body
    end

      def http_party(url = "https://api.adviceslip.com/advice")
          HTTParty.get(url).response.body
      end
    end
end
