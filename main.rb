#!/usr/bin/env ruby

def computeQmInLiter(height, rBottom, rTop)
  (((height * Math::PI) / 3) *
    (rBottom * rBottom + rBottom * rTop + rTop * rTop))*1000
end

def computeRadius(circumference)
  circumference / (Math::PI * 2)
end

def inMeter(inCm)
  (inCm.to_f) / 100.0
end

def computeWaterVolume(volume)
  volume / 4
end

def getWaterVolume(height, rBottom, rTop)
  rB = computeRadius(inMeter(rBottom))
  rT = computeRadius(inMeter(rTop))
  h = inMeter(height)
  " %.3f L" % computeWaterVolume(computeQmInLiter(h, rB,  rT))
end

Shoes.app :title=>"Seramis volume calc for watering plants", :width=>400, :height=>300 do
  flow do
    stack :margin=>10, :width=>"30%" do
      para("height ", :margin=>0)
      @height = edit_line(:width => 50, :margin=>[0,0,0,10])
      para("radius buttom ", :margin=>0)
      @radiusBottom = edit_line(:width => 50, :margin=>[0,0,0,10])
      para("radius top ", :margin=>0)
      @radiusTop = edit_line(:width => 50, :margin=>[0,0,0,10])
      @button =  button("compute", :margin=>[0,0,0,60])
      @result = tagline("", :stroke => red, :margin=>0)
    end
    stack :width=>"70%" do
      image("image.png")
    end
  end
  @button.click{
    @result.text = strong(getWaterVolume(@height.text, @radiusBottom.text, @radiusTop.text))
  }
end