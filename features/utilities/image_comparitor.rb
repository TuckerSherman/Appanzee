require 'chunky_png'
require 'appium_lib'
require 'cucumber/ast'

class Comparitor

  @imgA
  attr_reader :imgA
  @imgSetID
  attr_reader :imgSetID


  def takeBeforeImage
    @imgSetID = Time.now.strftime("%A-%B%d--%I:%M%p")
    file_name = "BEFORE-#{@imgSetID}.png"
    file_path = File.expand_path(File.dirname(__FILE__) + "../../../output/img_comparitor/#{file_name}")
    @imgA = "output/img_comparitor/#{file_name}"
    puts file_path

    $comparitor = self

    $driver.screenshot(file_path)
  end

  def compareNow(threshold)
    file_name = "AFTER-#{@imgSetID}.png"
    file_path = File.expand_path(File.dirname(__FILE__) + "../../../output/img_comparitor/#{file_name}")
    imgB = "output/img_comparitor/#{file_name}"
    $driver.screenshot(file_path)

    images = [
      ChunkyPNG::Image.from_file($comparitor.imgA),
      ChunkyPNG::Image.from_file(imgB)
    ]

    diff = []

    images.first.height.times do |y|
      images.first.row(y).each_with_index do |pixel, x|
        diff << [x,y] unless pixel == images.last[x,y]
      end
    end

    differienceP = (diff.length.to_f / images.first.pixels.length) * 100
    puts "pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%"

    x, y = diff.map{ |xy| xy[0] }, diff.map{ |xy| xy[1] }



    if differienceP > threshold.to_i
      images.last.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0,255,0))
      diffFileName = "RESULT-#{@imgSetID}.png"
      images.last.save("output/img_comparitor/#{diffFileName}")
      return false
    else
      return true
    end
  end


end
