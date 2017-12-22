#Import "<std>"
#Import "<mojo>"

#Import "box2d.monkey2"
#Import "b2Draw_mojo.monkey2"

#Import "iforce2d-b2djson/mx2b2djson.monkey2"
#Import "assets/scene1.json"

Using std..
Using mojo..
Using box2d..

Global w_width:=1000 'initial window size
Global w_height:=700

'Global b2_GLOBAL_canvas:Canvas



Class Box2DgfxTest Extends Window
	
	Field DDrawer:b2Draw_mojo
	Field world:b2World
	Field down:b2Vec2
	'Bodies  --------- bodies are set as field because you'll need them to connect your sprites to it
	Field body:b2Body
	Field body2:b2Body
	Field body3:b2Body
	'step values
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2
	'count cylcles to auto-quit
	Field count:=0
	'center point of camera in physics world
	Field viewpoint:=New b2Vec2(0,2)
	
	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		
		Super.New( title,width,height,flags )
	
	    Local bd:b2BodyDef
	    Local fd:b2FixtureDef
	    

	'------- Initialising the world with its gravity
		'down=New b2Vec2(0,-20)
		'world=New b2World(down)	
		world=mx2b2dJson.b2dJsonReadFromFile("c:/RUBEscenes/scene1.json")
		'world=mx2b2dJson.b2dJsonReadFromFile("asset::scene1.json")

		
	#Rem
	'-------------------body 1	(the moving circle)
		bd.type = b2BodyType.b2_dynamicBody
 		bd.position.Set(0.1, 5.1)
  		bd.angle = 0.0
  		
  		body=world.CreateBody(Varptr bd)
  		
    	fd.friction = 2.0
    	fd.restitution = 0.7
    	fd.density = 1.0
    	
    	Local cshape:=New b2CircleShape() 
    	cshape.m_radius = 0.5
    	cshape.m_p.Set(0.0, 0.0)

    	fd.shape = cshape
    	body.CreateFixture(Varptr fd)
	'---------------------body 2 (the static circle)
		bd.type = b2BodyType.b2_dynamicBody
 		bd.position.Set(0.0, 0.0)
  		bd.angle = 0.0
  		
  		body2=world.CreateBody(Varptr bd)
  		
    	fd.friction = 2.0
    	fd.restitution = 0.7 '(bouncing)
    	fd.density = 1.0

    	cshape=New b2CircleShape() 
    	cshape.m_radius = 0.45
    	cshape.m_p.Set(0.0, 0.0)

    	fd.shape = cshape
    	body2.CreateFixture(Varptr fd)
    	'---------------------body 3 (dynamic polygon)
		bd.type = b2BodyType.b2_staticBody
 		bd.position.Set(-0.2, -5.2)
  		bd.angle = 0.0
  		body3=world.CreateBody(Varptr bd)
  	
    	fd.friction = 2.0
    	fd.restitution = 0.7 '(little bouncing)
    	fd.density = 1.0
    	
    	Local pshape:=New b2PolygonShape()
    	Local vs:=New b2Vec2[4]
    	vs[0].Set(5.0, -1.0)
    	vs[1].Set(5.0, 1.0)
    	vs[2].Set(-5.0, 1.0)
    	vs[3].Set(-5.0, -1.0)
    	pshape.Set(Varptr vs[0], 4)
    	
    	fd.shape = pshape
    	body3.CreateFixture(Varptr fd)
    
    #End
    		
	'----- debugdrawer init and link---------------------------------------------------------------------------------------------
		DDrawer=New b2Draw_mojo 'this one must be a field or a global 
		world.SetDebugDraw( DDrawer  ) '
		DDrawer.SetFlags( e_shapeBit )
		DDrawer.SetCamera(New b2Vec2(0,0),20)  
	End
	
	Method OnRender( canvas:Canvas ) Override
		App.RequestRender()
		canvas.Clear(Color.Black)
		
		'// Instruct the world to perform a single step of simulation.
		'// It is generally best to keep the time step and iterations fixed. ---> they have been set globally
		world.Stepp(timeStep, velocityIterations, positionIterations)
		
		' passing the canvas to the b2Draw_mojo instance (DDrawer)
		' It's mandatory before calling world.DrawDebugData()	
		DDrawer.SetCanvas(canvas) 
		
		'ask physics world to draw debug datas (using our DDrawer instance of b2Draw_mojo class)
		world.DrawDebugData()
		
		'quit the app after 800 cycles
		count+=1
		If count>8000 Then App.Terminate()
	End
End

Function Main()

	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End