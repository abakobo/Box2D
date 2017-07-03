#Import "<std>"
#Import "<mojo>"
#Import "box2d.monkey2"
#Import "b2Draw_mojo.monkey2"

'choose one of the files to import one of R.U.B.E. c++ source

'#Import "from_rube/deums.h"
'#Import "from_rube/stress.h"
#Import "from_rube/rubegoldberg.h"
'#Import "from_rube/stress2.h"




Using std..
Using mojo..
Using box2d..

Extern 

Function from_rube(m_world:b2World)

Public


Global w_width:=1000 'initial window size
Global w_height:=700

Class Box2DgfxTest Extends Window

	
	Field DDrawer:b2Draw_mojo
	Field world:b2World
	Field down:b2Vec2
	Field shape_flag:=True

	'step values
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2
	
	'center point of the camera
	Field viewpoint:=New b2Vec2(12,5) 'for rubegolberg
	'Field viewpoint:=New b2Vec2(0,0) 'for stress demos
	Field zoom:=25.0
	
	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		
		Super.New( title,width,height,flags )
	
	'------- Initialising the world with its gravity
		down=New b2Vec2(0,-12) ' could be modified in some "from_rube" imports...
		world=New b2World(down)	 'extends void not garbage collected

	'--------calling assets from a rube c++ export

	from_rube(world)

	'----- debugdrawer init and link---------------------------------------------------------------------------------------------
	
		DDrawer=New b2Draw_mojo 'this one must be a field or a global
		world.SetDebugDraw( DDrawer  ) 'tells the pysics world wich class to use for DebugDraw
		DDrawer.SetFlags(e_shapeBit | e_jointBit)
		
	End
	
	Method OnRender( canvas:Canvas ) Override
		App.RequestRender()
		canvas.Clear(Color.Black)
		
		'// Instruct the world to perform a single step of simulation.
		'// It is generally best to keep the time step and iterations fixed.
		world.Stepp(timeStep, velocityIterations, positionIterations)
		
		
		' updating the scale/zoom factor and the camera center point(b2Vec2) this can be done with b2Draw_mojo.SetCamera(b2Vec2,Float) too
		DDrawer.viewpoint=viewpoint
		DDrawer.scale=zoom
		
		
		' passing the canvas to the b2Draw_mojo instance (DDrawer)
		' It's mandatory before calling world.DrawDebugData()	
		DDrawer.SetCanvas(canvas) 
		
		
		'ask physics world to draw debug datas (using our DDrawer instance of b2Draw_mojo class)
		world.DrawDebugData()
		
		canvas.Color=Color.White
		canvas.DrawText("FPS:"+App.FPS+"    -- press space to hide/show shapes -- arrows to move -- E/D to zoom/unzoom ",15,15)
		
		 If Keyboard.KeyPressed(Key.Space)
		 	Print "Space"
		 	If shape_flag=True
			 	shape_flag=False
			 	DDrawer.ClearFlags(e_shapeBit)
			 Elseif shape_flag=False
			 	shape_flag=True
			 	DDrawer.AppendFlags(e_shapeBit)
			 Endif
		 Endif
		 If Keyboard.KeyDown(Key.Up) Then viewpoint.y+=0.1
		 If Keyboard.KeyDown(Key.Down) Then viewpoint.y-=0.1
		 If Keyboard.KeyDown(Key.Left) Then viewpoint.x-=0.1
		 If Keyboard.KeyDown(Key.Right) Then viewpoint.x+=0.1
		 If Keyboard.KeyDown(Key.E) Then zoom+=0.1
		 If Keyboard.KeyDown(Key.D) Then zoom-=0.1	
	End
End

Function Main()
	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End