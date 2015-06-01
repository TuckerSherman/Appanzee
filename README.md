# Appanzee Mobile Testing Suite
Appanzee is a mobile test suite built using cucumber to drive appium functional tests for iOS and android apps. Some apple script, ruby gems, and python scripts have been thrown in to extend the suite's cababilities far beyond appium's default functionality, enabling:

*-Monkey testing, with simple recording/reporting format for reproduction*

*-Visual diff analysis, generating screenshots with diffs marked*

*-Reset & no reset sessions, for tests that require existing data*

*-Simulated realistic movement for testing CoreLocation features*

For more info check out the docs for: [cucucmber](https://github.com/cucumber/cucumber/wiki), [appium](http://appium.io/slate/en/master/)

### Before you test locally install these (if you havent already):

Install Ruby:  `\curl -L https://get.rvm.io | bash -s stable --ruby`

Install Node:  `brew install node`

Install Appium: `npm install -g appium`
 
Install Appium Client: `npm install wd`
 
Install Bundler:  `gem install bundle`


## Start your tests
Configure app path: in env.rb on line 24 you can specify the default path to the app you would like to test

Install Gems from terminal (run from inside the cucumber_ios directory) : `bundle install`

To run the Cucumber features, youll need to change directory to the root of this repository and then,
from the commandline, run 'cucumber'.
###Options:
| Tag        | Android           |iOS           |
| ------------- |:-------------:| :-------------:| 
| APP     | ../../something.apk   | ../../something.app |
| PLATFORM_NAME     | android  | ios |
| PLATFORM_VERSION      | 4.4, 4.5...      | 7.1, 8.1, 8.2 ... |
| DEVICE_NAME: | samsung galaxy s6   | iPhone 5, iPhone 6 |
| HUB: | http://localhost:4723/wd/hub | http://localhost:4723/wd/hub |
