Namespace box2d

#Import "mx2_box2d/mx2_specific.monkey2"
'#Import "mx2_box2d/box2dEnums.monkey2"

#Import "Box2D/*.h"

#Import "Box2D/Box2D_mx2.h"

#Import "Box2D/Box2D/Collision/Shapes/b2ChainShape.cpp"
#Import "Box2D/Box2D/Collision/Shapes/b2CircleShape.cpp"
#Import "Box2D/Box2D/Collision/Shapes/b2EdgeShape.cpp"
#Import "Box2D/Box2D/Collision/Shapes/b2PolygonShape.cpp"
#Import "Box2D/Box2D/Collision/b2BroadPhase.cpp"
#Import "Box2D/Box2D/Collision/b2CollideCircle.cpp"
#Import "Box2D/Box2D/Collision/b2CollideEdge.cpp"
#Import "Box2D/Box2D/Collision/b2CollidePolygon.cpp"
#Import "Box2D/Box2D/Collision/b2Collision.cpp"
#Import "Box2D/Box2D/Collision/b2Distance.cpp"
#Import "Box2D/Box2D/Collision/b2DynamicTree.cpp"
#Import "Box2D/Box2D/Collision/b2TimeOfImpact.cpp"
#Import "Box2D/Box2D/Common/b2BlockAllocator.cpp"
#Import "Box2D/Box2D/Common/b2Draw.cpp"
#Import "Box2D/Box2D/Common/b2Math.cpp"
#Import "Box2D/Box2D/Common/b2Settings.cpp"
#Import "Box2D/Box2D/Common/b2StackAllocator.cpp"
#Import "Box2D/Box2D/Common/b2Timer.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2ChainAndCircleContact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2ChainAndPolygonContact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2CircleContact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2Contact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2ContactSolver.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2EdgeAndCircleContact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2EdgeAndPolygonContact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.cpp"
#Import "Box2D/Box2D/Dynamics/Contacts/b2PolygonContact.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2DistanceJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2FrictionJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2GearJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2Joint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2MotorJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2MouseJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2PrismaticJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2PulleyJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2RevoluteJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2RopeJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2WeldJoint.cpp"
#Import "Box2D/Box2D/Dynamics/Joints/b2WheelJoint.cpp"
#Import "Box2D/Box2D/Dynamics/b2Body.cpp"
#Import "Box2D/Box2D/Dynamics/b2ContactManager.cpp"
#Import "Box2D/Box2D/Dynamics/b2Fixture.cpp"
#Import "Box2D/Box2D/Dynamics/b2Island.cpp"
#Import "Box2D/Box2D/Dynamics/b2World.cpp"
#Import "Box2D/Box2D/Dynamics/b2WorldCallbacks.cpp"
#Import "Box2D/Box2D/Rope/b2Rope.cpp"

#Import "Box2D/Box2D/mx2_box2d/mx2_specific.cpp"

Extern

Function b2Swap<T>(a:T,b:T)
Function b2Max<T>:T(a:T,b:T)

'Custom added functions and classes

'Class AABBQueryCallback Extends b2QueryCallback
'	Method New(p:b2Vec2) 
'	Method ReportFixture:Bool(fixture:b2Fixture) Override
'End


' les consts




'Const b2_stackSize:Int
'Const b2_maxStackEntries:Int
Const b2_pi:Float'=3.14159265359f

'------------------enums
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

'----------------------fin enums

Struct b2Color
	Field r:Float
	Field g:Float
	Field b:Float
	Method Set(ri:Float,di:Float,bi:Float)
End

Struct b2Transform
	Field p:b2Vec2
	Field q:b2Rot
	Method Set(position:b2Vec2,angle:Float)
End

Struct b2Rot
	Field s:Float
	Field c:Float
End



Struct b2BodyDef

	Field type:b2BodyType
	Field position:b2Vec2
	Field angle:Float
	Field linearVelocity:b2Vec2
	Field angularVelocity:Float
	Field linearDamping:Float
	Field angularDamping:Float
	Field allowSleep:Bool
	Field awake:Bool
	Field fixedRotation:Bool
	Field bullet:Bool
	Field active:Bool
	Field userData:Object ''-----------?????????????????????????
	Field gravityScale:Float	
End

Struct b2FixtureDef
	Field shape:b2Shape
	Field userData:Object
	Field friction:Float
	Field restitution:Float
	Field density:Float
	Field isSensor:bool
	Field filter:b2Filter
