
class Simulator
 
def foreground
   `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e 'set frontmost to true' -e 'end tell'`
end
  
def start_highway_drive
  foreground
  exit = `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'click menu bar item "Debug" of menu bar 1' -e'delay 0.1' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 124' -e'key code 125'-e'key code 125'-e'key code 125'-e'key code 125'-e'key code 125' -e'keystroke "" & return' -e'delay 2' -e'end tell'`
  puts("highway drive start - #{exit.to_i}")
end

def stop_highway_drive
  foreground
   exit = `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'click menu bar item "Debug" of menu bar 1' -e'delay 0.1' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 125' -e'key code 124' -e'keystroke "" & return' -e'delay 2' -e'end tell'`
  puts("highway drive stop exits - #{exit.to_i}") 
end

def hit_home
  foreground
  exit =`osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'keystroke "H" using command down' -e'delay 2' -e'end tell'`
  puts("home button exits - #{exit.to_i}")
end

def doubletap_home
  foreground
  exit = `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e'keystroke "HH" using command down' -e'delay 2' -e'end tell'`
  puts("home button exits - #{exit.to_i}")
end

#IPHONE 6 SPECIFIC TODO: make these dynamic
def springboard_page_switch_to(number)
  case number
    when 1
      $driver.execute_script 'mobile: tap', :x =>181, :y => 564
    when 2
      $driver.execute_script 'mobile: tap', :x =>197, :y => 564
  end
  
end

end