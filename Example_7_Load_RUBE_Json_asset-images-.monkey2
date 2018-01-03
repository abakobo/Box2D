#Import "<std>"
#Import "<mojo>"

#Import "box2d.monkey2"
#Import "b2Draw_mojo.monkey2"

#Import "iforce2d-b2djson/mx2b2djson.monkey2"
#Import "assets/"

Using std..
Using mojo..
Using box2d..

Global w_width:=1000 'initial window size
Global w_height:=700


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

	'center point of camera in physics world
	Field viewpoint:=New b2Vec2(0,2)
	
	Method New( title:String,width:Int,height:Int,flags:WindowFlags=WindowFlags.Resizable )
		
		
		Super.New( title,width,height,flags )
	
	    Local bd:b2BodyDef
	    Local fd:b2FixtureDef
	    
	'------- Initialising the world 


		Local jsonPath:="asset::126.json"

		'Local theStr:=LoadString("asset::scene1.json",True)
		world=mx2b2dJson.b2dJsonReadFromAsset(jsonPath)

	'----- debugdrawer init and link---------------------------------------------------------------------------------------------
		DDrawer=New b2Draw_mojo 'this one must be a field or a global 
		world.SetDebugDraw( DDrawer  ) '
		DDrawer.SetFlags( e_shapeBit )
		DDrawer.SetCamera(New b2Vec2(2,2),70)  
		
		
		'comparage body index
		
		Local bodyInfoArr:=Createb2BodyImageInfoArray(world,jsonPath)
		
		For Local i:=0 Until bodyInfoArr.Length
			'Print bodyInfoArr[i]?.imagePosition
		Next
		
'		For Local i:=0 Until world.GetBodyCount()
'			Print b2Vec2ToS(barr[i].GetPosition ())
'		Next



		

 	
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
		
		If Keyboard.KeyPressed(Key.Escape) Then App.Terminate()
	End
End
Function CreateBodyArray:b2Body[](world:b2World)

	Local count:=world.GetBodyCount ()
	Local BodyArray:=New b2Body[count]
	
	BodyArray[0]=world.GetBodyList()
	Local i:=1
	While i < count
		BodyArray[i]=BodyArray[i-1].GetNext()
		i+=1
	Wend
	
	Return BodyArray
	
End

Function GetImageCenterMap:IntMap<b2Vec2>(path:String)
	
	Local lobj:=JsonObject.Load( path )
	Local positionsMap:=New IntMap<b2Vec2>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			Print "image" +i
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			Print imgelemobj["body"].ToNumber()
			
			If imgelemobj["center"]

				Local imgval:=imgelemobj["center"]
				
				If imgval.IsNumber 'center is (0,0)
					
					Print "center: 0,0 :  "+imgval.ToNumber()
					
					positionsMap[i]=New b2Vec2(0,0)
					
				Else 'imgval.isObject --> center with two elements x and y
					
					Local centerobj:=imgval.ToObject()
					Local x:= centerobj["x"].ToNumber()
					Local y:= centerobj["y"].ToNumber()
					'Print "center: "+ x +" , "+y
					positionsMap[i]=New b2Vec2(x,y)
						
				End			
			Else
				"-+-+-+-+-+-+-+-+-+"
			End
		Next

	Else
		Print "no 'image' value"
	End
	
	Return positionsMap
	
End

Function Createb2BodyImageInfoArray:b2BodyImageInfo[](world:b2World,path:String)
	
	Local bodyCount:=world.GetBodyCount()
	Local ret:=New b2BodyImageInfo[bodyCount]
	
	Local bodyArray:=CreateBodyArray(world)
	For Local i:=0 Until bodyCount
		ret[i]=New b2BodyImageInfo()
		ret[i].body=bodyArray[i]
		ret[i].index=i
	Next
	
	Local posMap:=GetImageCenterMap(path)
	For Local i:=0 Until bodyCount
		If posMap.Contains(i)
		ret[i].imagePosition=b2Vec2ToVec2f(posMap[i])
			Print "body "+i+ " has image" + b2Vec2ToS (posMap[i])
		Else
			ret[i].imagePosition=Null
		End
	Next
	
	Return ret

End

Struct b2BodyImageInfo
	
	Field body:b2Body
	Field index:Int
	
	Field bodyName:String
	
	Field imageName:String
	Field imagePosition:Vec2f
	Field imageScale:Float
	Field imageAngle:Float
	
End


Function Main()

	New AppInstance
	New Box2DgfxTest( "Box2D_test",w_width,w_height )
	App.Run()
End