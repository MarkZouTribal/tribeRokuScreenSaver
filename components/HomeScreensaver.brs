
 function init()
   ri = CreateObject("roDeviceInfo")
   model = LCase(ri.GetModel())
   m.deviceRes = ri.GetDisplaySize()
   m.fullScreenResH = m.deviceRes.h
   m.fullScreenResW = m.deviceRes.w

   print "screen width ";m.deviceRes.w
   print "screen height ";m.deviceRes.h
    m.urls = [
      "pkg:/images/FHD/slide0.png",
      "pkg:/images/FHD/slide1.png",
      "pkg:/images/FHD/slide2.png",
      "pkg:/images/FHD/slide3.png",
      "pkg:/images/FHD/slide4.png",
      "pkg:/images/FHD/slide5.png",
      "pkg:/images/FHD/slide6.png"
    ]

    m.background1 = m.top.findNode("Background1")
    m.background2 = m.top.findNode("Background2")

    m.background1.loadDisplayMode = "noScale"

    m.background2.loadDisplayMode = "noScale"


    m.timer = createObject("roSGNode", "Timer")
    m.timer.duration = 8
    m.timer.repeat = true
    m.timer.observeField("fire", "onTimerTriggered")
    m.counter = 0
    m.timer.control = "start"

    m.renderTimer = createObject("roSGNode", "Timer")
    m.renderTimer.duration = 2
    m.renderTimer.repeat = false
    m.renderTimer.observeField("fire", "onRender")
    m.anim = m.top.findNode("dispAnimation")

    m.gridAnimation = createObject("roSGNode", "GridAnimation")
    m.gridAnimation.translation = [300,300]
    m.gridAnimation.callFunc("initializeGrid", invalid)
    m.top.appendChild(m.gridAnimation)
end function


' ***** Observers *****'

sub onTimerTriggered( event as Object )

  prevCount = m.counter
  m.counter ++
  if m.counter > 5 then m.counter = 0

  m.background1.uri = m.urls[prevCount]
  m.background2.opacity = 0.0
  m.background2.uri = m.urls[m.counter]

  m.renderTimer.control = "start"
end sub


sub onRender(event as Object)
   m.anim.control = "start"
end sub
