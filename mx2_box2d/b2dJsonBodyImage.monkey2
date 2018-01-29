Namespace b2dJsonInfo

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"

#Import "../iforce2d-b2djson/mx2b2djson.monkey2"

Using std..
Using mojo..
Using box2d..

'------------------
'
'   fixtures
'
'------------------

Struct b2FixtureInfo
	Field name:String
	Field fixture:b2Fixture
End

Function Createb2FixtureInfoStack:Stack<b2FixtureInfo> (world:b2World,path:String,b2json:b2dJson)
	'-----------------------------------------------------named_fixtures
	Local retStack:=New Stack<b2FixtureInfo>
	Local json:=JsonObject.Load( path )
	Local fixtureNameStack:=GetFixtureNameStack(json)
	
	For Local fixtureNameStr:=Eachin fixtureNameStack
			
			Local fixturesArr:= GetFixturesByName(b2json , fixtureNameStr)
			If fixturesArr.Length>0
				For Local i:=0 Until fixturesArr.Length
					
					Local inf:=New b2FixtureInfo()
					
					inf.name=fixtureNameStr
					inf.fixture=fixturesArr[i]
					
					retStack.Add(inf)
					
				Next
			End
			
	Next
	
	Return retStack
	
End

Function GetFixtureNameStack:StringStack(lobj:JsonObject)
	
	Local fixList:=New StringStack()
	
	If lobj["body"]
		
		Local imgval:=lobj["body"]
		Local imgarr:=imgval.ToArray() 
		Local imgArraySize:=imgarr.Length

		For Local i:=0 Until imgArraySize
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["fixture"]

				Local imgval:=imgelemobj["fixture"]
				
				If imgval.IsArray 
					
					Local fixArray:=imgval.ToArray()
					Local fixArraySize:=fixArray.Length
					
					For Local j:=0 Until fixArraySize
						
						Local fixarrelem:=fixArray[j]
						Local fixObj:=fixarrelem.ToObject()
						
						If fixObj["name"]
							Local fixname:=	fixObj["name"]
							If fixname.IsString
								Local fn:=fixname.ToString()
								If Not fixList.Contains(fn)
									fixList.Add(fn)
								End
							End
						Else
							#If __DEBUG__
								Print "a fixture in body "+i+" has no name! => Not added to fixture info array" 
							#End	
						End
					Next
					
				Else 
					#If __DEBUG__
						Print "error: Fixture in body "+i+" is not an jsonArray!" 
					#End	
				End			
			Else
				#If __DEBUG__
					Print "no 'body/fixture' value in json, body without fixture?"
				#End
			End
		Next

	Else
		#If __DEBUG__
			Print "no 'body' value in json !!!!!!!!!"
		#End
	End
	
	Return fixList
	
End

'--------------------------------------------------------
'
' body image infos
'
'------------------------------------------------------


Struct b2BodyImageInfo
	
	Field body:b2Body
	Field index:Int
	
	Field bodyName:String
	
	'Field fixtures:b2FixtureInfo[]
	
	Field imageRubeName:String
	Field imageFileName:String
	
	Field imageLocalPosition:Vec2f
	Field imageLocalAngle:Float	
	
	Field imageAspectScale:Float
	Field imageWorldHeight:Float
	Field imageRenderScale:Vec2f
	
	Field imageRenderOrder:Int
	Field imageOpacity:Float

	Field image:Image
	
	Property imageWorldPosition:b2Vec2()
		
		Local rotation:=New AffineMat3f().Rotate(-body.GetAngle()) '!!!checker si ça marche avec y_axis_inversion=false
		
		Return b2Vec2ToVec2f(body.GetPosition())+(rotation*imageLocalPosition)
		
	End
	
	Property imageWorldAngle:Float()
		
		Return body.GetAngle()+imageLocalAngle
		
	End
	
	
End

Function Createb2BodyImageMap:IntMap<Image>(bodyInfos:b2BodyImageInfo[])
	
	Local retMap:=New IntMap<Image>
	
	For Local i:=0 Until bodyInfos.Length
		If bodyInfos[i].image<>Null
			retMap[i]=bodyInfos[i].image
		Endif
	Next
	Return retMap
End

