Namespace MyApp

#Import "<std>"
#Import "<mojo>"
#Import "<pyro-scenegraph>"	


#Import "mx2_box2d/b2manager.monkey2"

'#Import "box2d.monkey2"
'#Import "mx2_box2d/b2draw.monkey2"
'#Import "mx2_box2d/b2dJsonImage.monkey2"
#Import "mx2_box2d/b2dPyro2.monkey2"
'#Import "iforce2d-b2djson/mx2b2djson.monkey2"

#Import "assets/"
#Import "assets/images/@/images/"

Using std..
Using mojo..
'Using box2d..
'Using b2dJsonImage..
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
	Field elli2:LayerEllipse
	Field scene:Scene
	
	Field layer:Layer
	'Field layersCount:=11
	
	Field pManager:b2Manager

	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )

		Super.New( title,width,height,flags )
		Layout="letterbox"
		
		ClearColor=Color.Black

		' To use sprites you need to setup the scene with a camera and atleast 1 layer:
		
		scene=New Scene( Self )						' Create a scene.

		camera=New Camera( scene )

		camera.Zoom=1.0		
		
		camera.SetByCenterViewpoint(New Vec2f(0,0),1.5,0.0,virtualResolution)															' Zoom point is the center of the screen ( 0,0 by default ).

		' Add several layers to manage rendering orders.

		layer=New Layer( scene )	

		'layers=New Layer[layersCount]
		'For Local i:=0 Until layersCount
		'	layers[i]=New Layer( scene )				
		'End
		
		'Load b2dJson using the b2Manager
		
		'Local jsonPath:="asset::tank.json"  'choose one of the scenes
		'Local jsonPath:="asset::images.json"
		'Local jsonPath:="asset::car.json"
		'Local jsonPath:="asset::1joint.json"
		'Local jsonPath:="asset::everyjointstest5.json"
		Local jsonPath:="asset::motortest2.json"
		
		pManager=New b2Manager(jsonPath)
		
		mx2b2dJson.b2dJsonWriteToFile_ext(pManager.world,"C:/test/motortestnew.json")
		
		physSprites=Createb2LayerSprites(layer,pManager.bodyInfos,pManager.bodyImageMap,pManager.physScale,pManager.yAxisInversion)															

	End

	Method OnMeasure:Vec2i() Override
		Return virtualResolution
	End

	Method OnRender( canvas:Canvas ) Override
	
		App.RequestRender()
		
		' Move, Zoom and rotate keys:
		If Keyboard.KeyDown( Key.LeftControl )
			If Keyboard.KeyDown( Key.R ) camera.Rotation-=.05
			If Keyboard.KeyDown( Key.Z ) camera.Zoom-=.01
		Else
			If Keyboard.KeyDown( Key.R ) camera.Rotation+=.05
			If Keyboard.KeyDown( Key.Z ) camera.Zoom+=.01
		Endif
		
		If Keyboard.KeyDown( Key.Left ) camera.X-=2/camera.Zoom
		If Keyboard.KeyDown( Key.Right ) camera.X+=2/camera.Zoom
		If Keyboard.KeyDown( Key.Up ) camera.Y-=2/camera.Zoom
		If Keyboard.KeyDown( Key.Down ) camera.Y+=2/camera.Zoom

		
		
			
		'step b2World
		
		pManager.StepWorld()

		'Draw b2 Debug 'this should be transformed in a b2DrawPyro extension method

		canvas.PushMatrix()
		
		camera.TransformCanvas(canvas)
		pManager.DebugDrawer.SetCanvas(canvas)
		pManager.world.DrawDebugData()
		canvas.Color=Color.White
		
		canvas.PopMatrix()
		
		'Pyro Draw
		
		Updateb2LayerSprites(physSprites,pManager.bodyInfos,pManager.bodyImageMap,pManager.physScale,pManager.yAxisInversion)
		
		scene.Update()																					' Update must be called before Draw!
		scene.Draw( canvas )																			' Draw all scene objects to canvas.

		'Normal Draw
		
		canvas.DrawText( "Use R or Left Control+R to rotate.",8,8 )
		canvas.DrawText( "Use Z or Left Control+Z to zoom in/out.",8,8+canvas.Font.Height )
		canvas.DrawText( "Use arrows to move",8,8+2*canvas.Font.Height )
		'Local tankPhysPos:=pManager.GetBody("tankchassis")?.GetPosition()
		'canvas.DrawText( "Tank Phys position: "+b2Vec2ToS(tankPhysPos),8,8+3*canvas.Font.Height)
		'canvas.DrawText( "Tank Canv position: "+pManager.FromPhysics(tankPhysPos),8,8+4*canvas.Font.Height)
		
		'camera.SetByCenterViewpoint(pManager.FromPhysics(tankPhysPos),camera.Zoom,camera.Rotation,virtualResolution)
		
	End

End


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
