# Then(/^Make API Call with state "([^"]*)" and year "([^"]*)" and submodel "([^"]*)"$/) do |state, year, submodel|
Then(/^Make API Call with make "([^"]*)" and state "([^"]*)" and year "([^"]*)" and submodel "([^"]*)"$/) do |make, state, year, submodel|

  response = Faraday.get do |req|
    req.url 'https://api.edmunds.com/api/vehicle/v2/' + "#{make}" + '/' + "#{submodel}"
    req.params['state']  = state
    req.params['year']  = year
    req.params['submodel']  = submodel
    req.params['category']  = 'Sedan'
    req.params['view']  = 'basic'
    req.params['fmt']  = 'json'
    req.params['api_key']  = 'vdjgb8h7qhke95fs7gqrmequ'
  end

  puts "\n"
  puts "Status:\t #{response.status}"
  puts "Header:\t #{response.headers}"
  puts "Body:\t #{response.body}"
  
  json = JSON.parse(response.body)
  puts "ID: #{json['id']}"
  puts "Name: #{json['name']}"
  puts "Nice Name:\ #{json['niceName']}"

  expect(response.status).to be(200)
  expect(json['id']).to eq("Audi_A5")
  expect(json['name']).to eq("A5")
  expect(json['niceName']).to eq("a5") 
end
