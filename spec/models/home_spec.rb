require 'rails_helper'

RSpec.describe Home, type: :model do
  describe '.net_http' do
    context 'when calling .net_http' do
      it 'returns the correct result' do
        advice = JSON.parse(Home.net_http("https://api.adviceslip.com/advice/1"))["slip"]["advice"]

        expect(advice).to eq "Remember that spiders are more afraid of you, than you are of them."
      end
    end
  end

  describe '.http_party' do
    context 'when calling .http_party' do
      it 'returns the correct result' do
        advice = JSON.parse(Home.http_party("https://api.adviceslip.com/advice/2"))["slip"]["advice"]

        expect(advice).to eq "Smile and the world smiles with you. Frown and you're on your own."
      end
    end
  end
end
