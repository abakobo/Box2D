Namespace b2dJsonInfo

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"

#Import "../iforce2d-b2djson/mx2b2djson.monkey2"

Using std..
Using mojo..
Using box2d..

Struct JointInfos
	Field jointAbstract:b2Joint
'	Field jointObject:Variant
	Field jointName:String
	Field jointType:String
	
	Method GetJoint:b2DistanceJoint()
		Local ret:b2DistanceJoint
		Local jType:="distance"
		If jointType=jType
			ret=b2JointTob2DistanceJoint(jointAbstract)
		Else
			#If __DEBUG__
				Print "GetJoint() error: wrong joint return type, returning Null!!!!!!!"
				ret=Null
			#End
		End
		Return ret
	End

End

