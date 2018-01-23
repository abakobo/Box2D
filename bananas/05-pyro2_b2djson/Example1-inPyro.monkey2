Namespace MyApp

#Import "<std>"
#Import "<mojo>"
#Import "<pyro-scenegraph>"	

#Import "box2d.monkey2"
#Import "b2Draw_mojo.monkey2"
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


Global virtualResolution:=New Vec2i( 640,480 )															' Backing global for virtual resolution.

Class PyroExample Extends Window

	' Backing fields:
	Field camera:Camera
	Field logo:LayerSprite
	Field physSprites:LayerSprite[]
	Field elli:LayerEllipse
	Field scene:Scene
	
	Field world:b2World
	Field bodyInfs:b2BodyImageInfo[]
	Field physScale:=New Vec2f(15,15)
	
	'step values
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2

	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )

		Super.New( title,width,height,flags )

		Layout="letterbox"

		' To use sprites you need to setup the scene with a camera and atleast 1 layer:
		scene=New Scene( Self )																			' Create a scene.

		camera=New Camera( scene )
		'Local viewPoint:=virtualResolution/2'New Vec2f(
		'Local viewPoint:=New Vec2f(	0 , 0 )															' Setup camera.
		'camera.RotationPoint=virtualResolution/2'viewPoint'New Vec2f(0,0)'virtualResolution/2																' Rotation point is the center of the screen ( 0,0 by default ).
		'camera.ZoomPoint=virtualResolution/2'viewPoint'New Vec2f(0,0)'virtualResolution/2
		
		'camera.Location=viewPoint-(virtualResolution/2)		
		
		camera.SetByCenterViewpoint(New Vec2f(0,0),1.0,0.0,virtualResolution)															' Zoom point is the center of the screen ( 0,0 by default ).

		Local layer:=New Layer( scene )																	' Add layer.

		' Create the background sprite:
		' (  Note that the content manager is used to load the images but Image.Load can also be used instead )
		'Local background:=New LayerSprite( layer,Content.GetImage( "asset::background.png" ) )
		'background.Location=virtualResolution/2																' Center of the screen.
		
		' Create the logo sprite:
		'logo=New LayerSprite( layer,Content.GetImage( "asset::playniax.png" ) )
		'logo.Location=virtualResolution/2
		
		elli=New LayerEllipse(layer,50,70)
		elli.Location=New Vec2f(0,0)
		
		
		'Load b2dJson
		'------------------
		'------- Initialising the world 
		
		Local jsonPath:="asset::images.json"
		world=mx2b2dJson.b2dJsonReadFromAsset(jsonPath)
		
		'---- create body to image info array
		bodyInfs=Createb2BodyImageInfoArray(world,jsonPath)
	
	
		'++++++++++ Create b2LayerSprites
		physSprites=Createb2LayerSprites(layer,bodyInfs,physScale)																	

	End

	Method OnMeasure:Vec2i() Override
		Return virtualResolution
	End

	Method OnRender( canvas:Canvas ) Override
	
		App.RequestRender()
		
		world.Stepp(timeStep, velocityIterations, positionIterations)

		Updateb2LayerSprites(physSprites,bodyInfs,physScale)

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
Function Main()

	New AppInstance
	
	New PyroExample( "Pyro example",640,480 )
	
	App.Run()

End
