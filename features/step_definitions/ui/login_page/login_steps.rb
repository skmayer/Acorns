Then(/^Enter Username "([^"]*)"$/)  do |username|
  username = "#{username}"
  puts "\nEntering username: " + username
  fill_in 'emailInput', with: username
end

Then(/^Enter Password "([^"]*)"$/)  do |password|
  password = "#{password}"
  puts "\nEntering password: " + password
  fill_in 'passwordInput', with: password
end

Then(/^Click Sign In$/) do
  puts "\nClick Sign In button"
  click_button 'Sign In'
end

Then(/^Verify Login Error$/) do
  page.find('.signInErrorWrapper')
end