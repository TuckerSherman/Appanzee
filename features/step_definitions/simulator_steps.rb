#  Created by Tucker Sherman on 3/13/2015.
#  Copyright (c) 2015 Apache licence 2.0

Given(/^Move to Apple$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^Start bicycle ride$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^Start city run$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^Start highway drive$/) do
  $simulator.start_highway_drive
end

Given(/^Stop simulating location$/) do
  $simulator.stop_highway_drive
end

Given(/^Shake the phone$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^Trigger low memory warning$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^hit the home button$/) do
  $simulator.hit_home
end

Given(/^switch to springboard page (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^re\-open the app$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^rotate right$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^rotate left$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^color blended layers$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I compare$/) do
  puts"this is running"
  Comparitor.new.run
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
