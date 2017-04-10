Given(/^vehicle state "([^"]*)"$/) do |state|
  state = "#{state}"
  $vehicleObject.set_state(state)
end

Given(/^vehicle year "([^"]*)"$/) do |year|
  year = "#{year}"
  $vehicleObject.set_year(year)
end

Given(/^vehicle make "([^"]*)"$/) do |make|
  make = "#{make}"
  $vehicleObject.set_make(make)
end

Given(/^vehicle submodel "([^"]*)"$/) do |submodel|
  submodel = "#{submodel}"
  $vehicleObject.set_submodel(submodel)
end

# Then(/^Make an API Call with state "([^"]*)" year "([^"]*)" make "([^"]*)" submodel "([^"]*)"$/) do |state, year, make, submodel|
Then(/^Make an API Call$/) do
  #Store paramenters in proper vairables
  state = $vehicleObject.get_state
  year = $vehicleObject.get_year
  make = $vehicleObject.get_make
  submodel = $vehicleObject.get_submodel

  #Execute REST call using Faraday
  response = Faraday.get do |req|
    req.url 'https://api.edmunds.com/api/vehicle/v2/' + make + '/' + submodel
    req.params['state']  = state
    req.params['year']  = year
    req.params['submodel']  = submodel
    req.params['category']  = 'Sedan'
    req.params['view']  = 'basic'
    req.params['fmt']  = 'json'
    req.params['api_key']  = 'vdjgb8h7qhke95fs7gqrmequ'
  end

  #Print Resposne
  puts "\n"
  puts "Status:\t #{response.status}"
  puts "Header:\t #{response.headers}"
  puts "Body:\t #{response.body}"
  
  #Parse JSON and Print JSPON
  json = JSON.parse(response.body)
  puts "ID: #{json['id']}"
  puts "Name: #{json['name']}"
  puts "Nice Name:\ #{json['niceName']}"

  #Store parsed JSON into variables
  response_id = json['id']
  response_name = json['name']
  response_niceName = json['niceName']

  #Verify actual resutls wiht expected
  expect(response.status).to be(200)
  expect(response_id.downcase.should include(make.downcase))
  expect(response_name.downcase.should include(submodel.downcase))
  expect(response_niceName.downcase.should include(submodel.downcase))
end