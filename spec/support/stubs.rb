def stub_advice_api_call(url:, quote:)
  stub_request(:get, url).
  with(
    headers: {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'User-Agent'=>'Ruby'
    }).
  to_return(status: 200, body: "{\"slip\": {\"advice\":\"#{quote}\",\"slip_id\":\"74\"}}", headers: {})
end