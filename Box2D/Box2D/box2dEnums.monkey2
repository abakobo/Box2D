Const e_nullProxy:int = "b2BroadPhase::e_nullProxy"

Const e_shapeBit:uInt        = "b2Draw::e_shapeBit"
Const e_jointBit:uInt        = "b2Draw::e_jointBit"
Const e_aabbBit:uInt         = "b2Draw::e_aabbBit"
Const e_pairBit:uInt         = "b2Draw::e_pairBit"
Const e_centerOfMassBit:uInt = "b2Draw::e_centerOfMassBit"


Enum b2BodyType
	b2_staticBody,b2_kinematicBody,b2_dynamicBody
End


Struct b2Vec2
	Field x:Float
	Field y:Float
	Method New(gx:Float,gy:Float)
	Method Set(gx:Float,gy:Float)
End

Enum b2JointType
	e_unknownJoint,
	e_revoluteJoint,
	e_prismaticJoint,
	e_distanceJoint,
	e_pulleyJoint,
	e_mouseJoint,
	e_gearJoint,
	e_wheelJoint,
    e_weldJoint,
	e_frictionJoint,
	e_ropeJoint,
	e_motorJoint
End

enum b2PointState
    	b2_nullState,
    	b2_addState,
    	b2_persistState,
    	b2_removeState
End

enum b2LimitState
	e_inactiveLimit,
	e_atLowerLimit,
	e_atUpperLimit,
	e_equalLimits
End 