End

'Enum Type
'	e_circle , e_edge , e_polygon , e_chain , e_typeCount  
'End

Class b2Shape Extends Void
	
	Enum Type
		e_circle , e_edge , e_polygon , e_chain , e_typeCount  
	End
	
	Method Destroy() Extension="delete"
	'Method Clone:b2Shape(allocator:b2BlockAllocator) virtual '''''''''''''''''''''''''''' definir b2BlockAllocator
	Method GetType:Type()
	Method GetChildCount:Int() virtual
	Method TestPoint:bool(xf:b2Transform,p:b2Vec2) virtual
	Method RayCast:bool(output:b2RayCastOutput,input:b2RayCastInput) virtual
	Method ComputeAABB(aabb:b2AABB,xf:b2Transform,childIndex:Int) virtual
	'Method ComputeMass(massData:b2MassData,density:Float) virtual '''''''''''''''''''''''  define b2MassData
	Field m_type:Type
	Field m_radius:Float
End

Class b2ChainShape extends b2Shape
'---------------------------------------destructor?
	Method Clear()
	Method CreateLoop(vertices:b2Vec2 Ptr,count:Int)
	Method CreateChain(vertices:b2Vec2 Ptr,count:Int)
	Method SetPrevVertex(prevVertex:b2Vec2)
	Method SetNextVertex(nextVertex:b2Vec2)
	'Method Clone:b2Shape(allocator:b2BlockAllocator)
	Method GetChildCount:Int() Override
	Method GetChildEdge(edge:b2EdgeShape,index:Int)
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput,input:b2RayCastInput) override
	Method ComputeAABB(aabb:b2AABB,transform:b2Transform,childIndex:Int) override
	'Method ComputeMass(massData:b2MassData,density:Float) override
	Field m_vertices:b2Vec2
	Field m_count:Int
	Field m_prevVertex:b2Vec2, m_nextVertex:b2Vec2
	Field m_hasPrevVertex:Bool, m_hasNextVertex:bool
End

Class b2CircleShape extends b2Shape
	'Method Clone:b2Shape(allocator:b2BlockAllocator)
	Method GetChildCount:Int() override
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput,input:b2RayCastInput) override
	Method ComputeAABB(aabb:b2AABB,transform:b2Transform,childIndex:Int) override
	'Method ComputeMass(massData:b2MassData,density:Float) override
	Method GetSupport:Int(d:b2Vec2)
	Method GetSupportVertex:b2Vec2(d:b2Vec2)
	Method GetVertexCount:Int()
	Method GetVertex:b2Vec2(index:Int)
	Field m_p:b2Vec2
End

Class b2EdgeShape extends b2Shape
	Method Set(v1:b2Vec2,v2:b2Vec2)
	'Method Clone:b2Shape(allocator:b2BlockAllocator)
	Method GetChildCount:Int() override
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput,input:b2RayCastInput) override
	Method ComputeAABB(aabb:b2AABB,transform:b2Transform,childIndex:Int) override
	'Method ComputeMass(massData:b2MassData,density:Float) override
	Field m_vertex1:b2Vec2, m_vertex2:b2Vec2
	Field m_vertex0:b2Vec2, m_vertex3:b2Vec2
	Field m_hasVertex0:Bool , m_hasVertex3:bool
End

Class b2PolygonShape extends b2Shape
	'Method Clone:b2Shape(allocator:b2BlockAllocator)
	Method GetChildCount:Int() override
	Method Set(points:b2Vec2 Ptr,count:Int)
	Method SetAsBox(hx:Float,hy:Float)
	Method SetAsBox(hx:Float,hy:Float,center:b2Vec2,angle:Float)
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) Override
	Method RayCast:bool(output:b2RayCastOutput,input:b2RayCastInput) Override
	Method ComputeAABB(aabb:b2AABB,transform:b2Transform,childIndex:Int) Override
	'Method ComputeMass(massData:b2MassData,density:Float) override
	Method GetVertexCount:Int()
	Method GetVertex:b2Vec2(index:Int)
	Method Validate:bool()
	Field m_centroid:b2Vec2
	'Field m_vertices[b2_maxPolygonVertices]:b2Vec2  '----------------------------------qu'en est-il de ce genre d'arrays?
	'Field m_normals[b2_maxPolygonVertices]:b2Vec2
	Field m_count:Int
