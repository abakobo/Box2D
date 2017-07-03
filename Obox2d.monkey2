'listimports v0.03 (v0.0.1 initated by nitrologic)
Namespace box2d

#Import "mx2_box2d/mx2_specific.monkey2"

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

Const b2_stackSize:Int
Const b2_maxStackEntries:Int


Const e_shapeBit:uInt        = "b2Draw::e_shapeBit"
Const e_jointBit:uInt        = "b2Draw::e_jointBit"
Const e_aabbBit:uInt         = "b2Draw::e_aabbBit"
Const e_pairBit:uInt         = "b2Draw::e_pairBit"
Const e_centerOfMassBit:uInt = "b2Draw::e_centerOfMassBit"

'-------------------------------------------------------------------
'./Box2D.h
'-------------------------------------------------------------------
'-------------------------------------------------------------------
'./Collision/b2BroadPhase.h
'-------------------------------------------------------------------
struct b2Pair
	Field proxyIdA:Int
	Field proxyIdB:Int
end

class b2BroadPhase extends void
	Method New()
	Method Destroy() Extension="delete"
	Method CreateProxy:Int(aabb:b2AABB,userData:void Ptr)
	Method DestroyProxy(proxyId:Int)
	Method MoveProxy(proxyId:Int,aabb:b2AABB,displacement:b2Vec2)
	Method TouchProxy(proxyId:Int)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetFatAABB:b2AABB(proxyId:Int)
	Method GetUserData:void Ptr(proxyId:Int)
	Method TestOverlap:bool(proxyIdA:Int,proxyIdB:Int)
	Method GetProxyCount:Int()
	'Method UpdatePairs(callback:T Ptr) This method Has generics!!!!!!!!!!!!!!!!
	'Method Query(callback:T Ptr,aabb:b2AABB) This method Has generics!!!!!!!!!!!!!!!!
	'Method RayCast(callback:T Ptr,input:b2RayCastInput) This method Has generics!!!!!!!!!!!!!!!!
	Method GetTreeHeight:Int()
	Method GetTreeBalance:Int()
	Method GetTreeQuality:Float()
	Method ShiftOrigin(newOrigin:b2Vec2)
end

Function b2PairLessThan:bool(pair1:b2Pair,pair2:b2Pair)
'-------------------------------------------------------------------
'./Collision/b2Collision.h
'-------------------------------------------------------------------
struct b2ContactFeature
'	Field Type:enum
	Field indexA:Byte
	Field indexB:Byte
	Field typeA:Byte
	Field typeB:Byte
end

struct b2ManifoldPoint
	Field localPoint:b2Vec2
	Field normalImpulse:Float
	Field tangentImpulse:Float
	'Field id:b2ContactID
end

struct b2Manifold
'	Field Type:enum
'	Field points[b2_maxManifoldPoints]:b2ManifoldPoint
	Field localNormal:b2Vec2
	Field localPoint:b2Vec2
'	Field type:Type
	Field pointCount:Int
end

struct b2WorldManifold
	Method Initialize(manifold:b2Manifold Ptr)
'	Field xfA, Float radiusA,:b2Transform&
'	Field xfB, Float radiusB):b2Transform&
	Field normal:b2Vec2
'	Field points[b2_maxManifoldPoints]:b2Vec2
'	Field separations[b2_maxManifoldPoints]:Float
end

'Function b2GetPointStates(state1[b2_maxManifoldPoints]:b2PointState,state2[b2_maxManifoldPoints]:b2PointState)
struct b2ClipVertex
	Field v:b2Vec2
	'Field id:b2ContactID
end

struct b2RayCastInput
'	Field p1, p2:b2Vec2
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
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
	Field lowerBound:b2Vec2
	Field upperBound:b2Vec2
end

