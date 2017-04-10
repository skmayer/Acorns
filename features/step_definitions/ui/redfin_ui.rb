When(/^I go to Redfin$/) do
  visit "https://www.redfin.com/"
  # fill_in 'searchInputBox', with: '90630'
end

Then(/^I will click the Sign In button$/) do
    all(:xpath, '//*[@id="userMenu"]/div[1]/div/div/div/a[1]/span')[0].click
end

Then(/^Enter Username "([^"]*)"$/)  do |username|
  username = "#{username}"
    fill_in 'emailInput', with: username
end

Then(/^Enter Password "([^"]*)"$/)  do |password|
  password = "#{password}"
  fill_in 'passwordInput', with: password
end

Then(/^Enter Invalid Password$/) do
  fill_in 'passwordInput', with: 'wrongPassword'
end

Then(/^Click Sign In$/) do
  click_button 'Sign In'
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

Then(/^Verify Title$/) do
  #Verify Title contains the address we searched for
  expect(page).to have_title ($addressObject.get_street())
  expect(page).to have_title ($addressObject.get_city())
  expect(page).to have_title ($addressObject.get_state())
  expect(page).to have_title ($addressObject.get_zip())
end

Then(/^Verify Login Error$/) do
  page.find('.signInErrorWrapper')
end

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

Then(/^Verify Address$/) do
  #Verify all the entered filters are displayed on the results page
  expect(page).to have_xpath("//h1", :text => $addressObject.get_street())
  expect(page).to have_xpath("//h1", :text => $addressObject.get_city())
  expect(page).to have_xpath("//h1", :text => $addressObject.get_state())
  expect(page).to have_xpath("//h1", :text => $addressObject.get_zip())

end