-- Title: DisplaysShapes
-- Name: John Omage
-- Course: ICS2O/3C
-- This program displays 3 shapes on the iPad of different
-- colours and borders. Underneath each shape is the name 
-- of it 

-- create my local variables

 local myPentagon

--set the background colour of my screen.
display.setDefault("background", 51/255, 255/255, 153/255)

-- remove staus bar
display.setStatusBar(display.HiddenStatusBar)

--Octagon vertices
local verticesmyPentagon = { 550,450, 455,519, 491,631, 609,631, 645,519,}

-- draw the Octagon
myPentagon = display.newPolygon(200, 300, verticesmyPentagon)

--Pentagon x and y location
myPentagon.anchorX = 200
myPentagon.anchorY = 120

 local myTriangle

--Triangle vertices
local verticesmyTriangle = { -100,100, 100,100, 100,-100,}

-- draw the Triangle
myTriangle = display.newPolygon(500, 300, verticesmyTriangle)

myTriangle.anchorX = 200
myTriangle.anchorY = 300

display.newText( "Triangle", 500, 335, nil, 55 )

 display.newText( "Pentagon", 200, 335, nil, 55 )

 display.newText( "Quadrilateral", 700, 635, nil, 55 )

local myQuadrilateral

--Triangle vertices
local verticesmyQuadrilateral = { -100,100, -100,-100, 100,-100, 100,100}

-- draw the Triangle
myQuadrilateral = display.newPolygon(700, 600, verticesmyQuadrilateral)

myQuadrilateral.anchorX = 200
myQuadrilateral.anchorY = 300

myQuadrilateral:setFillColor(51/255, 51/255, 255/255)
myTriangle:setFillColor(255/255, 0/255, 0/255)
myPentagon:setFillColor(255/255, 128/255, 0/255)