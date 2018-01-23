Namespace box2d

Extern

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
	

Public


#rem
Class b2Joint Extension
	Operator To:b2DistanceJoint()
		Return b2JointTob2DistanceJoint(Self)
	End
	Operator To:b2FrictionJoint()
		Return b2JointTob2FrictionJoint(Self)
	End
	Operator To:b2GearJoint()
		Return b2JointTob2GearJoint(Self)
	End
	Operator To:b2MotorJoint()
		Return b2JointTob2MotorJoint(Self)
	End
	Operator To:b2MouseJoint()
		Return b2JointTob2MouseJoint(Self)
	End
	Operator To:b2PrismaticJoint()
		Return b2JointTob2PrismaticJoint(Self)
	End
	Operator To:b2PulleyJoint()
		Return b2JointTob2PulleyJoint(Self)
	End
	Operator To:b2RevoluteJoint()
		Return b2JointTob2RevoluteJoint(Self)
	End
	Operator To:b2RopeJoint()
		Return b2JointTob2RopeJoint(Self)
	End
	Operator To:b2WeldJoint()
		Return b2JointTob2WeldJoint(Self)
	End
	Operator To:b2WheelJoint()
		Return b2JointTob2WheelJoint(Self)
	End
End
#end