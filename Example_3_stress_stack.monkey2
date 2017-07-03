#Import "<std>"
#Import "<mojo>"
#Import "box2d.monkey2"
#Import "b2Draw_mojo.monkey2"

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
	
	Field shape_flag:=True
	
	'Bodies  --------- bodies are set as field because you'll need them to connect your sprites to it
	Field bodies:=New b2Body[1600]
	Field pen_bodies:=New b2Body[700]
	Field body:b2Body,body2:b2Body
	Field joints:=New b2Joint[14]
	Field MouseJoint:b2MouseJoint
	
	Field jdMouse: b2MouseJointDef
	'step values
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2
	'center point and zoom of the camera
	Field viewpoint:=New b2Vec2(-50,-120) 
	Field zoom:=3.5
	'(cpv(-50,-120),3.5)
	' trying to find if locals generates memory probs so I put some in Field section
	Field p:b2Vec2
	Field d:=New b2Vec2(0.001,0.001)
	Field aabb:b2AABB
	Field callback:AABBQueryCallback
	Field bodies4:b2Body

	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		
		Super.New( title,width,height,flags )
	

	    'Local jd:b2JointDef
	    
	
	'------- Initialising the world with its gravity
		down=New b2Vec2(0,10)
		world=New b2World(down)
		
		    		
	'----- debugdrawer init and link---------------------------------------------------------------------------------------------
		DDrawer=New b2Draw_mojo 'this one must be a field or a global 
		world.SetDebugDraw( DDrawer  ) '
		DDrawer.SetFlags( e_shapeBit|e_jointBit )
		DDrawer.y_axis_direction=1
		Init_b2Assets()
		
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
		DDrawer.SetCamera(viewpoint,zoom) 
		
		'ask physics world to draw debug datas (using our DDrawer instance of b2Draw_mojo class)
		world.DrawDebugData()
		
		canvas.Color=Color.White
		canvas.DrawText("FPS:"+App.FPS+"    -- press space to hide/show shapes -- arrows to move -- E/D to zoom/unzoom -- Return to restart",15,15)
		canvas.DrawText("Mouse location in physWorld: "+b2Vec2ToS(DDrawer.CanvasToPhysics(Mouse.Location)),15,55)
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
		 If Keyboard.KeyPressed(Key.Enter)
		 	world.Destroy()
		 	world=New b2World(down)
		 	world.SetDebugDraw( DDrawer  )
		 	Init_b2Assets()
		 End
		 
		 
		 'The Mouse joint (using the custom AABBQueryCallback included in box2d.monkey2)
		 If Mouse.ButtonPressed(MouseButton.Left)
		  	p=DDrawer.CanvasToPhysics(Mouse.Location)
		  	aabb.lowerBound=New b2Vec2(p.x-d.x,p.y-d.y) ' faudrait voir si y a moyen de moyenner les operateurs
		  	aabb.upperBound=New b2Vec2(p.x+d.x,p.y+d.y)
		  	
			callback=New AABBQueryCallback(p)
			world.QueryAABB(callback,aabb)
			
			If (callback.q_fixture)
				bodies4=callback.q_fixture.GetBody()
				jdMouse.bodyA = bodies[20] 'this is a random static body, usualy "ground body" an empty body, but I chose to use a static one
				jdMouse.bodyB = bodies4
				jdMouse.collideConnected = False
				jdMouse.maxForce=1000.0*bodies4.GetMass()
				jdMouse.target=DDrawer.CanvasToPhysics(Mouse.Location)
		    	joints[13]= world.CreateJoint(Varptr jdMouse)
		    	bodies4.SetAwake(true)
		    End
		 End
		 If Mouse.ButtonDown(MouseButton.Left)
		 							'b2JointTob2MouseJoint is a custom c++ Func needed because monkey2 can't use cast operator on "extend void". Is there a more elegant solution?
		 	If joints[13]<>Null Then b2JointTob2MouseJoint(joints[13]).SetTarget(DDrawer.CanvasToPhysics(Mouse.Location))
		 End
		 If Mouse.ButtonReleased(MouseButton.Left)
		 	If joints[13]<>Null
		 		world.DestroyJoint(joints[13])
				joints[13] = Null
			End
		 End
	End
	


