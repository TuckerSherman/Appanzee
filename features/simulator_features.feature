#  Created by Tucker Sherman on 3/13/2015.
#  Copyright (c) 2015 Apache licence 2.0

Feature: Demo

@location_scenarios
  Scenario: Location
    * Move to Apple
    * Start bicycle ride
    * Start city run
    * Start highway drive
    * Stop simulating location

@physical_controls
  Scenario: Physical Controls
    * Shake the phone
    * Trigger low memory warning
    * hit the home button
    * switch to springboard page 2
    * re-open the app
    * rotate right
    * rotate left
    * color blended layers

@compare
  Scenario: compare
    * I take a before screenshot
    * I poke the monkey
    * I take an after shot and compare
