Then(/^Verify Title$/) do
  #Verify Title contains the address we searched for
  expect(page).to have_title ($addressObject.get_street())
  expect(page).to have_title ($addressObject.get_city())
  expect(page).to have_title ($addressObject.get_state())
  expect(page).to have_title ($addressObject.get_zip())
end

Then(/^Verify Address$/) do
  #Verify all the entered filters are displayed on the results page
  puts "\nVerify the Address Filter worked"
  expect(page).to have_xpath("//h1", :text => $addressObject.get_street())
  expect(page).to have_xpath("//h1", :text => $addressObject.get_city())
  expect(page).to have_xpath("//h1", :text => $addressObject.get_state())
  expect(page).to have_xpath("//h1", :text => $addressObject.get_zip())

end