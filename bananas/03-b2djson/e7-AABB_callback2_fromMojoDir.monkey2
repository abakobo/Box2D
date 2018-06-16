#Import "<std>"
#Import "<mojo>"

#Import "../../box2d.monkey2"

#Import "../../iforce2d-b2djson/mx2b2djson.monkey2"

#Import "../assets/"

Using std..
Using mojo..
Using box2d..

Global w_width:=1000 'initial window size
Global w_height:=700


Class Box2DgfxTest Extends Window
	
	Field DDrawer:b2DebugDraw
	Field world:b2World

	'step values
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2

	'center point of camera in physics world
	Field viewpoint:=New b2Vec2(0,2)
	
	Field aabb:b2AABB

	'translate and zoom of the camera
	Field translate:=New Vec2f(660,940) 
	Field zoom:=0.4
	
	Field callback:=New AABBQueryCallback ()
	
	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		
		Super.New( title,width,height,flags )
	
	    Local bd:b2BodyDef
	    Local fd:b2FixtureDef
	    

	'------- Initialising the world with its gravity
	
		world=mx2b2dJson.Loadb2dJson("asset::fixturebalance.json")

'		mx2b2dJson.testNew()
		

    		
	'----- debugdrawer init and link---------------------------------------------------------------------------------------------
		DDrawer=New b2DebugDraw(57.0,True) 'this one must be a field or a global 
		world.SetDebugDraw( DDrawer  ) '
		DDrawer.SetFlags( e_shapeBit )
		
	End
	
	Method OnRender( canvas:Canvas ) Override
		App.RequestRender()
		canvas.Clear(Color.Black)
		
		canvas.DrawText("grab objects with you mouse to see AABB query/MouseJoint in action!",15,15)
		
		'// Instruct the world to perform a single step of simulation.
		'// It is generally best to keep the time step and iterations fixed. ---> they have been set globally
		world.Stepp(timeStep, velocityIterations, positionIterations)
		
		canvas.Translate(500,500)
		canvas.Scale(1.5,1.5)
		Local transfoMat:=canvas.Matrix
		' passing the canvas to the b2Draw_mojo instance (DDrawer)
		' It's mandatory before calling world.DrawDebugData()	
		DDrawer.SetCanvas(canvas) 
		
		'ask physics world to draw debug datas (using our DDrawer instance of b2Draw_mojo class)
		world.DrawDebugData()

		Local mousePhysicsLocation:=DDrawer.ToPhysicsLocation(-transfoMat*MouseLocation)
		
		Local rayLength:=250.0
		canvas.Color=Color.Red
		
		If Mouse.ButtonPressed(MouseButton.Left)
		  	aabb.lowerBound=mousePhysicsLocation
		End
		If Mouse.ButtonDown(MouseButton.Left)
		 	'canvas.DrawRect(New Rectf(DDrawer.FromPhysicsLocation(aabb.lowerBound),-transfoMat*MouseLocation))
		 	
		 	Local ab:=DDrawer.FromPhysicsLocation(aabb.lowerBound)
		 	Local mo:=-transfoMat*MouseLocation
		 	Local mob:=New Vec2f(ab.x,mo.y)
		 	Local abo:=New Vec2f(mo.x,ab.y)
		 	canvas.DrawLine(ab,mob)
		 	canvas.DrawLine(mo,mob)
		 	canvas.DrawLine(mo,abo)
		 	canvas.DrawLine(ab,abo)
		 	
		End
		If Mouse.ButtonReleased(MouseButton.Left)
			aabb.upperBound=mousePhysicsLocation
			Print aabb.lowerBound
			Print aabb.upperBound
			world.QueryAABB(callback,aabb)
			
		End
		
		canvas.DrawText(callback.q_bodies.Length,-50,-50)
		
		If Not callback.q_bodies.Empty
			Print "ya du body"
			For Local bod:=Eachin callback.q_bodies
				
				Local p:=DDrawer.FromPhysicsLocation(bod.GetPosition())
				
				canvas.DrawCircle(p.x,p.y,3)
			Next
			
		End
			
	End
End

Class AABBQueryCallback Extends b2QueryCallback
	Field q_a:b2Vec2
	Field q_b:b2Vec2
	Field q_bodies:Stack<b2Body>
	Method New()
		q_a.x=0
		q_a.y=0
		q_b.x=0
		q_b.y=0
		q_bodies=New Stack<b2Body>
	End
	Method Clean()
		q_a.x=0
		q_a.y=0
		q_b.x=0
		q_b.y=0
		q_bodies=New Stack<b2Body>
	End
	Method ReportFixture:Bool(fixture:b2Fixture) Override
		Print "check" 
		q_bodies.Add(fixture.GetBody())
		Return True
	End
End 

Function Main()

	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End
