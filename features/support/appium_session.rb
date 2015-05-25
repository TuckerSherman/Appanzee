require 'net/http'
require 'rubygems'
require 'json'
require 'open-uri'

class AppiumSession

  @status = 1
  attr_reader :status
  @sessionId = 1
  attr_reader :sessionId

   def initialize(address, port, platform, app, device, iOS_Version, uDID, locale)
     @address = address
     @port = port
     @platform = platform
     @app = app
     @device = device
     @iOS_Version = iOS_Version
     @UDID = uDID
     @locale = locale
   end

   def confirmStatus
    begin
      json_response = open("http://"+@address+":"+@port+"/wd/hub/status").read
    rescue
      @status = 1
      print "."
    else
      response = JSON.parse(json_response)
      @status = response["status"]
      @sessionId = response["sessionId"]
    end
   end

   def launchWithReset(reset)
    baseArg = "appium --address \"#{@address}\" --port #{@port} --app \"#{@app}\""
    baseArg<<" --platform-name \"#{@platform}\" --platform-version \"#{@iOS_Version}\" --device-name \"#{@device}\""
    #general flags we want to launch every appium server session with:
    baseArg<<" --pre-launch --native-instruments-lib"
    #do we want appium to wipe our device between scenarios?
     if reset == true
       baseArg<<" --full-reset"
     else
       baseArg<<" --no-reset"
     end
    #block the thread untill appium is ready to take commands
     tries = 0
     self.confirmStatus
       until @status == 0
         #if appium is already running the code below will not run
         if tries == 1
           #launch appium as a sub-proccess:
           appium_pid = fork do
             appiumServerLogs = `#{baseArg} &`
             exit
           end
           puts baseArg
           puts "Appium server spawned with process identifier: "<<appium_pid.to_s
         end
         tries += 1
         self.confirmStatus
         sleep 1
         if tries > 50
           #if after 50 seconds the server still isnt reporting it is ready to take commands kill it and try again
           puts "Appium seems to be taking too long to start.  Aborting and trying again"
           self.killSession
           self.launchWithReset(reset)
           break
         end
       end
   end

  def killSession
    `killall node`
  end

end
