Namespace b2dJsonInfo

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"

#Import "../iforce2d-b2djson/mx2b2djson.monkey2"

Using std..
Using mojo..
Using box2d..

Struct b2JointInfo
	Field theb2Joint:b2Joint
'	Field jointObject:Variant
	Field name:String
	Field type:String
	
	Method PassJoint(ret:b2DistanceJoint)
		
		Local jType:="distance"
		If type=jType
			ret=b2JointTob2DistanceJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Distance wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End

	Method PassJoint(ret:b2FrictionJoint)
		If type="friction"
			ret=b2JointTob2FrictionJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Friction wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
	Method PassJoint(ret:b2GearJoint)

		Local jType:="gear"
		If type=jType
			ret=b2JointTob2GearJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Gear wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
	Method PassJoint(ret:b2MotorJoint)
		If type="motor"
			ret=b2JointTob2MotorJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Motor wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End

	Method PassJoint(ret:b2MouseJoint)
		If type="mouse"
			ret=b2JointTob2MouseJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Mouse wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
	Method PassJoint(ret:b2PrismaticJoint)
		If type="prismatic"
			ret=b2JointTob2PrismaticJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Prismatic wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End

	Method PassJoint(ret:b2PulleyJoint)
		If type="pulley"
			ret=b2JointTob2PulleyJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Pulley wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
	Method PassJoint(ret:b2RevoluteJoint)
		If type="revolute"
			ret=b2JointTob2RevoluteJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Revolute wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
	Method PassJoint(ret:b2RopeJoint)
		If type="rope"
			ret=b2JointTob2RopeJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Rope wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End

	Method PassJoint(ret:b2WeldJoint)
		If type="weld"
			ret=b2JointTob2WeldJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Weld wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
	Method PassJoint(ret:b2WheelJoint)
		If type="wheel"
			ret=b2JointTob2WheelJoint(theb2Joint)
		Else
			#If __DEBUG__
				Print "PassJoint() error: Wheel wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
	End
	
End

'-----------
'
'-----------


Function Createb2JointInfoStack:Stack<b2JointInfo> (world:b2World,path:String,b2json:b2dJson)
	'-----------------------------------------------------named_fixtures
	Local retStack:=New Stack<b2JointInfo>
	Local retArray:b2JointInfo[]
	Local json:=JsonObject.Load( path )
	Local jointNameTypeInfStack:=GetJointNameTypeStack(json)
	Local currentJoint:=world.GetJointList()
	
	
	
	For Local i:=jointNameTypeInfStack.Length-1 To 0 Step -1
		
			Local ji:=New b2JointInfo
			ji.name=jointNameTypeInfStack[i].name
			ji.type=jointNameTypeInfStack[i].type
			ji.theb2Joint=currentJoint
			
			retStack.Add(ji)
			
			currentJoint=currentJoint.GetNext()
			#rem
			Local jointsArr:= GetJointsByName(b2json , jointNameTypeInf.name)
			If jointsArr.Length>0
				For Local i:=0 Until jointsArr.Length
					
					Local inf:=New b2JointInfo()
					
					inf.name=jointNameTypeInf.name
					inf.type=jointNameTypeInf.type
					inf.theb2Joint=jointsArr[i]
					
					retStack.Add(inf)
					
				Next
			End
			#end
	Next
	
	
	
	Return retStack
	
End

Function GetJointNameTypeStack:Stack<b2JointInfo>(lobj:JsonObject)
	
	Local jointInfStack:=New Stack<b2JointInfo>
	
	If lobj["joint"]
		
		Local imgval:=lobj["joint"]
		Local imgarr:=imgval.ToArray() 
		Local imgArraySize:=imgarr.Length

		For Local i:=0 Until imgArraySize
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			If imgelemobj["name"]

				Local imgval:=imgelemobj["name"]
				Local tempJointName:String
				If imgval.IsString
					tempJointName=imgval.ToString()
				Else 
					#If __DEBUG__
						Print "error Joint "+i+" name is not a string!!" 
					#End	
				End	
				'Getting the type of the joint
				If imgelemobj["type"]
					 Local typval:=imgelemobj["type"]
						
						If typval.IsString
							Local tis:=New b2JointInfo
							tis.name=tempJointName
							tis.type=typval.ToString()
							jointInfStack.Add(tis)
						Else 
							#If __DEBUG__
								Print "error Joint type of "+imgval.ToString()+" is not a string, joint info not added to stack!!" 
							#End	
						End	
				Else
					#If __DEBUG__
						Print "error Joint "+imgval.ToString()+" has no joint type!!!!!" 
					#End 
				End
						
			Else
				#If __DEBUG__
					Print "Joint "+i+" has no name!!" 
				#End
			End
		Next

	Else
		#If __DEBUG__
			Print "no 'joint' value in json !!!!!!!!!"
		#End
	End

	Return jointInfStack
	
End