Function b2CollideCircles(manifold:b2Manifold Ptr)
Function b2CollidePolygonAndCircle(manifold:b2Manifold Ptr)
Function b2CollidePolygons(manifold:b2Manifold Ptr)
Function b2CollideEdgeAndCircle(manifold:b2Manifold Ptr)
Function b2CollideEdgeAndPolygon(manifold:b2Manifold Ptr)
'Function b2ClipSegmentToLine:Int(vOut[2]:b2ClipVertex,vIn[2]:b2ClipVertex)
Function b2TestOverlap:bool(shapeA:b2Shape,indexA:Int)
Function b2TestOverlap:bool(a:b2AABB,b:b2AABB)
'-------------------------------------------------------------------
'./Collision/b2Distance.h
'-------------------------------------------------------------------
struct b2DistanceProxy
'	Method :b2DistanceProxy()()
	Method Set(shape:b2Shape,index:Int)
	Method GetSupport:Int(d:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetSupportVertex:b2Vec2(d:b2Vec2)
	Method GetVertexCount:Int()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetVertex:b2Vec2(index:Int)
'	Field m_buffer[2]:b2Vec2
	Field m_vertices:b2Vec2
	Field m_count:Int
	Field m_radius:Float
end

struct b2SimplexCache
	Field metric:Float
'	Field count:uint16
	'Field indexA[3]:Byte
	'Field indexB[3]:Byte
end

struct b2DistanceInput
	Field proxyA:b2DistanceProxy
	Field proxyB:b2DistanceProxy
	Field transformA:b2Transform
	Field transformB:b2Transform
	Field useRadii:bool
end

struct b2DistanceOutput
	Field pointA:b2Vec2
	Field pointB:b2Vec2
	Field distance:Float
	Field iterations:Int
end

Function b2Distance(output:b2DistanceOutput Ptr)
'-------------------------------------------------------------------
'./Collision/b2DynamicTree.h
'-------------------------------------------------------------------
struct b2TreeNode
	Method IsLeaf:bool()
	Field aabb:b2AABB
'	Field userData
	Field child1:Int
	Field child2:Int
	Field height:Int
end

class b2DynamicTree extends void
	Method New()
	Method Destroy() Extension="delete"
	Method CreateProxy:Int(aabb:b2AABB,userData:void Ptr)
	Method DestroyProxy(proxyId:Int)
	Method MoveProxy:bool(proxyId:Int,aabb1:b2AABB,displacement:b2Vec2)
	Method GetUserData:void Ptr(proxyId:Int)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetFatAABB:b2AABB(proxyId:Int)
	'Method Query(callback:T Ptr,aabb:b2AABB) This method Has generics!!!!!!!!!!!!!!!!
	'Method RayCast(callback:T Ptr,input:b2RayCastInput) This method Has generics!!!!!!!!!!!!!!!!
	Method Validate()
	Method GetHeight:Int()
	Method GetMaxBalance:Int()
	Method GetAreaRatio:Float()
	Method RebuildBottomUp()
	Method ShiftOrigin(newOrigin:b2Vec2)
end

'-------------------------------------------------------------------
'./Collision/b2TimeOfImpact.h
'-------------------------------------------------------------------
struct b2TOIInput
	Field proxyA:b2DistanceProxy
	Field proxyB:b2DistanceProxy
	Field sweepA:b2Sweep
	Field sweepB:b2Sweep
	Field tMax:Float
end

struct b2TOIOutput
'	Field State:enum
'	Field state:State
	Field t:Float
end

Function b2TimeOfImpact(output:b2TOIOutput Ptr,input:b2TOIInput Ptr)
'-------------------------------------------------------------------
'./Collision/Shapes/b2ChainShape.h
'-------------------------------------------------------------------
class b2ChainShape extends b2Shape
	Method New()
'	Method Destroy() Extension="delete"
	Method Clear()
	Method CreateLoop(vertices:b2Vec2 Ptr,count:Int)
	Method CreateChain(vertices:b2Vec2 Ptr,count:Int)
	Method SetPrevVertex(prevVertex:b2Vec2)
	Method SetNextVertex(nextVertex:b2Vec2)
	Method Clone:b2Shape(allocator:b2BlockAllocator) override
'	Method GetChildCount:Int()
	Method GetChildEdge(edge:b2EdgeShape,index:Int)
'	Method TestPoint:bool(transform:b2Transform,p:b2Vec2)
'	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
'	Field transform, Int childIndex) override:b2Transform&
'	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int)
'	Method ComputeMass(massData:b2MassData Ptr,density:Float)
	Field m_vertices:b2Vec2
	Field m_count:Int
'	Field m_prevVertex, m_nextVertex:b2Vec2
'	Field m_hasPrevVertex, m_hasNextVertex:bool
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2CircleShape.h
'-------------------------------------------------------------------
class b2CircleShape extends b2Shape
	Method New()
'	Method Clone:b2Shape(allocator:b2BlockAllocator)
'	Method GetChildCount:Int()
'	Method TestPoint:bool(transform:b2Transform,p:b2Vec2)
'	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
'	Field transform, Int childIndex) override:b2Transform&
'	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int)
'	Method ComputeMass(massData:b2MassData Ptr,density:Float)
	Field m_p:b2Vec2
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2EdgeShape.h
'-------------------------------------------------------------------
class b2EdgeShape extends b2Shape
	Method New()
	Method Set(v1:b2Vec2,v2:b2Vec2)
'	Method Clone:b2Shape(allocator:b2BlockAllocator)
'	Method GetChildCount:Int()
'	Method TestPoint:bool(transform:b2Transform,p:b2Vec2)
'	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
'	Field transform, Int childIndex) override:b2Transform&
'	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int)
'	Method ComputeMass(massData:b2MassData Ptr,density:Float)
'	Field m_vertex1, m_vertex2:b2Vec2
'	Field m_vertex0, m_vertex3:b2Vec2
'	Field m_hasVertex0, m_hasVertex3:bool
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2PolygonShape.h
'-------------------------------------------------------------------
class b2PolygonShape extends b2Shape
	Method New()
'	Method Clone:b2Shape(allocator:b2BlockAllocator)
'	Method GetChildCount:Int()
	Method Set(points:b2Vec2 Ptr,count:Int)
	Method SetAsBox(hx:Float,hy:Float)
	Method SetAsBox(hx:Float,hy:Float,center:b2Vec2,angle:Float)
'	Method TestPoint:bool(transform:b2Transform,p:b2Vec2)
'	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
'	Field transform, Int childIndex) override:b2Transform&
'	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int)
'	Method ComputeMass(massData:b2MassData Ptr,density:Float)
	Method Validate:bool()
	Field m_centroid:b2Vec2
'	Field m_vertices[b2_maxPolygonVertices]:b2Vec2
'	Field m_normals[b2_maxPolygonVertices]:b2Vec2
	Field m_count:Int
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2Shape.h
'-------------------------------------------------------------------
struct b2MassData
	Field mass:Float
	Field center:b2Vec2
	Field I:Float
end

class b2Shape extends void
'	Field Type:enum
	Method Destroy() Extension="delete"
	Method Clone:b2Shape(allocator:b2BlockAllocator) virtual
'	Method GetType:Type()
	Method GetChildCount:Int()
	Method TestPoint:bool(xf:b2Transform,p:b2Vec2)
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
'	Field transform, Int childIndex) = 0:b2Transform&
	Method ComputeAABB(aabb:b2AABB Ptr,xf:b2Transform,childIndex:Int)
	Method ComputeMass(massData:b2MassData Ptr,density:Float)
'	Field m_type:Type
	Field m_radius:Float
end

'-------------------------------------------------------------------
'./Common/b2BlockAllocator.h
'-------------------------------------------------------------------
class b2BlockAllocator extends void
	Method New()
	Method Destroy() Extension="delete"
	Method Allocate:void Ptr(size:Int)
	Method Free(p:void Ptr,size:Int)
	Method Clear()
end

'-------------------------------------------------------------------
'./Common/b2Draw.h
'-------------------------------------------------------------------
struct b2Color
'	Method :b2Color()()
'	Method :b2Color(Float(rIn:Float,gIn:Float,bIn:Float,aIn = 1.0f:Float)
'	Method Set(rIn:Float,gIn:Float,bIn:Float,aIn = 1.0f:Float)
'	Field r, g, b, a:Float
end

class b2Draw extends void
	Method New()
	Method Destroy() Extension="delete"
	Method SetFlags(flags:uInt)
	Method GetFlags:uInt()
	Method AppendFlags(flags:uInt)
	Method ClearFlags(flags:uInt)
	Method DrawPolygon(vertices:b2Vec2 Ptr,vertexCount:Int,color:b2Color)
	Method DrawSolidPolygon(vertices:b2Vec2 Ptr,vertexCount:Int,color:b2Color)
	Method DrawCircle(center:b2Vec2,radius:Float,color:b2Color)
	Method DrawSolidCircle(center:b2Vec2,radius:Float,axis:b2Vec2,color:b2Color)
	Method DrawSegment(p1:b2Vec2,p2:b2Vec2,color:b2Color)
	Method DrawTransform(xf:b2Transform)
	Method DrawPoint(p:b2Vec2,size:Float,color:b2Color)
end

'-------------------------------------------------------------------
'./Common/b2GrowableStack.h
'-------------------------------------------------------------------
class b2GrowableStack extends void
	Method New()
	Method Destroy() Extension="delete"
	'Method Push(element:T) This method Has generics!!!!!!!!!!!!!!!!
	'Method Pop:T() This method Has generics!!!!!!!!!!!!!!!!
	Method GetCount:Int()
end

'-------------------------------------------------------------------
'./Common/b2Math.h
'-------------------------------------------------------------------
Function b2IsValid:bool(x:Float)
Function b2InvSqrt:Float(x:Float)
struct b2Vec2
'	Method :b2Vec2()()
'	Method :b2Vec2(Float(xIn:Float,yIn:Float)
	Method SetZero()
	Method Set(x_:Float,y_:Float)
'!!!!!!operator skipped!! line: b2Vec2 operator -() { b2Vec2 v
'!!!!!!operator skipped!! line: Float operator () (Int i)
'!!!!!!operator skipped!! line: Float& operator () (Int i)
'!!!!!!operator skipped!! line: void operator += (b2Vec2& v)
'!!!!!!operator skipped!! line: void operator -= (b2Vec2& v)
'!!!!!!operator skipped!! line: void operator *= (Float a)
	Method Length:Float()
	Method LengthSquared:Float()
	Method Normalize:Float()
	Method IsValid:bool()
	Method Skew:b2Vec2()
	Field x:Float
	Field y:Float
End

struct b2Vec3
'	Method :b2Vec3()()
'	Method :b2Vec3(Float(xIn:Float,yIn:Float,zIn:Float)
	Method SetZero()
	Method Set(x_:Float,y_:Float,z_:Float)
'!!!!!!operator skipped!! line: b2Vec3 operator -() { b2Vec3 v
'!!!!!!operator skipped!! line: void operator += (b2Vec3& v)
'!!!!!!operator skipped!! line: void operator -= (b2Vec3& v)
'!!!!!!operator skipped!! line: void operator *= (Float s)
'	Field x, y, z:Float
end

struct b2Mat22
'	Method :b2Mat22()()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
'	Method :b2Mat22(b2Vec2(c1:b2Vec2,c2:b2Vec2)
'	Method :b2Mat22(Float(a11:Float,a12:Float,a21:Float,a22:Float)
	Method Set(c1:b2Vec2,c2:b2Vec2)
	Method SetIdentity()
	Method SetZero()
	Method GetInverse:b2Mat22()
	Method Solve:b2Vec2(b:b2Vec2)
'	Field ex, ey:b2Vec2
end

struct b2Mat33
'	Method :b2Mat33()()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
'	Method :b2Mat33(b2Vec3(c1:b2Vec3,c2:b2Vec3,c3:b2Vec3)
	Method SetZero()
	Method Solve33:b2Vec3(b:b2Vec3)
	Method Solve22:b2Vec2(b:b2Vec2)
	Method GetInverse22(M:b2Mat33 Ptr)
	Method GetSymInverse33(M:b2Mat33 Ptr)
'	Field ex, ey, ez:b2Vec3
end

struct b2Rot
'	Method :b2Rot()()
'	Method b2Rot:explicit(angle:Float)
	Method Set(angle:Float)
	Method SetIdentity()
	Method GetAngle:Float()
	Method GetXAxis:b2Vec2()
	Method GetYAxis:b2Vec2()
'	Field s, c:Float
end

struct b2Transform
'	Method :b2Transform()()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
'	Method :b2Transform(b2Vec2(position:b2Vec2,rotation:b2Rot)
	Method SetIdentity()
	Method Set(position:b2Vec2,angle:Float)
	Field p:b2Vec2
	Field q:b2Rot
end

struct b2Sweep
	Method GetTransform(xfb:b2Transform Ptr,beta:Float)
	Method Advance(alpha:Float)
	Method Normalize()
	Field localCenter:b2Vec2
'	Field c0, c:b2Vec2
'	Field a0, a:Float
	Field alpha0:Float
end

Function b2Dot:Float(a:b2Vec2,b:b2Vec2)
Function b2Cross:Float(a:b2Vec2,b:b2Vec2)
Function b2Cross:b2Vec2(a:b2Vec2,s:Float)
Function b2Cross:b2Vec2(s:Float,a:b2Vec2)
Function b2Mul:b2Vec2(A:b2Mat22,v:b2Vec2)
Function b2MulT:b2Vec2(A:b2Mat22,v:b2Vec2)
'Function :b2Vec2 Opeerator
'Function :b2Vec2 Opeerator
'Function :b2Vec2 Opeerator
'Function :bool Opeerator
'Function :bool Opeerator
Function b2Distance:Float(a:b2Vec2,b:b2Vec2)
Function b2DistanceSquared:Float(a:b2Vec2,b:b2Vec2)
'Function :b2Vec3 Opeerator
'Function :b2Vec3 Opeerator
'Function :b2Vec3 Opeerator
Function b2Dot:Float(a:b2Vec3,b:b2Vec3)
Function b2Cross:b2Vec3(a:b2Vec3,b:b2Vec3)
'Function :b2Mat22 Opeerator
Function b2Mul:b2Mat22(A:b2Mat22,B:b2Mat22)
Function b2MulT:b2Mat22(A:b2Mat22,B:b2Mat22)
Function b2Mul:b2Vec3(A:b2Mat33,v:b2Vec3)
Function b2Mul22:b2Vec2(A:b2Mat33,v:b2Vec2)
Function b2Mul:b2Rot(q:b2Rot,r:b2Rot)
Function b2MulT:b2Rot(q:b2Rot,r:b2Rot)
Function b2Mul:b2Vec2(q:b2Rot,v:b2Vec2)
Function b2MulT:b2Vec2(q:b2Rot,v:b2Vec2)
Function b2Mul:b2Vec2(T:b2Transform,v:b2Vec2)
Function b2MulT:b2Vec2(T:b2Transform,v:b2Vec2)
Function b2Mul:b2Transform(A:b2Transform,B:b2Transform)
Function b2MulT:b2Transform(A:b2Transform,B:b2Transform)
'Function b2Abs is with generics
Function b2Abs:b2Vec2(a:b2Vec2)
Function b2Abs:b2Mat22(A:b2Mat22)
'Function b2Min is with generics
Function b2Min:b2Vec2(a:b2Vec2,b:b2Vec2)
'Function b2Max is with generics
Function b2Max:b2Vec2(a:b2Vec2,b:b2Vec2)
'Function b2Clamp is with generics
Function b2Clamp:b2Vec2(a:b2Vec2,low:b2Vec2,high:b2Vec2)
'Function b2Swap is with generics
Function b2NextPowerOfTwo:uInt(x:uInt)
Function b2IsPowerOfTwo:bool(x:uInt)
'-------------------------------------------------------------------
'./Common/b2Settings.h
'-------------------------------------------------------------------
Function b2Alloc:void Ptr(size:Int)
Function b2Free(mem:void Ptr)
'Function b2Log(string:char Ptr,...:..)
struct b2Version
	Field major:Int
	Field minor:Int
	Field revision:Int
end

'-------------------------------------------------------------------
'./Common/b2StackAllocator.h
'-------------------------------------------------------------------
struct b2StackEntry
'	Field data:char
	Field size:Int
	Field usedMalloc:bool
end

class b2StackAllocator extends void
	Method New()
	Method Destroy() Extension="delete"
	Method Allocate:void Ptr(size:Int)
	Method Free(p:void Ptr)
	Method GetMaxAllocation:Int()
end

'-------------------------------------------------------------------
'./Common/b2Timer.h
'-------------------------------------------------------------------
class b2Timer extends void
	Method New()
	Method Reset()
	Method GetMilliseconds:Float()
end

'-------------------------------------------------------------------
'./Common/Oob2Draw.h
'-------------------------------------------------------------------
'struct b2Color
'	Method :b2Color()()
'	Method :b2Color(Float(rIn:Float,gIn:Float,bIn:Float,aIn = 1.0f:Float)
'	Method Set(rIn:Float,gIn:Float,bIn:Float,aIn = 1.0f:Float)
'	Field r, g, b, a:Float
'end
#rem
class b2Draw extends void
	Method New()
	Method Destroy() Extension="delete"
	Method SetFlags(flags:uInt)
	Method GetFlags:uInt()
	Method AppendFlags(flags:uInt)
	Method ClearFlags(flags:uInt)
	Method DrawPolygon(vertices:b2Vec2 Ptr,vertexCount:Int,color:b2Color)
	Method DrawSolidPolygon(vertices:b2Vec2 Ptr,vertexCount:Int,color:b2Color)
	Method DrawCircle(center:b2Vec2,radius:Float,color:b2Color)
	Method DrawSolidCircle(center:b2Vec2,radius:Float,axis:b2Vec2,color:b2Color)
	Method DrawSegment(p1:b2Vec2,p2:b2Vec2,color:b2Color)
	Method DrawTransform(xf:b2Transform)
	Method DrawPoint(p:b2Vec2,size:Float,color:b2Color)
end
#end
'-------------------------------------------------------------------
'./Dynamics/b2Body.h
'-------------------------------------------------------------------
struct b2BodyDef
	Method New()
'	Field type:b2BodyType
	Field position:b2Vec2
	Field angle:Float
	Field linearVelocity:b2Vec2
	Field angularVelocity:Float
	Field linearDamping:Float
	Field angularDamping:Float
	Field allowSleep:bool
	Field awake:bool
	Field fixedRotation:bool
	Field bullet:bool
	Field active:bool
'	Field userData
	Field gravityScale:Float
end

class b2Body extends void
	Method CreateFixture:b2Fixture(def:b2FixtureDef Ptr)
	Method CreateFixture:b2Fixture(shape:b2Shape,density:Float)
	Method DestroyFixture(fixture:b2Fixture)
	Method SetTransform(position:b2Vec2,angle:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetTransform:b2Transform()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetPosition:b2Vec2()
	Method GetAngle:Float()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetWorldCenter:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalCenter:b2Vec2()
	Method SetLinearVelocity(v:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLinearVelocity:b2Vec2()
	Method SetAngularVelocity(omega:Float)
	Method GetAngularVelocity:Float()
	Method ApplyForce(force:b2Vec2,point:b2Vec2,wake:bool)
	Method ApplyForceToCenter(force:b2Vec2,wake:bool)
	Method ApplyTorque(torque:Float,wake:bool)
	Method ApplyLinearImpulse(impulse:b2Vec2,point:b2Vec2,wake:bool)
	Method ApplyLinearImpulseToCenter(impulse:b2Vec2,wake:bool)
	Method ApplyAngularImpulse(impulse:Float,wake:bool)
	Method GetMass:Float()
	Method GetInertia:Float()
	Method GetMassData(data:b2MassData Ptr)
	Method SetMassData(data:b2MassData Ptr)
	Method ResetMassData()
	Method GetWorldPoint:b2Vec2(localPoint:b2Vec2)
	Method GetWorldVector:b2Vec2(localVector:b2Vec2)
	Method GetLocalPoint:b2Vec2(worldPoint:b2Vec2)
	Method GetLocalVector:b2Vec2(worldVector:b2Vec2)
	Method GetLinearVelocityFromWorldPoint:b2Vec2(worldPoint:b2Vec2)
	Method GetLinearVelocityFromLocalPoint:b2Vec2(localPoint:b2Vec2)
	Method GetLinearDamping:Float()
	Method SetLinearDamping(linearDamping:Float)
	Method GetAngularDamping:Float()
	Method SetAngularDamping(angularDamping:Float)
	Method GetGravityScale:Float()
	Method SetGravityScale(scale:Float)
'	Method SetType(type:b2BodyType)
'	Method GetType:b2BodyType()
	Method SetBullet(flag:bool)
	Method IsBullet:bool()
	Method SetSleepingAllowed(flag:bool)
	Method IsSleepingAllowed:bool()
	Method SetAwake(flag:bool)
	Method IsAwake:bool()
	Method SetActive(flag:bool)
	Method IsActive:bool()
	Method SetFixedRotation(flag:bool)
	Method IsFixedRotation:bool()
	Method GetFixtureList:b2Fixture()
'	Method GetFixtureList:b2Fixture()
	Method GetJointList:b2JointEdge Ptr()
'	Method GetJointList:b2JointEdge Ptr()
	Method GetContactList:b2ContactEdge Ptr()
'	Method GetContactList:b2ContactEdge Ptr()
	Method GetNext:b2Body()
'	Method GetNext:b2Body()
	Method GetUserData:void Ptr()
	Method SetUserData(data:void Ptr)
	Method GetWorld:b2World()
'	Method GetWorld:b2World()
	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/b2ContactManager.h
'-------------------------------------------------------------------
class b2ContactManager extends void
	Method New()
	Method AddPair(proxyUserDataA:void Ptr,proxyUserDataB:void Ptr)
	Method FindNewContacts()
	Method Destroy(c:b2Contact)
	Method Collide()
	Field m_broadPhase:b2BroadPhase
	Field m_contactList:b2Contact
	Field m_contactCount:Int
	Field m_contactFilter:b2ContactFilter
	Field m_contactListener:b2ContactListener
	Field m_allocator:b2BlockAllocator
end

'-------------------------------------------------------------------
'./Dynamics/b2Fixture.h
'-------------------------------------------------------------------
struct b2Filter
	Method New()
'	Field categoryBits:uint16
'	Field maskBits:uint16
'	Field groupIndex:int16
end

struct b2FixtureDef
	Method New()
	Field shape:b2Shape
'	Field userData
	Field friction:Float
	Field restitution:Float
	Field density:Float
	Field isSensor:bool
	Field filter:b2Filter
end

struct b2FixtureProxy
	Field aabb:b2AABB
	Field fixture:b2Fixture
	Field childIndex:Int
	Field proxyId:Int
end

class b2Fixture extends void
'	Method GetType:b2Shape::Type()
	Method GetShape:b2Shape()
'	Method GetShape:b2Shape()
	Method SetSensor(sensor:bool)
	Method IsSensor:bool()
	Method SetFilterData(filter:b2Filter)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetFilterData:b2Filter()
	Method Refilter()
	Method GetBody:b2Body()
'	Method GetBody:b2Body()
	Method GetNext:b2Fixture()
'	Method GetNext:b2Fixture()
	Method GetUserData:void Ptr()
	Method SetUserData(data:void Ptr)
	Method TestPoint:bool(p:b2Vec2)
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,childIndex:Int)
	Method GetMassData(massData:b2MassData Ptr)
	Method SetDensity(density:Float)
	Method GetDensity:Float()
	Method GetFriction:Float()
	Method SetFriction(friction:Float)
	Method GetRestitution:Float()
	Method SetRestitution(restitution:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetAABB:b2AABB(childIndex:Int)
	Method Dump(bodyIndex:Int)
end

'-------------------------------------------------------------------
'./Dynamics/b2Island.h
'-------------------------------------------------------------------
class b2Island extends void
'	Method :b2Island(Int(bodyCapacity:Int,contactCapacity:Int,jointCapacity:Int)
'	Field allocator, b2ContactListener* listener):b2StackAllocator
	Method Destroy() Extension="delete"
	Method Clear()
'	Method Solve(profile:b2Profile Ptr,step:b2TimeStep,gravity:b2Vec2,allowSleep:bool)
	Method SolveTOI(subStep:b2TimeStep,toiIndexA:Int,toiIndexB:Int)
	Method Add(body:b2Body)
	Method Add(contact:b2Contact)
	Method Add(joint:b2Joint)
'	Method Report(b2ContactVelocityConstraint*raints:b2ContactVelocityConstraint Ptrraint)
	Field m_allocator:b2StackAllocator
	Field m_listener:b2ContactListener
	Field m_bodies:b2Body
	Field m_contacts:b2Contact
	Field m_joints:b2Joint
	Field m_positions:b2Position
	Field m_velocities:b2Velocity
	Field m_bodyCount:Int
	Field m_jointCount:Int
	Field m_contactCount:Int
	Field m_bodyCapacity:Int
	Field m_contactCapacity:Int
	Field m_jointCapacity:Int
end

'-------------------------------------------------------------------
'./Dynamics/b2TimeStep.h
'-------------------------------------------------------------------
struct b2Profile
'	Field step:Float
	Field collide:Float
	Field solve:Float
	Field solveInit:Float
	Field solveVelocity:Float
	Field solvePosition:Float
	Field broadphase:Float
	Field solveTOI:Float
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

struct b2SolverData
'	Field step:b2TimeStep
	Field positions:b2Position
	Field velocities:b2Velocity
end

'-------------------------------------------------------------------
'./Dynamics/b2World.h
'-------------------------------------------------------------------
class b2World extends void
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
'	Method :b2World(b2Vec2(gravity:b2Vec2)
	Method Destroy() Extension="delete"
	Method SetDestructionListener(listener:b2DestructionListener)
	Method SetContactFilter(filter:b2ContactFilter)
	Method SetContactListener(listener:b2ContactListener)
	Method SetDebugDraw(debugDraw:b2Draw)
	Method CreateBody:b2Body(def:b2BodyDef Ptr)
	Method DestroyBody(body:b2Body)
	Method CreateJoint:b2Joint(def:b2JointDef Ptr)
	Method DestroyJoint(joint:b2Joint)
'	Method Step(timeStep:Float)
'	Field velocityIterations,:Int
'	Field positionIterations):Int
	Method ClearForces()
	Method DrawDebugData()
	Method QueryAABB(callback:b2QueryCallback,aabb:b2AABB)
	Method RayCast(callback:b2RayCastCallback,point1:b2Vec2,point2:b2Vec2)
	Method GetBodyList:b2Body()
'	Method GetBodyList:b2Body()
	Method GetJointList:b2Joint()
'	Method GetJointList:b2Joint()
	Method GetContactList:b2Contact()
'	Method GetContactList:b2Contact()
	Method SetAllowSleeping(flag:bool)
	Method GetAllowSleeping:bool()
	Method SetWarmStarting(flag:bool)
	Method GetWarmStarting:bool()
	Method SetContinuousPhysics(flag:bool)
	Method GetContinuousPhysics:bool()
	Method SetSubStepping(flag:bool)
	Method GetSubStepping:bool()
	Method GetProxyCount:Int()
	Method GetBodyCount:Int()
	Method GetJointCount:Int()
	Method GetContactCount:Int()
	Method GetTreeHeight:Int()
	Method GetTreeBalance:Int()
	Method GetTreeQuality:Float()
	Method SetGravity(gravity:b2Vec2)
	Method GetGravity:b2Vec2()
	Method IsLocked:bool()
	Method SetAutoClearForces(flag:bool)
	Method GetAutoClearForces:bool()
	Method ShiftOrigin(newOrigin:b2Vec2)
	Method GetContactManager:b2ContactManager()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetProfile:b2Profile()
	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/b2WorldCallbacks.h
'-------------------------------------------------------------------
class b2DestructionListener extends void
	Method Destroy() Extension="delete"
	Method SayGoodbye(joint:b2Joint)
	Method SayGoodbye(fixture:b2Fixture)
end

class b2ContactFilter extends void
	Method Destroy() Extension="delete"
	Method ShouldCollide:bool(fixtureA:b2Fixture,fixtureB:b2Fixture)
end

struct b2ContactImpulse
'	Field normalImpulses[b2_maxManifoldPoints]:Float
'	Field tangentImpulses[b2_maxManifoldPoints]:Float
	Field count:Int
end

class b2ContactListener extends void
	Method Destroy() Extension="delete"
	Method BeginContact(contact:b2Contact)
	Method EndContact(contact:b2Contact)
	Method PreSolve(contact:b2Contact,oldManifold:b2Manifold Ptr)
	Method PostSolve(contact:b2Contact,impulse:b2ContactImpulse Ptr)
end

class b2QueryCallback extends void
	Method Destroy() Extension="delete"
	Method ReportFixture:bool(fixture:b2Fixture)
end

class b2RayCastCallback extends void
	Method Destroy() Extension="delete"
	Method ReportFixture:Float(fixture:b2Fixture,point:b2Vec2)
'	Field normal, Float fraction) = 0:b2Vec2&
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2ChainAndCircleContact.h
'-------------------------------------------------------------------
class b2ChainAndCircleContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int)
'	Field fixtureB, Int indexB, b2BlockAllocator* allocator):b2Fixture
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2ChainAndCircleContact(b2Fixture Ptr(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2ChainAndPolygonContact.h
'-------------------------------------------------------------------
class b2ChainAndPolygonContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int)
'	Field fixtureB, Int indexB, b2BlockAllocator* allocator):b2Fixture
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2ChainAndPolygonContact(b2Fixture Ptr(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2CircleContact.h
'-------------------------------------------------------------------
class b2CircleContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int)
'	Field fixtureB, Int indexB, b2BlockAllocator* allocator):b2Fixture
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2CircleContact(b2Fixture Ptr(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2Contact.h
'-------------------------------------------------------------------
Function b2MixFriction:Float(friction1:Float,friction2:Float)
Function b2MixRestitution:Float(restitution1:Float,restitution2:Float)
'Function b2Contact* b2ContactCreateFcn:typedef(fixtureA:b2Fixture,indexA:Int)
'Function void b2ContactDestroyFcn:typedef(contact:b2Contact,allocator:b2BlockAllocator)
struct b2ContactRegister
'	Field createFcn:b2ContactCreateFcn
'	Field destroyFcn:b2ContactDestroyFcn
	Field primary:bool
end

struct b2ContactEdge
	Field other:b2Body
	Field contact:b2Contact
	Field prev:b2ContactEdge
'	Field next:b2ContactEdge
end

class b2Contact extends void
	Method GetManifold:b2Manifold Ptr()
'	Method GetManifold:b2Manifold Ptr()
	Method GetWorldManifold(worldManifold:b2WorldManifold Ptr)
	Method IsTouching:bool()
	Method SetEnabled(flag:bool)
	Method IsEnabled:bool()
	Method GetNext:b2Contact()
'	Method GetNext:b2Contact()
	Method GetFixtureA:b2Fixture()
'	Method GetFixtureA:b2Fixture()
	Method GetChildIndexA:Int()
	Method GetFixtureB:b2Fixture()
'	Method GetFixtureB:b2Fixture()
	Method GetChildIndexB:Int()
	Method SetFriction(friction:Float)
	Method GetFriction:Float()
	Method ResetFriction()
	Method SetRestitution(restitution:Float)
	Method GetRestitution:Float()
	Method ResetRestitution()
	Method SetTangentSpeed(speed:Float)
	Method GetTangentSpeed:Float()
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2ContactSolver.h
'-------------------------------------------------------------------
struct b2VelocityConstraintPoint
	Field rA:b2Vec2
	Field rB:b2Vec2
	Field normalImpulse:Float
	Field tangentImpulse:Float
	Field normalMass:Float
	Field tangentMass:Float
	Field velocityBias:Float
end

struct b2ContactVelocityConstraint
'	Field points[b2_maxManifoldPoints]:b2VelocityConstraintPoint
	Field normal:b2Vec2
	Field normalMass:b2Mat22
	Field K:b2Mat22
	Field indexA:Int
	Field indexB:Int
'	Field invMassA, invMassB:Float
'	Field invIA, invIB:Float
	Field friction:Float
	Field restitution:Float
	Field tangentSpeed:Float
	Field pointCount:Int
	Field contactIndex:Int
end

struct b2ContactSolverDef
'	Field step:b2TimeStep
	Field contacts:b2Contact
	Field count:Int
	Field positions:b2Position
	Field velocities:b2Velocity
	Field allocator:b2StackAllocator
end

class b2ContactSolver extends void
'	Method :b2ContactSolver(b2ContactSolverDef Ptr(def:b2ContactSolverDef Ptr)
	Method Destroy() Extension="delete"
	Method InitializeVelocityConstraints()
	Method WarmStart()
	Method SolveVelocityConstraints()
	Method StoreImpulses()
	Method SolvePositionConstraints:bool()
	Method SolveTOIPositionConstraints:bool(toiIndexA:Int,toiIndexB:Int)
	Field m_step:b2TimeStep
	Field m_positions:b2Position
	Field m_velocities:b2Velocity
	Field m_allocator:b2StackAllocator
'	Field m_positionConstraints:b2ContactPositionConstraint
	Field m_velocityConstraints:b2ContactVelocityConstraint
	Field m_contacts:b2Contact
	Field m_count:int
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2EdgeAndCircleContact.h
'-------------------------------------------------------------------
class b2EdgeAndCircleContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int)
'	Field fixtureB, Int indexB, b2BlockAllocator* allocator):b2Fixture
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2EdgeAndCircleContact(b2Fixture Ptr(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2EdgeAndPolygonContact.h
'-------------------------------------------------------------------
class b2EdgeAndPolygonContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int)
'	Field fixtureB, Int indexB, b2BlockAllocator* allocator):b2Fixture
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2EdgeAndPolygonContact(b2Fixture Ptr(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2PolygonAndCircleContact.h
'-------------------------------------------------------------------
class b2PolygonAndCircleContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2PolygonAndCircleContact(b2Fixture Ptr(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2PolygonContact.h
'-------------------------------------------------------------------
class b2PolygonContact extends b2Contact
'	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int)
'	Field fixtureB, Int indexB, b2BlockAllocator* allocator):b2Fixture
'	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
'	Method :b2PolygonContact(b2Fixture Ptr(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
'	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform)
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2DistanceJoint.h
'-------------------------------------------------------------------
struct b2DistanceJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
'	Field anchorA, b2Vec2& anchorB):b2Vec2&
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field length:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2DistanceJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method SetLength(length:Float)
	Method GetLength:Float()
	Method SetFrequency(hz:Float)
	Method GetFrequency:Float()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:Float()
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2FrictionJoint.h
'-------------------------------------------------------------------
struct b2FrictionJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxForce:Float
	Field maxTorque:Float
end

class b2FrictionJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:Float()
	Method SetMaxTorque(torque:Float)
	Method GetMaxTorque:Float()
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2GearJoint.h
'-------------------------------------------------------------------
struct b2GearJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Field joint1:b2Joint
	Field joint2:b2Joint
	Field ratio:Float
end

class b2GearJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
	Method GetJoint1:b2Joint()
	Method GetJoint2:b2Joint()
	Method SetRatio(ratio:Float)
	Method GetRatio:Float()
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2Joint.h
'-------------------------------------------------------------------
struct b2Jacobian
	Field linear:b2Vec2
	Field angularA:Float
	Field angularB:Float
end

struct b2JointEdge
	Field other:b2Body
	Field joint:b2Joint
	Field prev:b2JointEdge
'	Field next:b2JointEdge
end

struct b2JointDef
	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
end

class b2Joint extends void
'	Method GetType:b2JointType()
	Method GetBodyA:b2Body()
	Method GetBodyB:b2Body()
	Method GetAnchorA:b2Vec2()
	Method GetAnchorB:b2Vec2()
	Method GetReactionForce:b2Vec2(inv_dt:Float)
	Method GetReactionTorque:Float(inv_dt:Float)
	Method GetNext:b2Joint()
'	Method GetNext:b2Joint()
	Method GetUserData:void Ptr()
	Method SetUserData(data:void Ptr)
	Method IsActive:bool()
	Method GetCollideConnected:bool()
	Method Dump()
	Method ShiftOrigin(newOrigin:b2Vec2)
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2MotorJoint.h
'-------------------------------------------------------------------
struct b2MotorJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
	Field linearOffset:b2Vec2
	Field angularOffset:Float
	Field maxForce:Float
	Field maxTorque:Float
	Field correctionFactor:Float
end

class b2MotorJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
	Method SetLinearOffset(linearOffset:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLinearOffset:b2Vec2()
	Method SetAngularOffset(angularOffset:Float)
	Method GetAngularOffset:Float()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:Float()
	Method SetMaxTorque(torque:Float)
	Method GetMaxTorque:Float()
	Method SetCorrectionFactor(factor:Float)
	Method GetCorrectionFactor:Float()
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2MouseJoint.h
'-------------------------------------------------------------------
struct b2MouseJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Field target:b2Vec2
	Field maxForce:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2MouseJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
	Method SetTarget(target:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetTarget:b2Vec2()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:Float()
	Method SetFrequency(hz:Float)
	Method GetFrequency:Float()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:Float()
'	Method Dump()
'	Method ShiftOrigin(newOrigin:b2Vec2)
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2PrismaticJoint.h
'-------------------------------------------------------------------
struct b2PrismaticJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2,axis:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field localAxisA:b2Vec2
	Field referenceAngle:Float
	Field enableLimit:bool
	Field lowerTranslation:Float
	Field upperTranslation:Float
	Field enableMotor:bool
	Field maxMotorForce:Float
	Field motorSpeed:Float
end

class b2PrismaticJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAxisA:b2Vec2()
	Method GetReferenceAngle:Float()
	Method GetJointTranslation:Float()
	Method GetJointSpeed:Float()
	Method IsLimitEnabled:bool()
	Method EnableLimit(flag:bool)
	Method GetLowerLimit:Float()
	Method GetUpperLimit:Float()
	Method SetLimits(lower:Float,upper:Float)
	Method IsMotorEnabled:bool()
	Method EnableMotor(flag:bool)
	Method SetMotorSpeed(speed:Float)
	Method GetMotorSpeed:Float()
	Method SetMaxMotorForce(force:Float)
	Method GetMaxMotorForce:Float()
	Method GetMotorForce:Float(inv_dt:Float)
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2PulleyJoint.h
'-------------------------------------------------------------------
struct b2PulleyJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
'	Field groundAnchorA, b2Vec2& groundAnchorB,:b2Vec2&
'	Field anchorA, b2Vec2& anchorB,:b2Vec2&
'	Field ratio):Float
	Field groundAnchorA:b2Vec2
	Field groundAnchorB:b2Vec2
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field lengthA:Float
	Field lengthB:Float
	Field ratio:Float
end

class b2PulleyJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
	Method GetGroundAnchorA:b2Vec2()
	Method GetGroundAnchorB:b2Vec2()
	Method GetLengthA:Float()
	Method GetLengthB:Float()
	Method GetRatio:Float()
	Method GetCurrentLengthA:Float()
	Method GetCurrentLengthB:Float()
'	Method Dump()
'	Method ShiftOrigin(newOrigin:b2Vec2)
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2RevoluteJoint.h
'-------------------------------------------------------------------
struct b2RevoluteJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field referenceAngle:Float
	Field enableLimit:bool
	Field lowerAngle:Float
	Field upperAngle:Float
	Field enableMotor:bool
	Field motorSpeed:Float
	Field maxMotorTorque:Float
end

class b2RevoluteJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method GetReferenceAngle:Float()
	Method GetJointAngle:Float()
	Method GetJointSpeed:Float()
	Method IsLimitEnabled:bool()
	Method EnableLimit(flag:bool)
	Method GetLowerLimit:Float()
	Method GetUpperLimit:Float()
	Method SetLimits(lower:Float,upper:Float)
	Method IsMotorEnabled:bool()
	Method EnableMotor(flag:bool)
	Method SetMotorSpeed(speed:Float)
	Method GetMotorSpeed:Float()
	Method SetMaxMotorTorque(torque:Float)
	Method GetMaxMotorTorque:Float()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
	Method GetMotorTorque:Float(inv_dt:Float)
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2RopeJoint.h
'-------------------------------------------------------------------
struct b2RopeJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxLength:Float
end

class b2RopeJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method SetMaxLength(length:Float)
	Method GetMaxLength:Float()
'	Method GetLimitState:b2LimitState()
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2WeldJoint.h
'-------------------------------------------------------------------
struct b2WeldJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field referenceAngle:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2WeldJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method GetReferenceAngle:Float()
	Method SetFrequency(hz:Float)
	Method GetFrequency:Float()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:Float()
'	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2WheelJoint.h
'-------------------------------------------------------------------
struct b2WheelJointDef 

	Method New()
'	Field type:b2JointType
'	Field userData
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
'	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2,axis:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field localAxisA:b2Vec2
	Field enableMotor:bool
	Field maxMotorTorque:Float
	Field motorSpeed:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2WheelJoint extends b2Joint
'	Method GetAnchorA:b2Vec2()
'	Method GetAnchorB:b2Vec2()
'	Method GetReactionForce:b2Vec2(inv_dt:Float)
'	Method GetReactionTorque:Float(inv_dt:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAxisA:b2Vec2()
	Method GetJointTranslation:Float()
	Method GetJointLinearSpeed:Float()
	Method GetJointAngle:Float()
	Method GetJointAngularSpeed:Float()
	Method IsMotorEnabled:bool()
	Method EnableMotor(flag:bool)
	Method SetMotorSpeed(speed:Float)
	Method GetMotorSpeed:Float()
	Method SetMaxMotorTorque(torque:Float)
	Method GetMaxMotorTorque:Float()
	Method GetMotorTorque:Float(inv_dt:Float)
	Method SetSpringFrequencyHz(hz:Float)
	Method GetSpringFrequencyHz:Float()
	Method SetSpringDampingRatio(ratio:Float)
	Method GetSpringDampingRatio:Float()
'	Method Dump()
end

'-------------------------------------------------------------------
'./mx2_box2d/mx2_specific.h
'-------------------------------------------------------------------
Function b2JointTob2MouseJoint:b2MouseJoint(jptr:b2Joint)
'-------------------------------------------------------------------
'./Rope/b2Rope.h
'-------------------------------------------------------------------
struct b2RopeDef
	Method New()
	Field vertices:b2Vec2
	Field count:Int
	Field masses:Float
	Field gravity:b2Vec2
	Field damping:Float
	Field k2:Float
	Field k3:Float
end

class b2Rope extends void
	Method New()
	Method Destroy() Extension="delete"
	Method Initialize(def:b2RopeDef Ptr)
'	Method Step(timeStep:Float,iterations:Int)
	Method GetVertexCount:Int()
	Method GetVertices:b2Vec2 Ptr()
	Method Draw(draw:b2Draw)
	Method SetAngle(angle:Float)
end


