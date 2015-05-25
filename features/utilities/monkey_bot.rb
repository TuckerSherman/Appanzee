class Monkey

  def initialize
    @logName = Time.now.to_s.partition(" ")[0]
  end

  def goWild
    alive = true
    screenSize = `osascript -e 'tell application "System Events" to tell process "iOS Simulator"' -e 'get size of window 1' -e 'end tell'`.partition(", ")
    width = screenSize[0]
    height = screenSize[2]
    while alive == true
      randomX = rand(1..width.to_i)
      randomY = rand(1..height.to_i)
      appium_tap(randomX,randomY)
      log("tapped: #{randomX},#{randomY}")
      $driver.find_element(:xpath, "//UIApplication") rescue alive = false
    end
  end

  def log (message)
    path = "output/monkeyLogs/#{@logName}.txt"
    puts path
    `echo #{message} >> #{path}`
  end

  def see_if_dead
    $driver.find_element(:xpath, "//UIApplication")
  end

  def appium_tap (x,y)
    $driver.execute_script 'mobile: tap', :x =>x.to_i, :y =>y.to_i
  end

end