End

Class b2Fixture Extends Void
	Method GetShape:b2Shape()
	Method GetBody:b2Body()
	Method TestPoint:Bool(b2Vec2)
End


Class b2Body Extends Void
	Method CreateFixture:b2Fixture(fixtureDef:b2FixtureDef Ptr)
	Method CreateFixture:b2Fixture(shape:b2Shape,density:Float)
	Method DestroyFixture(fixture:b2Fixture)
	Method setTransform(position:b2Vec2,angle:Float)
	Method GetWorldCenter:b2Vec2()
	Method GetPosition:b2Vec2()
	Method GetAngle:Float()
	Method GetType:b2BodyType()
	Method GetFixtureList:b2Fixture() 
	Method GetMass:Float()
	Method SetAwake(flag:Bool)
End


'------------------------------------------------------------
'
'
'   Joint and JointDef
'
'
'
'-------------------------------------------------------------




'Class b2Joint Extends Void
'End

Class b2Joint Extends Void
	Method GetType:b2JointType()
	Method GetBodyA:b2Body()
	Method GetBodyB:b2Body()
	Method GetAnchorA:b2Vec2()
	Method GetAnchorB:b2Vec2()
	Method GetReactionForce:b2Vec2(inv_dt:Float)
	Method GetReactionTorque:Float(inv_dt:Float)
	Method GetNext:b2Joint()
'	Method GetUserData()
'	Method SetUserData(data:void)
	Method IsActive:bool()
	Method GetCollideConnected:bool()
	Method Dump()
	Method ShiftOrigin(newOrigin:b2Vec2)
'	Field :friend
'	Field class b2Body:Friend
'	Field class b2Island:friend
'	Field class b2GearJoint:friend
'	Method b2Joint* Create:static(def:b2JointDef,allocator:b2BlockAllocator)
'	Method void Destroy:static(joint:b2Joint,allocator:b2BlockAllocator)
'	Method :b2Joint(b2JointDef(def:b2JointDef)
'	Method :~b2Joint()()
'	Method InitVelocityConstraints(data:b2SolverData)
'	Method SolveVelocityConstraints(data:b2SolverData)
'	Field This returns true if the position errors are within tolerance.://
'	Method SolvePositionConstraints:bool(data:b2SolverData)
	Field m_type:b2JointType
	Field m_prev:b2Joint
	Field m_next:b2Joint
'	Field m_edgeA:b2JointEdge
'	Field m_edgeB:b2JointEdge
	Field m_bodyA:b2Body
	Field m_bodyB:b2Body
	Field m_index:Int
	Field m_islandFlag:Bool
	Field m_collideConnected:bool
'	Field m_userData
End

Class b2MouseJoint extends b2Joint
'	Method GetAnchorA:b2Vec2() 
'	Method GetAnchorB:b2Vec2() Override 
'	Method GetReactionForce:b2Vec2(inv_dt:Float) Override 
'	Method GetReactionTorque:Float(inv_dt:Float) Override 
	Method SetTarget(target:b2Vec2)
	Method GetTarget:b2Vec2()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:Float()
	Method SetFrequency(hz:Float)
	Method GetFrequency:Float()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:Float()
'	Method Dump() Override 
'	Method ShiftOrigin(newOrigin:b2Vec2) Override 
	'Field class b2Joint:friend
	'Method :b2MouseJoint(b2MouseJointDef(def:b2MouseJointDef)
	'Method InitVelocityConstraints(data:b2SolverData)
	'Method SolveVelocityConstraints(data:b2SolverData)
	'Method SolvePositionConstraints:bool(data:b2SolverData)
	Field m_localAnchorB:b2Vec2
	Field m_targetA:b2Vec2
	Field m_frequencyHz:Float
	Field m_dampingRatio:Float
	Field m_beta:Float
	'Field Solver shared://
	Field m_impulse:b2Vec2
	Field m_maxForce:Float
	Field m_gamma:Float
	'Field Solver temp://
	Field m_indexA:Int
	Field m_indexB:Int
	Field m_rB:b2Vec2
	Field m_localCenterB:b2Vec2
	Field m_invMassB:Float
	Field m_invIB:Float
	'Field m_mass:b2Mat22
	Field m_C:b2Vec2
End

Struct b2JointDef' Extends Void--> nope it's a struct
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
End

struct b2DistanceJointDef 
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
	Field anchorA:b2Vec2, anchorB:b2Vec2
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field length:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
End

