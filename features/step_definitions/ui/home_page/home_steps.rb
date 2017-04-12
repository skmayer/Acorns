Given(/^the address "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |street, city, state, zip|
  #Save given addrss parameteres into AddressObject
  $addressObject.set_street("#{street}")
  $addressObject.set_city("#{city}")
  $addressObject.set_state("#{state}")
  $addressObject.set_zip("#{zip}")

  $addressObject.set_address()
  address = $addressObject.get_address()
  puts "Address Saved: " + address
end

When(/^I go to "([^"]*)"$/)  do |url|
  url = "#{url}"
  puts "\nOpening URL: " + url
  visit url
end

Then(/^Open the Sign In modal$/) do
  puts "\nOpen Sign In modal"
  all(:xpath, '//*[@id="userMenu"]/div[1]/div/div/div/a[1]/span')[0].click
end

Then(/^Verify User is Signed In as "([^"]*)"$/)  do |name|
  expect(page).to have_css("#userMenu", text: name)
  expect(page).to have_xpath('//*[@id="search-box-input"]')
end

Then(/^Enter Filter$/) do
  address = $addressObject.get_address()
  fill_in 'search-box-input', with: address, :match => :prefer_exact
end

Then(/^Make Selection$/) do
  street = $addressObject.get_street()
  click_link(street)
end