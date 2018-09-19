sub init()
  m.container = m.top.findNode("gridContainer")
  m.controlTimer = m.top.findNode("controlTimer")
  m.animationTimer = m.top.findNode("animationTimer")

  timeoffset = 5.0
  deltaPeriod = 2.0
  deltaPeriod *= Rnd(0)
  m.controlTimer.duration = timeoffset + deltaPeriod
  m.controlTimer.observeField("fire", "onControlTick")

  m.animationTimer.observeField("fire", "onAnimationTick")
  m.matrix =[]
  m.dictionary ={}
end sub


function initializeGrid(options as Dynamic) as Void

  i = 0
  j = 0

  m.gapSize = m.top.unitSize * 1.5

  for i = 0 to m.top.matrixSize
    for j = 0 to m.top.matrixSize
      unit = createObject("roSGNode", "Rectangle")
      unit.width = m.top.unitSize
      unit.height = unit.width
      unit.color = m.top.color
      unit.translation = [i * (m.top.unitSize + m.gapSize), j * (m.top.unitSize + m.gapSize)]
      m.matrix.push(unit)
      m.dictionary.AddReplace(i.tostr()+","+j.tostr(), unit)
      m.container.appendChild(unit)
    end for
  end for

  m.controlTimer.control = "start"

end function


sub onControlTick(event as Object)



   timeoffset = 15
   deltaPeriod = rnd(10)
   m.animationLimit = timeoffset + deltaPeriod
   m.animationCount = 0

   m.animationTimer.control = "start"

end sub


sub onAnimationTick(event as Object)
  x = rnd(m.top.matrixSize + 1)
  y = rnd(m.top.matrixSize + 1)

  x --
  y --

  if m.pixel <> invalid then m.pixel.visible = true

  m.pixel = m.dictionary[x.tostr()+","+y.tostr()]

  if m.pixel <> invalid
    m.pixel.visible = false
  end if

  m.animationCount ++

  if m.animationCount > m.animationLimit
    m.animationTimer.control = "stop"
    m.pixel.visible = true
  end if
end sub
