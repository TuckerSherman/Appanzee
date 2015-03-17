#  Created by Tucker Sherman on 3/13/2015.
#  Copyright (c) 2015 Apache licence 2.0

require 'rspec/expectations'
require 'appium_lib'
require 'cucumber/ast'

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld
end

opts = {
        appium_lib: {
        sauce_username: false, 
        sauce_access_key: false
        },
      caps: {
        platformName: 'ios',
        platformVersion: '8.1',
        deviceName: 'iPhone 6',
        app: '<YOUR APP PATH HERE>',
        }
}
        
Appium::Driver.new(opts)
puts(opts)
Appium.promote_appium_methods AppiumWorld

$simulator = Simulator.new(opts[:caps][:deviceName])
  
World do
  AppiumWorld.new
end

Before { $driver.start_driver }

After { $driver.driver_quit }

