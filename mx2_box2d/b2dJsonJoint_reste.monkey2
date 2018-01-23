#rem	
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2FrictionJoint()
		Local jType:="friction"
		If jointType=jType
			Return b2JointTob2FrictionJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	Method GetJoint:b2DistanceJoint()
		Local jType:="distance"
		If jointType=jType
			Return b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				Return Null
			#End
		End
	End
	#end
End

#rem
Function b2JointTob2DistanceJoint:b2DistanceJoint(jptr:b2Joint)
Function b2JointTob2FrictionJoint:b2FrictionJoint(jptr:b2Joint)
Function b2JointTob2GearJoint:b2GearJoint(jptr:b2Joint)
Function b2JointTob2MotorJoint:b2MotorJoint(jptr:b2Joint)
Function b2JointTob2MouseJoint:b2MouseJoint(jptr:b2Joint)
Function b2JointTob2PrismaticJoint:b2PrismaticJoint(jptr:b2Joint)
Function b2JointTob2PulleyJoint:b2PulleyJoint(jptr:b2Joint)
Function b2JointTob2RevoluteJoint:b2RevoluteJoint(jptr:b2Joint)
Function b2JointTob2RopeJoint:b2RopeJoint(jptr:b2Joint)
Function b2JointTob2WeldJoint:b2WeldJoint(jptr:b2Joint)
Function b2JointTob2WheelJoint:b2WheelJoint(jptr:b2Joint)
#end