Function Createb2BodyImageInfoArray:b2BodyImageInfo[](world:b2World,path:String)
	
	'INIT
	Local bodyCount:=world.GetBodyCount()
	Local ret:=New b2BodyImageInfo[bodyCount]
	
	Local json:=JsonObject.Load( path )

	'maps images to bodies (because not all body has image,...)
	Local imageToBodyArray:=CreateImageToBodyArray(json)
	Local bodyToImageMap:=New IntMap<Int>
	For Local i:=0 Until imageToBodyArray.Length
		bodyToImageMap[imageToBodyArray[i]]=i
	Next
	'Gets all the bodies and reference them in the output info array
	Local bodyArray:=CreateBodyArray(world)
	For Local i:=0 Until bodyCount
		ret[i]=New b2BodyImageInfo()
		ret[i].body=bodyArray[i]
		ret[i].index=i
	Next
	'-----------------------------------------------------BodyName
	Local bodyNameMap:=GetBodyNameMap(json)
	For Local i:=0 Until bodyCount
		If bodyNameMap.Contains(i)
		ret[i].bodyName=bodyNameMap[i]
		

		Else
			ret[i].bodyName="nonamebody"
			#If __DEBUG__
				Print "body "+i+ " has no name has been renamed 'nonamebody'!!!!!!!!!!!!!!!"
			#End
		End
	Next
	
		
	'------------------------------------------------------ CENTER
	Local posMap:=GetImageCenterMap(json)
	For Local i:=0 Until bodyCount
		If bodyToImageMap.Contains(i)
			ret[i].imageLocalPosition=b2Vec2ToVec2f(posMap[bodyToImageMap[i]])
		Else
			ret[i].imageLocalPosition=Null
		End
	Next
	'----------------------------imageRubeName 
	Local rubeNameMap:=GetImageRubeNameMap(json)
	For Local i:=0 Until bodyCount
	
		If bodyToImageMap.Contains(i)
			ret[i].imageRubeName=rubeNameMap[bodyToImageMap[i]]
		Else
			ret[i].imageRubeName=Null
		End
	Next
	'----------------------------FileName and image load
	Local nameMap:=GetImageFileNameMap(json)
	For Local i:=0 Until bodyCount
	
		If bodyToImageMap.Contains(i)
			ret[i].imageFileName="asset::"+nameMap[bodyToImageMap[i]]
			ret[i].image=Image.Load(ret[i].imageFileName)
			If ret[i].image<>Null
				ret[i].image.Handle=New Vec2f (0.5,0.5)
			Else
				#If __DEBUG__
					Print "image load not ok "+i+"!! MISSING FILE?"
				#End
			End
		Else
			ret[i].imageFileName=Null
		End
		

	Next
	'-------------------------Aspect Scale of the image
	Local scaleMap:=GetimageAspectScaleMap(json)
	For Local i:=0 Until bodyCount
	
		If bodyToImageMap.Contains(i)
		ret[i].imageAspectScale=scaleMap[bodyToImageMap[i]]
		Else
			ret[i].imageAspectScale=1
		End
	Next
	
	'-------------------------Height Scale of the image (size in world unit!)
	Local heightMap:=GetimageWorldHeightMap(json)
	For Local i:=0 Until bodyCount
	
		If bodyToImageMap.Contains(i)
		ret[i].imageWorldHeight=heightMap[bodyToImageMap[i]]
		Else
			ret[i].imageWorldHeight=1
			#If __DEBUG__
				Print "WorldHeight body "+i+" has no image/file"
			#End
		End
	Next
	'---------------------- generating render scale
	
	For Local i:=0 Until bodyCount
		If bodyToImageMap.Contains(i)
			
			Local fact:=ret[i].imageWorldHeight/ret[i].image.Height
			ret[i].imageRenderScale=New Vec2f(fact*ret[i].imageAspectScale,fact)
		End
	Next
	
	'----------------------angle of the image
	Local angleMap:=GetimageLocalAngleMap(json)
	For Local i:=0 Until bodyCount
	
		If bodyToImageMap.Contains(i)
			ret[i].imageLocalAngle=angleMap[bodyToImageMap[i]]
		Else
			ret[i].imageLocalAngle=0
		End
	Next
	
	'----------------------opacity of the image
	Local opacityMap:=GetimageOpacityMap(json)
	For Local i:=0 Until bodyCount
	
		If bodyToImageMap.Contains(i)
			ret[i].imageOpacity=opacityMap[bodyToImageMap[i]]
		Else
			ret[i].imageOpacity=0
		End
	Next
	
	
	'---------- image render order
	Local orderMap:=GetimageRenderOrderMap(json)
	For Local i:=0 Until bodyCount
		If bodyToImageMap.Contains(i)
			ret[i].imageRenderOrder=orderMap[bodyToImageMap[i]]
		Else
			ret[i].imageRenderOrder=0
		End
	Next
	#rem
	For Local i:=0 Until bodyCount
		
		Print "--------"
		Print i
		Print ret[i].index
		Print ret[i].bodyName
		Print ret[i].imageFileName
		
	Next 
	#end
	
	
	Return ret

End

Function CreateImageToBodyArray:Int[](lobj:JsonObject)
	
	Local bodyImageArray: Int[]
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray()
		Local imgArraySize:=imgarr.Length
		bodyImageArray=New Int[imgArraySize]
		
		For Local i:=0 Until imgArraySize
			Local imgarrelem:=imgarr[i]
			Local imgelemobj:=imgarrelem.ToObject()
			
			bodyImageArray[i]=imgelemobj["body"].ToNumber()
		Next
	End
	Return bodyImageArray	
End

Function CreateBodyArray:b2Body[](world:b2World)

	Local count:=world.GetBodyCount ()
	Local BodyArray:=New b2Body[count]
	Local BodyArrayInv:=New b2Body[count]
	
	BodyArray[0]=world.GetBodyList()
	Local i:=1
	While i < count
		BodyArray[i]=BodyArray[i-1].GetNext()
		i+=1
	Wend
	For Local i:=0 Until count
		BodyArrayInv[i]=BodyArray[count-1-i]
	Next
	
	Return BodyArrayInv
	
