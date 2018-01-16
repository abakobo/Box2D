#Import "<std>"
#Import "<mojo>"

#Import "box2d.monkey2"
#Import "b2Draw_mojo.monkey2"
#Import "mx2_box2d/b2dJsonImage.monkey2"

#Import "iforce2d-b2djson/mx2b2djson.monkey2"
#Import "assets/"
#Import "assets/images/@/images/"

Using std..
Using mojo..
Using box2d..
Using b2dJsonImage..

Global w_width:=1000 'initial window size
Global w_height:=700

Global zoomFactor:=23.0

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
	
	Field bodyInfoArr:b2BodyImageInfo[]
	
	Field drawDebug:=True
	
	'Field img1:Image

	'center point of camera in physics world
	Field viewpoint:=New b2Vec2(0,2)
	
	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		
		Super.New( title,width,height,flags )
	
	    Local bd:b2BodyDef
	    Local fd:b2FixtureDef
	    
	'------- Initialising the world 


		'Local jsonPath:="asset::car.json"
		Local jsonPath:="asset::images.json"

		world=mx2b2dJson.b2dJsonReadFromAsset(jsonPath)

	'----- debugdrawer init and link---------------------------------------------------------------------------------------------
		DDrawer=New b2Draw_mojo 'this one must be a field or a global 
		DDrawer.scale=50.0
		world.SetDebugDraw( DDrawer  ) '
		DDrawer.SetFlags( e_shapeBit )
		DDrawer.SetCamera(New b2Vec2(2,2),zoomFactor)  
		
		
	'---- create to body to image info array
		
		bodyInfoArr=Createb2BodyImageInfoArray(world,jsonPath)
		
		


 	
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
		
		If Keyboard.KeyPressed(Key.Space) Then drawDebug=Not drawDebug
		
		If drawDebug
			world.DrawDebugData()
			canvas.Color=Color.White
		End
		
		

		
		For Local i:=0 Until world.GetBodyCount()
				If bodyInfoArr[i].image<>Null
					Local pos:=DDrawer.PhysicsToCanvas(bodyInfoArr[i].imageWorldPosition)
					Local rot:=bodyInfoArr[i].imageWorldAngle


					'canvas.DrawImage(bodyInfoArr[i].image,pos,rot,New Vec2f (zoo,zoo))
					
					canvas.DrawImage(bodyInfoArr[i].image,pos,rot,bodyInfoArr[i].imageRenderScale*zoomFactor)
				
				End
		Next
		
		
		
		'quit the app after 800 cycles
		
		If Keyboard.KeyPressed(Key.Escape)
      App.Terminate()
		End 
	End
End


Function Main()

	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End