struct b2FrictionJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxForce:Float
	Field maxTorque:Float
End

Struct b2GearJointDef 
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Field joint1:b2Joint
	Field joint2:b2Joint
	Field ratio:Float
End

Struct b2MotorJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
	Field linearOffset:b2Vec2
	Field angularOffset:Float
	Field maxForce:Float
	Field maxTorque:Float
	Field correctionFactor:Float
End

Struct b2MouseJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:Bool
	Field target:b2Vec2
	Field maxForce:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
End

struct b2PrismaticJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:Bool
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2,axis:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field localAxisA:b2Vec2
	Field referenceAngle:Float
	Field enableLimit:Bool
	Field lowerTranslation:Float
	Field upperTranslation:Float
	Field enableMotor:Bool
	Field maxMotorForce:Float
	Field motorSpeed:Float
End

struct b2PulleyJointDef
	Method Initialize(bodyA:b2Body,bodyB:b2Body,groundAnchorA:b2Vec2,groundAnchorB:b2Vec2, anchorA:b2Vec2,anchorB:b2Vec2,ratio:float)
	Field groundAnchorA:b2Vec2
	Field groundAnchorB:b2Vec2
	Field anchorA:b2Vec2
	Field anchorB:b2Vec2
	Field ratio:Float
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field lengthA:Float
	Field lengthB:Float
End

struct b2RevoluteJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:Bool
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field referenceAngle:Float
	Field enableLimit:Bool
	Field lowerAngle:Float
	Field upperAngle:Float
	Field enableMotor:Bool
	Field motorSpeed:Float
	Field maxMotorTorque:Float
End
struct b2RopeJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxLength:Float
End

struct b2WeldJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field referenceAngle:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
End

struct b2WheelJointDef
	Field type:b2JointType
	Field userData:Object
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool	
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2,axis:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field localAxisA:b2Vec2
	Field enableMotor:Bool
	Field maxMotorTorque:Float
	Field motorSpeed:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
End

Class b2Contact Extends Void
End

Class b2ContactFilter Extends Void
End

Class b2Manifold Extends Void
End

Class b2ContactImpulse Extends Void
End

Class b2ContactListener Extends Void
	Method BeginContact(contact:b2Contact)
	Method EndContact(contact:b2Contact)
	Method PreSolve(contact:b2Contact,oldManifold:b2Manifold)
	Method PostSolve(contact:b2Contact,impulse:b2ContactImpulse)
End

Class b2ContactManager Extends Void
End

Class b2Controller Extends Void
End


Class b2QueryCallback Extends Void Abstract
	Method ReportFixture:Bool(fixture:b2Fixture) Virtual 
End


Class b2RayCastCallback Extends Void
End

Class b2Draw Extends Void Abstract
	Const e_shapeBit:uInt
	Const e_jointBit:uInt
	Const e_aabbBit:UInt
	Const e_pairBit:uInt
	Const e_centerOfMassBit:UInt
	
	Method SetFlags(flags:uInt)
	Method GetFlags:uInt()
	Method AppendFlags(flags:uInt)
	Method ClearFlags(flags:uInt)
	Method DrawPolygon(vertices:b2Vec2 Ptr,vertexcount:Int,color:b2Color) Abstract
	Method DrawSolidPolygon (vertices:b2Vec2 Ptr,vertexcount:Int,color:b2Color) Abstract
	Method DrawCircle(center:b2Vec2,radius:Float,color:b2Color) Abstract
	Method DrawSolidCircle(center:b2Vec2,radius:Float,axis:b2Vec2,color:b2Color) Abstract
	Method DrawSegment(p1:b2Vec2,p2:b2Vec2,color:b2Color) Abstract
	Method DrawTransform(xf:b2Transform) Abstract
	Method DrawPoint(p:b2Vec2,size:Float,color:b2Color) Abstract
	'virtual void DrawPoint(b2Vec2 p, float32 size, b2Color color) = 0;
	Field m_drawFlags:uint
End
Class b2DestructionListener Extends Void
End

