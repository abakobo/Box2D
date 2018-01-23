Namespace MyApp

#Import "<std>"
#Import "<mojo>"
#Import "<pyro-scenegraph>"	

#Import "box2d.monkey2"
#Import "mx2_box2d/b2Draw_Pyro.monkey2"
#Import "mx2_box2d/b2dJsonImage.monkey2"
#Import "mx2_box2d/b2dPyro2.monkey2"

#Import "iforce2d-b2djson/mx2b2djson.monkey2"
#Import "assets/"
#Import "assets/images/@/images/"

Using std..
Using mojo..
Using box2d..
Using b2dJsonImage..
Using pyro.framework..
Using pyro.scenegraph..
Using b2dPyro2..


Global virtualResolution:=New Vec2i( 800,600 )															' Backing global for virtual resolution.

Class PyroExample Extends Window

	' Backing fields:
	Field camera:Camera
	Field logo:LayerSprite
	Field physSprites:LayerSprite[]
	Field elli:LayerEllipse
	Field scene:Scene
	
	Field world:b2World
	Field bodyInfs:b2BodyImageInfo[]
	Field physScale:=15.0
	
	'step values
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2
	
	Field DDrawer:b2DebugDraw

	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )

		Super.New( title,width,height,flags )

		Layout="letterbox"
		
		ClearColor=Color.Black

		' To use sprites you need to setup the scene with a camera and atleast 1 layer:
		scene=New Scene( Self )						' Create a scene.

		camera=New Camera( scene )

		camera.Zoom=1.0		
		
		camera.SetByCenterViewpoint(New Vec2f(0,0),1.0,0.0,virtualResolution)															' Zoom point is the center of the screen ( 0,0 by default ).

		Local layer:=New Layer( scene )				' Add layer.
		
		elli=New LayerEllipse(layer,50,70)
		elli.Location=New Vec2f(100,100)
		
		
		'Load b2dJson
		'------------------
		'------- Initialising the world 
		
		Local jsonPath:="asset::images.json"
		world=mx2b2dJson.b2dJsonReadFromAsset(jsonPath)
		
		'---- create body to image info array
		bodyInfs=Createb2BodyImageInfoArray(world,jsonPath)
	
	
		'++++++++++ Create b2LayerSprites
		physSprites=Createb2LayerSprites(layer,bodyInfs,physScale,True)
		
		' add debugdrw
		DDrawer=New b2DebugDraw(physScale)
		
		world.SetDebugDraw( DDrawer  )
		DDrawer.SetFlags( e_shapeBit|e_jointBit )
		
																		

	End

	Method OnMeasure:Vec2i() Override
		Return virtualResolution
	End

	Method OnRender( canvas:Canvas ) Override
	
		App.RequestRender()
		
		world.Stepp(timeStep, velocityIterations, positionIterations)

		Updateb2LayerSprites(physSprites,bodyInfs,physScale,True)

		scene.Update()																					' Update must be called before Draw!

		' Zoom and rotate keys:
		If Keyboard.KeyDown( Key.LeftControl )
			If Keyboard.KeyDown( Key.R ) camera.Rotation-=.05
			If Keyboard.KeyDown( Key.Z ) camera.Zoom-=.01
		Else
			If Keyboard.KeyDown( Key.R ) camera.Rotation+=.05
			If Keyboard.KeyDown( Key.Z ) camera.Zoom+=.01
		Endif
		
		If Keyboard.KeyDown( Key.Left ) camera.X-=1
		If Keyboard.KeyDown( Key.Right ) camera.X+=1
		If Keyboard.KeyDown( Key.Up ) camera.Y-=1
		If Keyboard.KeyDown( Key.Down ) camera.Y+=1
		
		scene.Draw( canvas )																			' Draw all scene objects to canvas.

		canvas.DrawText( "Use R or Left Control+R to rotate.",8,8 )
		canvas.DrawText( "Use Z or Left Control+Z to zoom in/out.",8,8+canvas.Font.Height )
		
		canvas.PushMatrix()
		
		Local centerPos:=New Vec2f(virtualResolution.x/2+camera.X,virtualResolution.y/2+camera.Y)
		canvas.SetCameraByCenter(centerPos,camera.Zoom,-camera.Rotation)',virtualResolution)
		'Print "canv mat:      "+canvas.Matrix
		'Print "cam getmatrix: "+camera.GetMatrix()
		canvas.Color=Color.Black
		canvas.DrawCircle(100,100,50)
		
		canvas.PopMatrix()
		
		'canvas.Matrix=camera.GetMatrix()
		
		camera.TransformCanvas(canvas)
		
		canvas.Color=Color.Green
		canvas.DrawCircle(100,100,25)
		
		DDrawer.SetCanvas(canvas)
		world.DrawDebugData()
		canvas.Color=Color.White
		
		

	End

End
#rem
Class Camera Extension
	Method SetByCenterViewpoint(viewpoint:Vec2f,zoom:Float,rotation:Float,vResolution:Vec2f)
		
		RotationPoint=vResolution/2
		ZoomPoint=vResolution/2
		Location=viewpoint-(vResolution/2)
		
		Rotation=rotation
		Zoom=zoom		
	End
End
#end

Class Canvas Extension
 
	Method SetCameraByCenter(point_x:Float,point_y:Float,zoom:Float=1.0,rotation:Float=0.0,vr:Vec2f=New Vec2f(0,0))
 
		Translate(Viewport.Width/2,Viewport.Height/2)
		Scale(zoom,zoom)
		Rotate(rotation)
		Translate(-point_x,-point_y)
 
	End
	
	Method SetCameraByCenter(point:Vec2f,zoom:Float=1.0,rotation:Float=0,vr:Vec2f=New Vec2f(0,0))
 
		Translate(Viewport.Width/2,Viewport.Height/2)
		Scale(zoom,zoom)
		Rotate(rotation)
		Translate(-point)
 
	End
	
End

Function Main()

	New AppInstance
	
	New PyroExample( "Pyro example",1000,750 )
	
	App.Run()

End
