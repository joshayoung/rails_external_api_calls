require 'rails_helper'

RSpec.describe Home, type: :model do
  describe '.net_http' do
    context 'when calling .net_http' do
      it 'returns the correct result' do
        stub_request(:get, "https://api.adviceslip.com/advice/3").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: "{\"slip\": {\"advice\":\"Don't eat non-snow-coloured snow.\",\"slip_id\":\"74\"}}", headers: {})

        advice = JSON.parse(Home.net_http("https://api.adviceslip.com/advice/3"))["slip"]["advice"]

        expect(advice).to eq "Don't eat non-snow-coloured snow."
      end
    end
  end

  describe '.http_party' do
    context 'when calling .http_party' do
      it 'returns the correct result' do
        stub_request(:get, "https://api.adviceslip.com/advice/2").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: "{\"slip\": {\"advice\":\"Smile and the world smiles with you. Frown and you're on your own.\",\"slip_id\":\"74\"}}", headers: {})
        advice = JSON.parse(Home.http_party("https://api.adviceslip.com/advice/2"))["slip"]["advice"]

        expect(advice).to eq "Smile and the world smiles with you. Frown and you're on your own."
      end
    end
  end
end