Class b2World Extends Void
	Method New(gravity:b2Vec2)
	Method Destroy() Extension="delete"
	Method SetDestructionListener(listener:b2DestructionListener)
	Method SetContactFilter (filter:b2ContactFilter)
	Method SetContactListener (listener:b2ContactListener)
	Method SetDebugDraw (debugDraw:b2Draw)
	Method CreateBody:b2Body(def:b2BodyDef Ptr)
	Method DestroyBody(body:b2Body)
	Method CreateJoint:b2Joint(def:b2JointDef ptr)
	Method CreateJoint:b2Joint(def:b2DistanceJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2FrictionJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2GearJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2MotorJointDef ptr)
	Method CreateJoint:b2Joint(def:b2MouseJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2PrismaticJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2PulleyJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2RevoluteJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2RopeJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2WeldJointDef Ptr)
	Method CreateJoint:b2Joint(def:b2WheelJointDef Ptr)
	'faire mê^me chose pour destroy copier pour chaque joint type?
	Method DestroyJoint (joint:b2Joint )
	
	Method Stepp(timeStep:Float,velocityIterations:Int,positionIterations:Int)="Step"
	Method ClearForces()
	Method DrawDebugData()	'Call this to draw shapes and other debug draw data. 
	Method QueryAABB(callback:b2QueryCallback,aabb:b2AABB)
	Method RayCast(callback:b2RayCastCallback,point1:b2Vec2,point2:b2Vec2)
	Method GetBodyList:b2Body()
	Method GetJointList:b2Joint()
	Method GetContactList:b2Contact()
'	Method Const b2Contact * 	GetContactList () Const
	Method SetAllowSleeping(flag:Bool)' 	Enable/disable sleep. 
	Method GetAllowSleeping:Bool()
	Method SetWarmStarting(flag:Bool)	'Enable/disable warm starting. For testing. 
	Method GetWarmStarting:Bool() 
	Method SetContinuousPhysics (flag:Bool)' 	Enable/disable continuous physics. For testing. 
	Method GetContinuousPhysics:Bool () 
	Method SetSubStepping(flag:Bool)' 	Enable/disable single stepped continuous physics. For testing. 
	Method GetSubStepping:Bool() 
	Method GetProxyCount:Int() ' 	Get the number of broad-phase proxies. 
	Method GetBodyCount:Int() ' 	Get the number of bodies. 
	Method GetJointCount:Int() ' 	Get the number of joints. 
	Method GetContactCount:Int() ' 	Get the number of contacts (each may have 0 Or more contact points). 
	Method GetTreeHeight:Int() ' 	Get the height of the dynamic tree. 
	Method GetTreeBalance:Int() ' 	Get the balance of the dynamic tree. 
	Method GetTreeQuality:Float() 
	Method SetGravity(gravity:b2Vec2)' 	Change the Global gravity vector. 
	Method GetGravity:b2Vec2() ' 	Get the Global gravity vector. 
	Method IsLocked:Bool() ' 	Is the world locked (in the middle of a time Step). 
	Method SetAutoClearForces (flag:Bool)' 	Set flag To control automatic clearing of forces after each time Step. 
	Method GetAutoClearForces:Bool() ' 	Get the flag that controls automatic clearing of forces after each time Step. 
'	Method Const b2ContactManager & 	GetContactManager () Const' 	Get the contact manager For testing. 
'	Method Const b2Profile & 	GetProfile () Const' 	Get the current profile. 
	Method 	Dump()

End

struct b2ManifoldPoint
	Field localPoint:b2Vec2
	Field normalImpulse:Float
	Field tangentImpulse:Float
	'Field id:b2ContactID
end

struct b2ClipVertex
	Field v:b2Vec2
	'Field id:b2ContactID
end

struct b2RayCastInput
	Field p1:b2Vec2
	Field p2:b2Vec2
	Field maxFraction:Float
end

struct b2RayCastOutput
	Field normal:b2Vec2
	Field fraction:Float
end

struct b2AABB
	Method IsValid:bool()
	Method GetCenter:b2Vec2()
	Method GetExtents:b2Vec2()
	Method GetPerimeter:Float()
	Method Combine(aabb:b2AABB)
	Method Combine(aabb1:b2AABB,aabb2:b2AABB)
	Method Contains:bool(aabb:b2AABB)
	Method RayCast:bool(output:b2RayCastOutput,input:b2RayCastInput)
	Field lowerBound:b2Vec2
	Field upperBound:b2Vec2
End

struct b2SimplexCache
	Field metric:Float
	Field count:ushort
	Field indexA:Byte[]
	Field indexB:Byte[]
end

