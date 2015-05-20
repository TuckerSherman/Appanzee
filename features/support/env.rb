#  Created by Tucker Sherman on 3/13/2015.
#  Copyright (c) 2015 Apache licence 2.0

require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'
requre_relative 'appium_session'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

# This hash serves as the default configuration for your test suite, you can change your configuration by kicking off your tests with a differient cucumber profile (profiles contained in cucumber.yml) or by passing in differient environmental variables (see readme.md for complete documentation)
opts = {
        appium_lib: {
        sauce_username: false,
        sauce_access_key: false
        },
      caps: {
        platformName: 'ios',
        platformVersion: '8.2',
        deviceName: 'iPhone 6',
        app: '<YOUR APP PATH HERE>',
        }
}

case ENV['SETUP']
  when "LOCAL"
    puts "Loading local driver configurations"
  when "HUB"
    puts "Loading remote driver configurations"
end

#If non-default desired capabilities have been specified add or alter the hash:
if ENV['APP'] != nil
  opts[:caps][:app] = ENV['APP']
end

if ENV['DEVICE_NAME'] != nil
  opts[:caps][:deviceName] = ENV['DEVICE_NAME']
end

if ENV['PLATFORM_NAME'] != nil
  opts[:caps][:platformName] = ENV['PLATFORM']
end

if ENV['PLATFORM_VERSION'] != nil
  opts[:caps][:platformVersion] = ENV['PLATFORM_VERSION']
end

Appium::Driver.new(opts)
puts(opts)
Appium.promote_appium_methods AppiumWorld

$simulator = Simulator.new(opts[:caps][:deviceName])

#Launch appium with the desired configuration
thisSession = AppiumSession.new("127.0.0.1","4723",opts[:caps][:platformName],opts[:caps][:app],opts[:caps][:deviceName],opts[:caps][:platformVersion],"","")
puts "launching: "
print opts
thisSession.launchWithReset(true)

World do
  AppiumWorld.new
end

Before { $driver.start_driver }

After { $driver.driver_quit }

After do |scenario|
  if scenario.failed?
    puts "*FAILURE*"
  else
    puts "*PASS*"
  end

end
