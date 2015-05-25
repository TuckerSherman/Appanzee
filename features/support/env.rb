# This file provides setup and common functionality across all features.  It's
# included first before every test run, and the methods provided here can be
# used in any of the step definitions used in a test.  This is a great place to
# put shared data like the location of your app, the capabilities you want to
# test with, and the setup of selenium.

require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
require_relative 'appium_session'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

puts"Loading Jenkins driver configurations"
opts = {
    appium_lib: {
        sauce_username: false,
        sauce_access_key: false
    },
    caps: {
        platformName: 'ios',
        platformVersion: '8.1',
        deviceName: 'iPhone 6',
        app: '/Users/tuckersherman/Library/Developer/Xcode/DerivedData/strechyHeader-anvgnoghyjoxewhlbmumystrohsn/Build/Products/Debug-iphonesimulator/strechyHeader.app',
    }
}

#Launch Appium with the desired capabilities
thisSession = AppiumSession.new("127.0.0.1","4723",opts[:caps][:platformName],opts[:caps][:app],opts[:caps][:deviceName],opts[:caps][:platformVersion],"","")
#
puts "launching: "
print opts
thisSession.launchWithReset(true)

#Create the driver object
Appium::Driver.new(opts)
Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
end

After do |scenario|
  # Adds screenshots to failing tests
  if scenario.failed?
    puts"FAILURE"
    file_name = "failure_screenshot_#{Time.now.to_i}.png"
    file_path = File.expand_path(File.dirname(__FILE__) + "../../../screenshots/#{file_name}")
    if ENV['SETUP'] == "CI"
      puts " find the screenshot <a href=\"http://10.192.3.229:8080/job/iOS%20Regression%20Tests%20(RC)/ws/cucumber_ios/screenshots/#{file_name}\">here</a> "
    else
      puts " find the screenshot at #{file_path}"
    end
    $driver.screenshot(file_path)
  else
    puts"PASS"
  end
end

AfterStep do
  if ENV['FLYOVER'] == "ON"
    file_name = File.expand_path(File.dirname(__FILE__) + "../../../screenshots/flyover_screenshot_#{Time.now.to_i}.png")
    $driver.screenshot(file_name)
  end
end

at_exit do
  puts"End"
  thisSession.killSession
end
