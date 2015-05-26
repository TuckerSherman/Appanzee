#  Created by Tucker Sherman on 3/13/2015.
#  Copyright (c) 2015 Apache licence 2.0

Given(/^Move to Apple$/) do
  $simulator.move_to_apple
end

Given(/^Start bicycle ride$/) do
  $simulator.start_bike_ride
end

Given(/^Start city run$/) do
  $simulator.start_city_run
end

Given(/^Start highway drive$/) do
  $simulator.start_highway_drive
end

Given(/^Stop simulating location$/) do
  $simulator.stop_highway_drive
end

Given(/^Shake the phone$/) do
  $simulator.shake
end

Given(/^Trigger low memory warning$/) do
  $simulator.low_memory_warning
end

Given(/^hit the home button$/) do
  $simulator.hit_home
end

Given(/^switch to springboard page (\d+)$/) do |arg1|
  $simualtor.switch_to_springboard(arg1)
end

Given(/^re\-open the app$/) do
  $simulator.re_open_app
end

Given(/^rotate right$/) do
  $simulator.rotate_right
end

Given(/^rotate left$/) do
  $simulator.rotate_left
end

Given(/^color blended layers$/) do
  $simulator.color_blended_layers
end

Given(/^I compare$/) do
  puts"this is running"
  Comparitor.new.run
end

Given(/^I poke the monkey$/) do
  monkey = Monkey.new
  monkey.goWild
end

Given(/^I swipe from (\d+)%x (\d+)%y to (\d+)%x (\d+)%y$/) do |startx,starty,endx,endy|
  workingDirectory = `pwd`
  sx = startx.to_f/100.0
  sy = starty.to_f/100.0
  ex = endx.to_f/100.0
  ey = endy.to_f/100.0
  pyCommand = "#{workingDirectory}/features/support/simulator_gestures.py \"iOS Simulator\" #{sx} #{sy} #{ex} #{ey}"
  pyCommand.gsub!("\n","")
#   puts pyCommand
  out = `#{pyCommand}`
end

Given(/^I take a before screenshot$/) do
  Comparitor.new.takeBeforeImage
end

Given(/^I take an after shot and compare$/) do
  isDifferient = $comparitor.compareNow(20)
  puts isDifferient
end