End

Function GetBodyNameMap:IntMap<String>(lobj:JsonObject)
	
	Local namesMap:=New IntMap<String>
	
	If lobj["body"]
		
		Local imgval:=lobj["body"]
		Local imgarr:=imgval.ToArray() 
		Local imgArraySize:=imgarr.Length

		For Local i:=0 Until imgArraySize
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["name"]

				Local imgval:=imgelemobj["name"]
				
				If imgval.IsString 
					
					namesMap[i]=imgval.ToString()
					
				Else 
					#If __DEBUG__
						Print "Body "+i+" has no string name!" 
					#End	
				End			
			Else
				#If __DEBUG__
					Print "no 'body/name' value in json !!!!!!!!!"
				#End
			End
		Next

	Else
		#If __DEBUG__
			Print "no 'body' value in json !!!!!!!!!"
		#End
	End
	
	Return namesMap
	
End

Function GetImageCenterMap:IntMap<b2Vec2>(lobj:JsonObject)
	
	Local positionsMap:=New IntMap<b2Vec2>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray()
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["center"]

				Local imgval:=imgelemobj["center"]
				
				If imgval.IsNumber 'center is (0,0)
					
					positionsMap[i]=New b2Vec2(0,0)
					
				Else 'imgval.isObject --> center with two elements x and y
					
					Local centerobj:=imgval.ToObject()
					Local x:= centerobj["x"].ToNumber()
					Local y:= centerobj["y"].ToNumber()
					positionsMap[i]=New b2Vec2(x,y)
						
				End			
			Else
				#If __DEBUG__
					Print "no 'image/center' value"
				#End
			End
		Next

	Else
		#If __DEBUG__
			Print "no 'image' value"
		#End
	End
	
	Return positionsMap
	
End

Function GetImageRubeNameMap:IntMap<String>(lobj:JsonObject)
	
	Local namesMap:=New IntMap<String>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["name"]

				Local imgval:=imgelemobj["name"]
				
				If imgval.IsString
					
					namesMap[i]=imgval.ToString()
					
				Else 
					#If __DEBUG__
						Print "no json image rube name"
					#End
						
				End			

			End
		Next

	End
	
	Return namesMap
	
End

Function GetImageFileNameMap:IntMap<String>(lobj:JsonObject)
	
	Local namesMap:=New IntMap<String>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["file"]

				Local imgval:=imgelemobj["file"]
				
				If imgval.IsString
					
					namesMap[i]=imgval.ToString()
					
				Else 
					#If __DEBUG__
						Print "no json image rube name"
					#End
						
				End			

			End
		Next

	End
	
	Return namesMap
	
End

Function GetimageAspectScaleMap:IntMap<Float>(lobj:JsonObject)
	
	Local scalesMap:=New IntMap<Float>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize

			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["aspectScale"]

				Local imgval:=imgelemobj["aspectScale"]
				
				If imgval.IsNumber 
					
					scalesMap[i]=imgval.ToNumber()

				End			
			Else
			End
		Next

	Else
	End
	
	Return scalesMap
	
End

Function GetimageLocalAngleMap:IntMap<Float>(lobj:JsonObject)

	Local anglesMap:=New IntMap<Float>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["angle"]

				Local imgval:=imgelemobj["angle"]
				
				If imgval.IsNumber 
					
					anglesMap[i]=imgval.ToNumber()
					
				Else 
					
					anglesMap[i]=0
						
				End			
			Else
				anglesMap[i]=0
			End
		Next

	End
	
	Return anglesMap
	
End

Function GetimageOpacityMap:IntMap<Float>(lobj:JsonObject)

	Local opMap:=New IntMap<Float>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["opacity"]

				Local imgval:=imgelemobj["opacity"]
				
				If imgval.IsNumber 
					
					opMap[i]=imgval.ToNumber()
					
				Else 
					
					opMap[i]=0
						
				End			
			Else
				opMap[i]=0
			End
		Next

	End
	
	Return opMap
	
End

Function GetimageRenderOrderMap:IntMap<Int>(lobj:JsonObject)

	Local orderMap:=New IntMap<Int>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["renderOrder"]

				Local imgval:=imgelemobj["renderOrder"]
				
				If imgval.IsNumber 
					
					orderMap[i]=imgval.ToNumber()
					
				Else 
					
					orderMap[i]=0
						
				End			
			Else
				orderMap[i]=0
			End
		Next

	End
	
	Return orderMap
	
End

Function GetimageWorldHeightMap:IntMap<Float>(lobj:JsonObject)
	
	Local scalesMap:=New IntMap<Float>
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length


		For Local i:=0 Until imgArraySize

			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["scale"]

				Local imgval:=imgelemobj["scale"]
				
				If imgval.IsNumber 
					
					scalesMap[i]=imgval.ToNumber()

				End			
			Else
			End
		Next

	Else
	End
	
	Return scalesMap
	
End
