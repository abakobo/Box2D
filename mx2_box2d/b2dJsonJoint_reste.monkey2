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