'------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'
'
'
'
'
'		ASSETS CREATION METHOD			this should find a place in another file or something because it's huge (or find a "code folding" editor)
'
'
'
'
'
'
'
'-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Method Init_b2Assets()
		
	    Local bd:b2BodyDef
	    Local fd:b2FixtureDef
	    
	    Local shape:=New b2CircleShape()
	    
	    Local vs:b2Vec2[]
	    
	    '
	    '---------------- this will create the bodies And the joints --------------------
		'

		
For Local i:=0 To 50
For Local j:=0 To 30
  bd.type = b2BodyType.b2_dynamicBody
  bd.position.Set( -90+i*2.2+j*0.2,-150+j*2.2)
  bd.angle = 0.000000000000000e+000
  bd.linearVelocity.Set(0.000000000000000e+000, 0.000000000000000e+000)
  bd.angularVelocity = 0.000000000000000e+000
  bd.linearDamping = 0.000000000000000e+000
  bd.angularDamping = 0.000000000000000e+000
  bd.allowSleep = True
  bd.awake = True
  bd.fixedRotation = False
  bd.bullet = False
  bd.active = True
  bd.gravityScale = 1.000000000000000e+000
  bodies[i+j*51] = world.CreateBody(Varptr bd)

  
    
    fd.friction = 0.1
    fd.restitution = 0.000000000000000e+000
    fd.density = 1.0
    fd.isSensor = False

    shape.m_radius = 1.0
    shape.m_p.Set(0.000000000000000e+000, 0.000000000000000e+000)

    fd.shape = shape

    bodies[i+j*51].CreateFixture(Varptr fd)
    
 Next
 Next
  
  
		
	
		
	    Local polyshap:=New b2PolygonShape
    vs=New b2Vec2[10]

    	for Local it:=0 To 4
			Local angle:Float
			angle = -2.0*Pi*it/(1.0*5)
			vs[it].Set(3*Cos(angle), 3*Sin(angle))
		Next
    
    polyshap.Set(Varptr vs[0], 5)
	
	
	
	
For Local i:=0 To 19
For Local j:=0 To 9
  bd.type = b2BodyType.b2_dynamicBody
  bd.position.Set(-100.0+i*6.5, -220.0+j*6.5)
  bd.angle = 1.029948234558105e+000
  bd.linearVelocity.Set(0.000000000000000e+000, 0.000000000000000e+000)
  bd.angularVelocity = 0.000000000000000e+000
  bd.linearDamping = 0.000000000000000e+000
  bd.angularDamping = 0.000000000000000e+000
  bd.allowSleep = True
  bd.awake = True
  bd.fixedRotation = False
  bd.bullet = False
  bd.active = True
  bd.gravityScale = 1.000000000000000e+000
  pen_bodies[i+j*20] = world.CreateBody(Varptr bd)

  
    
    fd.friction = 0.1
    fd.restitution = 0.000000000000000e+000
    fd.density = 1.000000000000000e+000
    fd.isSensor = False


    fd.shape = polyshap

    pen_bodies[i+j*20].CreateFixture(Varptr fd)
Next
Next

		bd.type = b2BodyType.b2_staticBody
 		bd.position.Set(0, -70)
  		bd.angle = 0.0
  		bodies[1599]=world.CreateBody(Varptr bd)
  	
    	fd.friction = 2.0
    	fd.restitution = 0.7 '(little bouncing)
    	fd.density = 1.0
    	
    	Local pshape:=New b2PolygonShape()
    	
    	vs[0].Set(100.0, -1.0)
    	vs[1].Set(100.0, 1.0)
    	vs[2].Set(-200.0, 1.0)
    	vs[3].Set(-200.0, -1.0)
    	pshape.Set(Varptr vs[0], 4)
    	
    	fd.shape = pshape
    	bodies[1599].CreateFixture(Varptr fd)


End
End 'class

Function Main()
	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End