struct b2ContactRegister
	'Field createFcn:b2ContactCreateFcn
	'Field destroyFcn:b2ContactDestroyFcn
	Field primary:bool
end

struct b2VelocityConstraintPoint
	Field rA:b2Vec2
	Field rB:b2Vec2
	Field normalImpulse:Float
	Field tangentImpulse:Float
	Field normalMass:Float
	Field tangentMass:Float
	Field velocityBias:Float
End

struct b2Jacobian
	Field linear:b2Vec2
	Field angularA:Float
	Field angularB:Float
End


struct b2Filter
	Field categoryBits:Ushort
	Field maskBits:UShort
	Field groupIndex:Short
end

struct b2FixtureProxy
	Field aabb:b2AABB
	Field fixture:b2Fixture
	Field childIndex:Int
	Field proxyId:Int
end

struct b2TimeStep
	Field dt:Float
	Field inv_dt:Float
	Field dtRatio:Float
	Field velocityIterations:Int
	Field positionIterations:Int
	Field warmStarting:bool
end

struct b2Position
	Field c:b2Vec2
	Field a:Float
end

struct b2Velocity
	Field v:b2Vec2
	Field w:Float
end

struct b2RopeDef
	Field vertices:b2Vec2
	Field count:Int
	Field masses:Float
	Field gravity:b2Vec2
	Field damping:Float
	Field k2:Float
	Field k3:Float
End

struct b2ContactSolverDef
	Field stepp:b2TimeStep="step"
	Field contacts:b2Contact
	Field count:Int
	Field positions:b2Position
	Field velocities:b2Velocity
	Field allocator:b2StackAllocator
End
class b2Rope
	Method Initialize(def:b2RopeDef)
	Method Stepp(timeStep:Float,iterations:Int)="Step"
	Method GetVertexCount:Int()
	Method GetVertices:b2Vec2()
	Method Draw(draw:b2Draw)
	Method SetAngle(angle:Float)
	Method SolveC2()
	Method SolveC3()
	Field m_count:Int
	Field m_ps:b2Vec2
	Field m_p0s:b2Vec2
	Field m_vs:b2Vec2
	Field m_ims:Float
	Field m_Ls:Float
	Field m_as:Float
	Field m_gravity:b2Vec2
	Field m_damping:Float
	Field m_k2:Float
	Field m_k3:Float
End



struct b2Profile
	Field stepp:Float="step"
	Field collide:Float
	Field solve:Float
	Field solveInit:Float
	Field solveVelocity:Float
	Field solvePosition:Float
	Field broadphase:Float
	Field solveTOI:Float
end

class b2StackAllocator
	Method Allocate(size:Int)
	Method Free(p:void)
	Method GetMaxAllocation:Int()
	'Field m_data:char[]     'how to deal with chars??
	Field m_index:Int
	Field m_allocation:Int
	Field m_maxAllocation:Int
	Field m_entries:b2StackEntry[]
	Field m_entryCount:Int
End

struct b2StackEntry
	Field data:libc.char_t 'normalement char.... est-ce bon?
	Field size:Int
	Field usedMalloc:bool
end


Public 


'-------------------------------------------------------------------------------------------------------
Function b2Vec2ToVec2f:Vec2f(v:b2Vec2)
	Local vf:=New Vec2f(v.x,v.y)
	Return vf
End
'-------------------------------------------------------------------------------------------------------
Function b2Vec2ToS:String(v:b2Vec2)
	Local s:="("+v.x+";"+v.y+")"
	Return s
End
'------------------------------------------------------------------------------------------------------
Function b2TransformToS:String(t:b2Transform)
	Local s:="Trans: "+b2Vec2ToS(t.p)+"  Rot: "+b2RotToS(t.q)
	Return s
End
'------------------------------------------------------------------------------------------------------
Function b2RotToS:String(r:b2Rot)
	Local s:="s:"+r.s
	Return s
End

Class AABBQueryCallback Extends b2QueryCallback
	Field q_point:b2Vec2
	Field q_fixture:b2Fixture
	Method New(point:b2Vec2)
		q_point=point
		q_fixture=NULL
	End
	Method ReportFixture:bool(fixture:b2Fixture) Override 
		Local body:=fixture.GetBody()
		If (body.GetType()=b2BodyType.b2_dynamicBody)
			Local inside:=fixture.TestPoint(q_point)
			If inside
				q_fixture=fixture
				Return False
			End
		End
		
		Return True
	End
End 

