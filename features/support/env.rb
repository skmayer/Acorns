require "Capybara"
require "Capybara/cucumber"
require "rspec"
require 'selenium-webdriver'
require 'uri'
require 'faraday'
require 'faraday_middleware'
require 'json'
require 'multi_xml'
require "rubygems"
    
# Tell FireFox to use proxy settings
if ENV['http_proxy']
  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Chrome::Profile.new

    uri = URI(ENV['http_proxy'])

    profile["network.proxy.type"] = 1 # manual proxy config
    profile["network.proxy.http"] = uri.host
    profile["network.proxy.http_port"] = uri.port

    if ENV['https_proxy']
      uri = URI(ENV['https_proxy'])
      profile["network.proxy.https"] = uri.host
      profile["network.proxy.https_port"] = uri.port
    end

    Capybara::Selenium::Driver.new(app, :profile => profile)
  end
end

Capybara.default_driver = :selenium