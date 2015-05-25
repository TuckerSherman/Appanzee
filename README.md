# Garden Monkey
The contained cucumber tests are functional automated tests using Appium.  This suite has been designed primarily with iOS testing in mind however android support is coming soon.


## Before you test locally

Install Ruby:  `\curl -L https://get.rvm.io | bash -s stable --ruby`

Install Appium:  `brew install node`      # get node.js
 `npm install -g appium`  # get appium
 `npm install wd`         # get appium client     

Install Bundler:  `gem install bundle`

Install Gems from terminal (run from inside the cucumber_ios directory) : `bundle install`

Configure app path: change the path in appium.txt for 'app:' to reach the .app
on your system (this repository is setup to work without modification in
jenkins, please do not alter the .gitignore to push changes to appium.txt)

Start Appium Server: Either hit launch from the appium.app GUI or launch Appium
directly from the command line.   


## Cucumber(features)

Cucumber is a Behaviour Driven Design framework that lots of people are keen on.
It lets you describe test actions in a clean, concise, English-like manner.

for more info check out cucumber's documentation here - https://github.com/cucumber/cucumber/wiki


## Start your tests

To run the Cucumber features, youll need to change directory to the cucumber
directory (`cd <'PATH TO THIS REPO'>/cucumber_ios`) and then,
from the commandline, run 'cucumber'.
