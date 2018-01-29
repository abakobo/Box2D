#Import "<std>"
#Import "<mojo>"
#Import "../../mx2_box2d/b2Manager"

#Import "../assets/"
#Import "../assets/images/@/images/"

Using std..
Using mojo..
Using box2d..

Global w_width:=1000 'initial window size
Global w_height:=700

Class Box2DgfxTest Extends Window

	Field physManager:b2Manager
	Field drawDebug:=True
	
	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		Super.New( title,width,height,flags )
		ClearColor=Color.Black
		'------- Initialising b2Manager (the world and all the stuff associated wth the Json) 
		physManager=New b2Manager("asset::images.json")	
				
		If physManager.b2dJsons[0]=Null
			Print "---------------Null"
		Else
		
			Local fix:=GetFixtureByName(physManager.b2dJsons[0] , "caicaisse")
		
			Print "------------------FIX-----------------"
			If fix=Null Then Print "FIX IS NULL!!!" 
			Print fix.GetDensity ()
			Print "--------------------------------------"
			
			Local fixturesArr:= GetFixturesByName(physManager.b2dJsons[0] , "c2")
			

			For Local i:=0 Until fixturesArr.Length
				Print i
				Print fixturesArr[i].GetDensity ()
			Next
			
			Local stacko:=Createb2FixtureInfoStack(physManager.world,"asset::images.json",physManager.b2dJsons[0])
			
			For Local fixInfo:=Eachin stacko
				Print fixInfo.name
			Next
			
			
		End
	End
	
	Method OnRender( canvas:Canvas ) Override
		
		App.RequestRender()
		
		canvas.PushMatrix()
		canvas.Translate(500,350)
		canvas.Scale(New Vec2f(2.0,2.0))

		physManager.StepWorld()

		physManager.DrawDebug(canvas)
		physManager.DrawBodies(canvas)
		canvas.PopMatrix()
		canvas.DrawText("press S to Save scene to json with image reference (save in same dir as original to keep relative path)",5,15)
		
		If Keyboard.KeyPressed(Key.S|Key.Raw)
			Local savePath:=RequestFile( "Save b2dJson","Json files:json",True )
			physManager.Save(savePath)
		End
	End
End

Function Main()

	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End