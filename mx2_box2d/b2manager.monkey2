Namespace box2d

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"
#Import "b2dJsonImage.monkey2"
#Import "../iforce2d-b2djson/mx2b2djson.monkey2"
#Import "b2draw.monkey2"


Using std..
Using mojo..
Using box2d..
Using b2dJsonImage..
Using b2draw..

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
	
	Field DebugDrawer:b2DebugDrawer
	
	
	
	
	Method New(gravity:b2Vec2,pScale:Float=15)
		world=New b2World(gravity)	
	End
	
	Method New (jsonPath:String,pScale:Float=15,offset:b2Vec2=New b2Vec2(0,0))
		
		physScale=pScale
		
		world=mx2b2dJson.b2dJsonReadFromAsset(jsonPath) 'offset TODO!
		
		DebugDrawer=New b2DebugDrawer(physScale)
		
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
	
	
End


