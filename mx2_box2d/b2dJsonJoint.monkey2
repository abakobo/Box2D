Namespace b2dJsonInfo

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"

#Import "../iforce2d-b2djson/mx2b2djson.monkey2"

Using std..
Using mojo..
Using box2d..

Class b2JointInfo
	Field theb2Joint:b2Joint
'	Field jointObject:Variant
	Field name:String
	Field type:String
	Field jointUserData:StringMap<Variant>
	
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


Function Createb2JointInfoStack:Stack<b2JointInfo> (world:b2World,path:String)',b2json:b2dJson)
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
			jointNameTypeInfStack[i].jointUserData["b2ManagerJointInfo"]=ji
			ji.jointUserData=jointNameTypeInfStack[i].jointUserData
			ji.theb2Joint=currentJoint
			ji.theb2Joint.SetUserData(Cast<Void Ptr>(ji.jointUserData))
			
			retStack.Add(ji)
			
			currentJoint=currentJoint.GetNext()
	
	Next
	
	Return retStack
	
End

Function GetJointNameTypeStack:Stack<b2JointInfo>(lobj:JsonObject)
	
	Local jointInfStack:=New Stack<b2JointInfo>
	
	If lobj["joint"]
		
		Local imgval:=lobj["joint"]
		Local imgarr:=imgval.ToArray() 
		Local imgArraySize:=imgarr.Length
		
		Local noNameCount:=0

		For Local i:=0 Until imgArraySize
			
			Local imgarrelem:=imgarr[i]
			Local imgelemobj:=imgarrelem.ToObject()
			
			Local tempJointName:String
			If imgelemobj["name"]

				Local imgval:=imgelemobj["name"]

				If imgval.IsString
					tempJointName=imgval.ToString()
				Else 
					#If __DEBUG__
						Print "error Joint "+i+" name is not a string!! named noNameJoint"+noNameCount 
					#End	
					tempJointName="noNameJoint"+noNameCount 
					noNameCount+=1
				End						
			Else
				tempJointName="noNameJoint"+noNameCount 
				#If __DEBUG__
					Print "Joint "+i+" has no name!! named noNameJoint"+noNameCount 
				#End
				noNameCount+=1
			End
			
			Local tempCustoMap:StringMap<Variant>	
			If imgelemobj["customProperties"]
			
				Local custoval:=imgelemobj["customProperties"]
				If custoval.IsArray 
					'Print custoval.ToArray().Length
					tempCustoMap=GetCustomPropertiesFromJsonArray(custoval)
					
				Else 
					#If __DEBUG__
						Print "Joint "+i+" custom properties is not an array" 
					#End
			
					tempCustoMap=New StringMap<Variant>
			
				End	
			Else
				#If __DEBUG__
					Print "no custom properties for Joint "+i+" in json !!!!!!!!!"
				#End
				
				tempCustoMap=New StringMap<Variant>
				
			End
			
			'Getting the type of the joint
			If imgelemobj["type"]
				 Local typval:=imgelemobj["type"]
					
					If typval.IsString
						Local tis:=New b2JointInfo
						tis.name=tempJointName
						tis.type=typval.ToString()
						tis.jointUserData=tempCustoMap
						jointInfStack.Add(tis)
					Else 
						#If __DEBUG__
							Print "error Joint type of "+imgval.ToString()+" is not a string" 
						#End	
						Assert (False,"FATAL ERROR:  joint Type is not a string in json")
					End	
			Else
				#If __DEBUG__
					Print "error Joint "+imgval.ToString()+" has no joint type!!!!!" 
				#End 
				Assert (False,"FATAL ERROR: No joint Type for b2Joint in json")
			End
		
		Next

	Else
		#If __DEBUG__
			Print "no 'joint' value in json !!!!!!!!!"
		#End
	End

	Return jointInfStack
	
End

Class b2Joint Extension
	
	Method ToDistance:b2DistanceJoint()
		Local ret:b2DistanceJoint
		If Self.GetType()=b2JointType.e_distanceJoint
			ret=b2JointTob2DistanceJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2DistanceJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2DistanceJoint()
		Return Self.ToDistance()
	End
	'------------------------------------
	Method ToFriction:b2FrictionJoint()
		Local ret:b2FrictionJoint
		If Self.GetType()=b2JointType.e_frictionJoint
			ret=b2JointTob2FrictionJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2FrictionJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2FrictionJoint()
		Return Self.ToFriction()
	End
	'----------------------------------
	Method ToGear:b2GearJoint()
		Local ret:b2GearJoint
		If Self.GetType()=b2JointType.e_gearJoint
			ret=b2JointTob2GearJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2GearJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2GearJoint()
		Return Self.ToGear()
	End
	'---------------------------------
	Method ToMotor:b2MotorJoint()
		Local ret:b2MotorJoint
		If Self.GetType()=b2JointType.e_motorJoint
			ret=b2JointTob2MotorJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2MotorJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2MotorJoint()
		Return Self.ToMotor()
	End
	'------------------------------------------
	Method ToMouse:b2MouseJoint()
		Local ret:b2MouseJoint
		If Self.GetType()=b2JointType.e_mouseJoint
			ret=b2JointTob2MouseJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2MouseJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2MouseJoint()
		Return Self.ToMouse()
	End
	'------------------------------------------
	Method ToPrismatic:b2PrismaticJoint()
		Local ret:b2PrismaticJoint
		If Self.GetType()=b2JointType.e_prismaticJoint
			ret=b2JointTob2PrismaticJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2PrismaticJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2PrismaticJoint()
		Return Self.ToPrismatic()
	End
	'------------------------------------------
	Method ToPulley:b2PulleyJoint()
		Local ret:b2PulleyJoint
		If Self.GetType()=b2JointType.e_pulleyJoint
			ret=b2JointTob2PulleyJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2PulleyJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2PulleyJoint()
		Return Self.ToPulley()
	End
	'------------------------------------------
	Method ToRevolute:b2RevoluteJoint()
		Local ret:b2RevoluteJoint
		If Self.GetType()=b2JointType.e_revoluteJoint
			ret=b2JointTob2RevoluteJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2RevoluteJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2RevoluteJoint()
		Return Self.ToRevolute()
	End
	'------------------------------------------
	Method ToRope:b2RopeJoint()
		Local ret:b2RopeJoint
		If Self.GetType()=b2JointType.e_ropeJoint
			ret=b2JointTob2RopeJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2RopeJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2RopeJoint()
		Return Self.ToRope()
	End
	'------------------------------------------
	Method ToWeld:b2WeldJoint()
		Local ret:b2WeldJoint
		If Self.GetType()=b2JointType.e_weldJoint
			ret=b2JointTob2WeldJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2WeldJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2WeldJoint()
		Return Self.ToWeld()
	End
	'----------------------------------------
	Method ToWheel:b2WheelJoint()
		Local ret:b2WheelJoint
		If Self.GetType()=b2JointType.e_wheelJoint
			ret=b2JointTob2WheelJoint(Self)
		Else
			#If __DEBUG__
				Assert (False, "To:b2WheelJoint() error: wrong joint return type, returning Null!!!!!!!")
			#End
			ret=Null
		End
		Return ret
	End
	Operator To:b2WheelJoint()
		Return Self.ToWheel()
	End
	
End
