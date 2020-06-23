require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.app_host = "http://#{ENV['WEBSITE_URL']}" 
Capybara.run_server = false
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => { "args" => [
         '--no-default-browser-check',
         '--disable-dev-shm-usage'
      ] }
    )
  )
end

Capybara.default_driver = :selenium

describe "Example page render unit tests" do
  it "Should show the Explore California logo" do
  visit('/')
  expect(page.has_selector? 'a.logo').to be true
  end 
end
