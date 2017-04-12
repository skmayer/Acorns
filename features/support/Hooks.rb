Before do
  $addressObject = AddressObject.new()
  $vehicleObject = VehicleObject.new()
end

After do |scenario|
  take_screenshot(@browser, scenario)
end

def take_screenshot(browser, scenario)
  if scenario.failed?
    scenario_name = scenario.name.gsub /[^\w\-]/, ' '
    time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = './failed_png/' + time + ' - ' + scenario_name + '.png'
  else
    scenario_name = scenario.name.gsub /[^\w\-]/, ' '
    time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = './success_png/' + time + ' - ' + scenario_name + '.png'
  end
  save_screenshot(screenshot_path)
  page.driver.quit
end