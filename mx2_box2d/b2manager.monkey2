Namespace box2d

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"
#Import "b2dJsonBodyImage.monkey2"
#Import "b2dJsonJoint.monkey2"
#Import "../iforce2d-b2djson/mx2b2djson.monkey2"
#Import "b2draw.monkey2"


Using std..
Using mojo..
Using box2d..
Using b2dJsonInfo..


Class b2Manager
	
	
	Field world:b2World
	
	Field physScale:Float
	Field yAxisInversion:=True
	
	Field timeStep:= 0.01666666667
	Field velocityIterations := 6
	Field positionIterations := 2
	
	
	Field bodyInfos:b2BodyImageInfo[]
	Field bodyImageMap:IntMap<Image>
	
	'Field jointInfos:b2JointsInfo[] 'TODO
	
	Field DebugDrawer:b2DebugDraw
	
	
	
	
	Method New(gravity:b2Vec2,pScale:Float=15,yAxisInversion:Bool=True)
		world=New b2World(gravity)
		
		DebugDrawer=New b2DebugDraw(physScale,yAxisInversion)	
	End
	
	Method New (jsonPath:String,pScale:Float=15,yAxisInversion:Bool=True,offset:b2Vec2=New b2Vec2(0,0))
		
		physScale=pScale
		
		world=mx2b2dJson.b2dJsonReadFromAsset(jsonPath) 'offset TODO!
		
		DebugDrawer=New b2DebugDraw(physScale,yAxisInversion)
		
		world.SetDebugDraw( DebugDrawer  )
		DebugDrawer.SetFlags( e_shapeBit|e_jointBit )
		
		bodyInfos=Createb2BodyImageInfoArray(world,jsonPath)
		bodyImageMap=Createb2BodyImageMap(bodyInfos)
		
	End
	
	Method addJson(jsonPath:String,offset:b2Vec2=New b2Vec2(0,0))
		Print "add Json TODO...."
	End
	
	Method StepWorld()
		world.Stepp(timeStep, velocityIterations, positionIterations)
	End
	
	Method UpdateInfos()
		'usefull?
	End
	
	Method GetBodies:b2Body[](name:String)
		
		Local retArray:=New b2Body[bodyInfos.Length]
		Local j:=0
		For Local i:=0 Until bodyInfos.Length
			If bodyInfos[i].bodyName=name
				retArray[j]=bodyInfos[i].body
				j+=1
			End
		End
		If j>0
			retArray.Resize(j)
		Else
		#If __DEBUG__
			Print "No body with name "+name+" !!!!!!!!!!!!!!!"
		#End
			Return Null
		End
		Return retArray
	End
	
	Method GetBody:b2Body(name:String)
		Local i:=0
		While i<bodyInfos.Length
			If bodyInfos[i].bodyName=name Then Return bodyInfos[i].body
			i+=1
		Wend
		
		#If __DEBUG__
			Print "No body with name "+name+" !!!!!!!!!!!!!!!"
		#End
		
		Return Null

	End
	
	Method ToPhysics:b2Vec2(Location:Vec2f)

		Return DebugDrawer.ToPhysicsLocation(Location)
		
	End
	
	Method FromPhysics:Vec2f(physLocation:b2Vec2)
		
		Return DebugDrawer.FromPhysicsLocation(physLocation)
		
	End
	
	
	
End


