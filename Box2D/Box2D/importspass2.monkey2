
'-------------------------------------------------------------------
'./importsnocomasepar.temph
'-------------------------------------------------------------------
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
	Method CreateProxy:int32(aabb:b2AABB,userData:void Ptr)
	Method DestroyProxy(proxyId:Int)
	Method MoveProxy(proxyId:Int,aabb:b2AABB,displacement:b2Vec2)
	Method TouchProxy(proxyId:Int)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetFatAABB:b2AABB(proxyId:Int)
	Method GetUserData:void Ptr(proxyId:Int)
	Method TestOverlap:bool(proxyIdA:Int,proxyIdB:Int)
	Method GetProxyCount:int32()
	'Method UpdatePairs<T>(callback:T Ptr)' This method Has generics !!!!! wrappit?
	'Method Query<T>(callback:T Ptr,aabb:b2AABB)' This method Has generics !!!!! wrappit?
	'Method RayCast<T>(callback:T Ptr,input:b2RayCastInput)' This method Has generics !!!!! wrappit?
	Method GetTreeHeight:int32()
	Method GetTreeBalance:int32()
	Method GetTreeQuality:float32()
	Method ShiftOrigin(newOrigin:b2Vec2)
end

Function b2PairLessThan:bool(pair1:b2Pair,pair2:b2Pair)
'------Ya du array à gérer ici!
'-------------------------------------------------------------------
'./Collision/b2Collision.h
'-------------------------------------------------------------------
'-----const: const uint8 b2_nullFeature = UCHAR_MAX;
struct b2ContactFeature
	Enum Type
		e_vertex,e_face
	End
	Field indexA:Byte
	Field indexB:Byte
	Field typeA:Byte
	Field typeB:Byte
end

struct b2ManifoldPoint
	Field localPoint:b2Vec2
	Field normalImpulse:Float
	Field tangentImpulse:Float
	Field id:b2ContactID
end

struct b2Manifold
	Enum Type
		e_circles,e_faceA,e_faceB
	End
'------Ya du array à gérer ici!
	Field points:b2ManifoldPoint[]
	Field localNormal:b2Vec2
	Field localPoint:b2Vec2
	Field type:Type
	Field pointCount:Int
end

struct b2WorldManifold
	Method Initialize(manifold:b2Manifold Ptr,xfA:b2Transform,radiusA:Float,xfB:b2Transform,radiusB:Float)
	Field normal:b2Vec2
'------Ya du array à gérer ici!
	Field points:b2Vec2[]
'------Ya du array à gérer ici!
	Field separations:Float[]
end

'------Ya du array à gérer ici!
'--- state1 is actualy an array, a extension/override could be cool
'--- state2 is actualy an array, a extension/override could be cool
Function b2GetPointStates(state1:b2PointState Ptr,state2:b2PointState Ptr,manifold1:b2Manifold Ptr,manifold2:b2Manifold Ptr)
struct b2ClipVertex
	Field v:b2Vec2
	Field id:b2ContactID
end

struct b2RayCastInput
'-----------------------------------Multiple Fields
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
	Method GetPerimeter:float32()
	Method Combine(aabb:b2AABB)
	Method Combine(aabb1:b2AABB,aabb2:b2AABB)
	Method Contains:bool(aabb:b2AABB)
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput)
	Field lowerBound:b2Vec2
	Field upperBound:b2Vec2
end

Function b2CollideCircles(manifold:b2Manifold Ptr,circleA:b2CircleShape,xfA:b2Transform,circleB:b2CircleShape,xfB:b2Transform)
Function b2CollidePolygonAndCircle(manifold:b2Manifold Ptr,polygonA:b2PolygonShape,xfA:b2Transform,circleB:b2CircleShape,xfB:b2Transform)
Function b2CollidePolygons(manifold:b2Manifold Ptr,polygonA:b2PolygonShape,xfA:b2Transform,polygonB:b2PolygonShape,xfB:b2Transform)
Function b2CollideEdgeAndCircle(manifold:b2Manifold Ptr,polygonA:b2EdgeShape,xfA:b2Transform,circleB:b2CircleShape,xfB:b2Transform)
Function b2CollideEdgeAndPolygon(manifold:b2Manifold Ptr,edgeA:b2EdgeShape,xfA:b2Transform,circleB:b2PolygonShape,xfB:b2Transform)
'------Ya du array à gérer ici!
'--- vOut is actualy an array, a extension/override could be cool
'--- vIn is actualy an array, a extension/override could be cool
Function b2ClipSegmentToLine:int32(vOut:b2ClipVertex Ptr,vIn:b2ClipVertex Ptr,normal:b2Vec2,offset:float32,vertexIndexA:int32)
Function b2TestOverlap:bool(shapeA:b2Shape,indexA:int32,shapeB:b2Shape,indexB:int32,xfA:b2Transform,xfB:b2Transform)
Function b2TestOverlap:bool(a:b2AABB,b:b2AABB)
'-------------------------------------------------------------------
'./Collision/b2Distance.h
'-------------------------------------------------------------------
struct b2DistanceProxy
	Method New()
	Method Set(shape:b2Shape,index:Int)
	Method GetSupport:int32(d:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetSupportVertex:b2Vec2(d:b2Vec2)
	Method GetVertexCount:int32()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetVertex:b2Vec2(index:Int)
'------Ya du array à gérer ici!
	Field m_buffer:b2Vec2[]
	Field m_vertices:b2Vec2 Ptr
	Field m_count:Int
	Field m_radius:Float
end

struct b2SimplexCache
	Field metric:Float
	Field count:uint16
'------Ya du array à gérer ici!
	Field indexA:Byte[]
'------Ya du array à gérer ici!
	Field indexB:Byte[]
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

Function b2Distance(output:b2DistanceOutput Ptr,cache:b2SimplexCache Ptr,input:b2DistanceInput Ptr)
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'-------------------------------------------------------------------
'./Collision/b2DynamicTree.h
'-------------------------------------------------------------------
'-----ALIAS(orconst)!?: #define b2_nullNode (-1)
struct b2TreeNode
	Method IsLeaf:bool()
	Field aabb:b2AABB
	Field userData:void Ptr
	Field child1:Int
	Field child2:Int
	Field height:Int
end

class b2DynamicTree extends void
	Method New()
	Method Destroy() Extension="delete"
	Method CreateProxy:int32(aabb:b2AABB,userData:void Ptr)
	Method DestroyProxy(proxyId:Int)
	Method MoveProxy:bool(proxyId:Int,aabb1:b2AABB,displacement:b2Vec2)
	Method GetUserData:void Ptr(proxyId:Int)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetFatAABB:b2AABB(proxyId:Int)
	'Method Query<T>(callback:T Ptr,aabb:b2AABB)' This method Has generics !!!!! wrappit?
	'Method RayCast<T>(callback:T Ptr,input:b2RayCastInput)' This method Has generics !!!!! wrappit?
	Method Validate()
	Method GetHeight:int32()
	Method GetMaxBalance:int32()
	Method GetAreaRatio:float32()
	Method RebuildBottomUp()
	Method ShiftOrigin(newOrigin:b2Vec2)
end

'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
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
	Enum State
		e_unknown,e_failed,e_overlapped,e_touching,e_separated
	End
	Field state:State
	Field t:Float
end

Function b2TimeOfImpact(output:b2TOIOutput Ptr,input:b2TOIInput Ptr)
'-------------------------------------------------------------------
'./Collision/Shapes/b2ChainShape.h
'-------------------------------------------------------------------
class b2ChainShape extends b2Shape
	Method New()
	Method Destroy() Extension="delete"
	Method Clear()
	Method CreateLoop(vertices:b2Vec2 Ptr,count:Int)
	Method CreateChain(vertices:b2Vec2 Ptr,count:Int)
	Method SetPrevVertex(prevVertex:b2Vec2)
	Method SetNextVertex(nextVertex:b2Vec2)
	Method Clone:b2Shape(allocator:b2BlockAllocator) override
	Method GetChildCount:int32() override
	Method GetChildEdge(edge:b2EdgeShape,index:Int)
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,transform:b2Transform,childIndex:Int) override
	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int) override
	Method ComputeMass(massData:b2MassData Ptr,density:Float) override
	Field m_vertices:b2Vec2 Ptr
	Field m_count:Int
'-----------------------------------Multiple Fields
	Field m_prevVertex:b2Vec2
	Field m_nextVertex:b2Vec2
'-----------------------------------Multiple Fields
	Field m_hasPrevVertex:bool
	Field m_hasNextVertex:bool
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2CircleShape.h
'-------------------------------------------------------------------
class b2CircleShape extends b2Shape
	Method New()
	Method Clone:b2Shape(allocator:b2BlockAllocator) override
	Method GetChildCount:int32() override
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,transform:b2Transform,childIndex:Int) override
	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int) override
	Method ComputeMass(massData:b2MassData Ptr,density:Float) override
	Field m_p:b2Vec2
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2EdgeShape.h
'-------------------------------------------------------------------
class b2EdgeShape extends b2Shape
	Method New()
	Method Set(v1:b2Vec2,v2:b2Vec2)
	Method Clone:b2Shape(allocator:b2BlockAllocator) override
	Method GetChildCount:int32() override
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,transform:b2Transform,childIndex:Int) override
	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int) override
	Method ComputeMass(massData:b2MassData Ptr,density:Float) override
'-----------------------------------Multiple Fields
	Field m_vertex1:b2Vec2
	Field m_vertex2:b2Vec2
'-----------------------------------Multiple Fields
	Field m_vertex0:b2Vec2
	Field m_vertex3:b2Vec2
'-----------------------------------Multiple Fields
	Field m_hasVertex0:bool
	Field m_hasVertex3:bool
end

'-------------------------------------------------------------------
'./Collision/Shapes/b2PolygonShape.h
'-------------------------------------------------------------------
class b2PolygonShape extends b2Shape
	Method New()
	Method Clone:b2Shape(allocator:b2BlockAllocator) override
	Method GetChildCount:int32() override
	Method Set(points:b2Vec2 Ptr,count:Int)
	Method SetAsBox(hx:Float,hy:Float)
	Method SetAsBox(hx:Float,hy:Float,center:b2Vec2,angle:Float)
	Method TestPoint:bool(transform:b2Transform,p:b2Vec2) override
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,transform:b2Transform,childIndex:Int) override
	Method ComputeAABB(aabb:b2AABB Ptr,transform:b2Transform,childIndex:Int) override
	Method ComputeMass(massData:b2MassData Ptr,density:Float) override
	Method Validate:bool()
	Field m_centroid:b2Vec2
'------Ya du array à gérer ici!
	Field m_vertices:b2Vec2[]
'------Ya du array à gérer ici!
	Field m_normals:b2Vec2[]
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
	Enum Type
		e_circle,e_edge,e_polygon,e_chain,e_typeCount
	End
	Method Destroy() Extension="delete"
	Method Clone:b2Shape(allocator:b2BlockAllocator) virtual
	Method GetType:Type()
	Method GetChildCount:int32() virtual
	Method TestPoint:bool(xf:b2Transform,p:b2Vec2) virtual
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,transform:b2Transform,childIndex:Int) virtual
	Method ComputeAABB(aabb:b2AABB Ptr,xf:b2Transform,childIndex:Int) virtual
	Method ComputeMass(massData:b2MassData Ptr,density:Float) virtual
	Field m_type:Type
	Field m_radius:Float
end

'-------------------------------------------------------------------
'./Common/b2BlockAllocator.h
'-------------------------------------------------------------------
'-----const: const int32 b2_chunkSize = 16 * 1024;
'-----const: const int32 b2_maxBlockSize = 640;
'-----const: const int32 b2_blockSizes = 14;
'-----const: const int32 b2_chunkArrayIncrement = 128;
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
	Method New()
	Method New(rIn:Float,gIn:Float,bIn:Float,aIn = 1.0f:Float)
	Method Set(rIn:Float,gIn:Float,bIn:Float,aIn = 1.0f:Float)
'-----------------------------------Multiple Fields
	Field r:Float
	Field g:Float
	Field b:Float
	Field a:Float
end

class b2Draw extends void
	Method New()
	Method Destroy() Extension="delete"
	Method SetFlags(flags:uInt)
	Method GetFlags:uint32()
	Method AppendFlags(flags:uInt)
	Method ClearFlags(flags:uInt)
	Method DrawPolygon(vertices:b2Vec2 Ptr,vertexCount:Int,color:b2Color) virtual
	Method DrawSolidPolygon(vertices:b2Vec2 Ptr,vertexCount:Int,color:b2Color) virtual
	Method DrawCircle(center:b2Vec2,radius:Float,color:b2Color) virtual
	Method DrawSolidCircle(center:b2Vec2,radius:Float,axis:b2Vec2,color:b2Color) virtual
	Method DrawSegment(p1:b2Vec2,p2:b2Vec2,color:b2Color) virtual
	Method DrawTransform(xf:b2Transform) virtual
	Method DrawPoint(p:b2Vec2,size:Float,color:b2Color) virtual
end

'-------------------------------------------------------------------
'./Common/b2GrowableStack.h
'-------------------------------------------------------------------
class b2GrowableStack extends void
	Method New()
	Method Destroy() Extension="delete"
	'Method Push<T>(element:T)' This method Has generics !!!!! wrappit?
'------Ya du array à gérer ici!
	'Method Pop<T>:T()' This method Has generics !!!!! wrappit?
'------Ya du array à gérer ici!
	Method GetCount:int32()
end

'-------------------------------------------------------------------
'./Common/b2Math.h
'-------------------------------------------------------------------
Function b2IsValid:bool(x:float32)
Function b2InvSqrt:float32(x:float32)
'-----ALIAS(orconst)!?: #define	b2Sqrt(x)	sqrtf(x)
'-----ALIAS(orconst)!?: #define	b2Atan2(y, x)	atan2f(y, x)
struct b2Vec2
	Method New()
	Method New(xIn:Float,yIn:Float)
	Method SetZero()
	Method Set(x_:Float,y_:Float)
'!!!!!!operator skipped!! line: b2Vec2 operator -() { b2Vec2 v
'!!!!!!operator skipped!! line: float32 operator () (int32 i) const
'------Ya du array à gérer ici!
'!!!!!!operator skipped!! line: float32& operator () (int32 i)
'------Ya du array à gérer ici!
'!!!!!!operator skipped!! line: void operator += (b2Vec2& v)
'!!!!!!operator skipped!! line: void operator -= (b2Vec2& v)
'!!!!!!operator skipped!! line: void operator *= (float32 a)
	Method Length:float32()
	Method LengthSquared:float32()
	Method Normalize:float32()
	Method IsValid:bool()
	Method Skew:b2Vec2()
'-----------------------------------Multiple Fields
	Field x:Float
	Field y:Float
end

struct b2Vec3
	Method New()
	Method New(xIn:Float,yIn:Float,zIn:Float)
	Method SetZero()
	Method Set(x_:Float,y_:Float,z_:Float)
'!!!!!!operator skipped!! line: b2Vec3 operator -() { b2Vec3 v
'!!!!!!operator skipped!! line: void operator += (b2Vec3& v)
'!!!!!!operator skipped!! line: void operator -= (b2Vec3& v)
'!!!!!!operator skipped!! line: void operator *= (float32 s)
'-----------------------------------Multiple Fields
	Field x:Float
	Field y:Float
	Field z:Float
end

struct b2Mat22
	Method New()
	Method New(c1:b2Vec2,c2:b2Vec2)
	Method New(a11:Float,a12:Float,a21:Float,a22:Float)
	Method Set(c1:b2Vec2,c2:b2Vec2)
	Method SetIdentity()
	Method SetZero()
	Method GetInverse:b2Mat22()
	Method Solve:b2Vec2(b:b2Vec2)
'-----------------------------------Multiple Fields
	Field ex:b2Vec2
	Field ey:b2Vec2
end

struct b2Mat33
	Method New()
	Method New(c1:b2Vec3,c2:b2Vec3,c3:b2Vec3)
	Method SetZero()
	Method Solve33:b2Vec3(b:b2Vec3)
	Method Solve22:b2Vec2(b:b2Vec2)
	Method GetInverse22(M:b2Mat33 Ptr)
	Method GetSymInverse33(M:b2Mat33 Ptr)
'-----------------------------------Multiple Fields
	Field ex:b2Vec3
	Field ey:b2Vec3
	Field ez:b2Vec3
end

struct b2Rot
	Method New()
	Method b2Rot:explicit(angle:Float)
	Method Set(angle:Float)
	Method SetIdentity()
	Method GetAngle:float32()
	Method GetXAxis:b2Vec2()
	Method GetYAxis:b2Vec2()
'-----------------------------------Multiple Fields
	Field s:Float
	Field c:Float
end

struct b2Transform
	Method New()
	Method New(position:b2Vec2,rotation:b2Rot)
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
'-----------------------------------Multiple Fields
	Field c0:b2Vec2
	Field c:b2Vec2
'-----------------------------------Multiple Fields
	Field a0:Float
	Field a:Float
	Field alpha0:Float
end

Function b2Dot:float32(a:b2Vec2,b:b2Vec2)
Function b2Cross:float32(a:b2Vec2,b:b2Vec2)
Function b2Cross:b2Vec2(a:b2Vec2,s:float32)
Function b2Cross:b2Vec2(s:float32,a:b2Vec2)
Function b2Mul:b2Vec2(A:b2Mat22,v:b2Vec2)
Function b2MulT:b2Vec2(A:b2Mat22,v:b2Vec2)
'Function :b2Vec2 Opeerator
'Function :b2Vec2 Opeerator
'Function :b2Vec2 Opeerator
'Function :bool Opeerator
'Function :bool Opeerator
Function b2Distance:float32(a:b2Vec2,b:b2Vec2)
Function b2DistanceSquared:float32(a:b2Vec2,b:b2Vec2)
'Function :b2Vec3 Opeerator
'Function :b2Vec3 Opeerator
'Function :b2Vec3 Opeerator
Function b2Dot:float32(a:b2Vec3,b:b2Vec3)
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
'Function b2Abs<T>:T(a:T)
Function b2Abs:b2Vec2(a:b2Vec2)
Function b2Abs:b2Mat22(A:b2Mat22)
'Function b2Min<T>:T(a:T,b:T)
Function b2Min:b2Vec2(a:b2Vec2,b:b2Vec2)
'Function b2Max<T>:T(a:T,b:T)
Function b2Max:b2Vec2(a:b2Vec2,b:b2Vec2)
'Function b2Clamp<T>:T(a:T,low:T,high:T)
Function b2Clamp:b2Vec2(a:b2Vec2,low:b2Vec2,high:b2Vec2)
'Function b2Swap<T>(a:T,b:T)
Function b2NextPowerOfTwo:uint32(x:uint32)
Function b2IsPowerOfTwo:bool(x:uint32)
'-------------------------------------------------------------------
'./Common/b2Settings.h
'-------------------------------------------------------------------
'-----ALIAS(orconst)!?: #define B2_NOT_USED(x) ((void)(x))
'-----ALIAS(orconst)!?: #define b2Assert(A) assert(A)
'-----ALIAS(orconst)!?: #define	b2_maxFloat		FLT_MAX
'-----ALIAS(orconst)!?: #define	b2_epsilon		FLT_EPSILON
'-----ALIAS(orconst)!?: #define b2_pi			3.14159265359f
'-----ALIAS(orconst)!?: #define b2_maxManifoldPoints	2
'-----ALIAS(orconst)!?: #define b2_maxPolygonVertices	8
'-----ALIAS(orconst)!?: #define b2_aabbExtension		0.1f
'-----ALIAS(orconst)!?: #define b2_aabbMultiplier		2.0f
'-----ALIAS(orconst)!?: #define b2_linearSlop			0.005f
'-----ALIAS(orconst)!?: #define b2_angularSlop			(2.0f / 180.0f * b2_pi)
'-----ALIAS(orconst)!?: #define b2_polygonRadius		(2.0f * b2_linearSlop)
'-----ALIAS(orconst)!?: #define b2_maxSubSteps			8
'-----ALIAS(orconst)!?: #define b2_maxTOIContacts			32
'-----ALIAS(orconst)!?: #define b2_velocityThreshold		1.0f
'-----ALIAS(orconst)!?: #define b2_maxLinearCorrection		0.2f
'-----ALIAS(orconst)!?: #define b2_maxAngularCorrection		(8.0f / 180.0f * b2_pi)
'-----ALIAS(orconst)!?: #define b2_maxTranslation			2.0f
'-----ALIAS(orconst)!?: #define b2_maxTranslationSquared	(b2_maxTranslation * b2_maxTranslation)
'-----ALIAS(orconst)!?: #define b2_maxRotation				(0.5f * b2_pi)
'-----ALIAS(orconst)!?: #define b2_maxRotationSquared		(b2_maxRotation * b2_maxRotation)
'-----ALIAS(orconst)!?: #define b2_baumgarte				0.2f
'-----ALIAS(orconst)!?: #define b2_toiBaugarte				0.75f
'-----ALIAS(orconst)!?: #define b2_timeToSleep				0.5f
'-----ALIAS(orconst)!?: #define b2_linearSleepTolerance		0.01f
'-----ALIAS(orconst)!?: #define b2_angularSleepTolerance	(2.0f / 180.0f * b2_pi)
Function b2Alloc:void Ptr(size:int32)
Function b2Free(mem:void Ptr)
Function b2Log(string:char Ptr,...:..)
struct b2Version
	Field major:Int
	Field minor:Int
	Field revision:Int
end

'-------------------------------------------------------------------
'./Common/b2StackAllocator.h
'-------------------------------------------------------------------
'-----const: const int32 b2_stackSize = 100 * 1024;	
'-----const: const int32 b2_maxStackEntries = 32;
struct b2StackEntry
	Field data:char Ptr
	Field size:Int
	Field usedMalloc:bool
end

class b2StackAllocator extends void
	Method New()
	Method Destroy() Extension="delete"
	Method Allocate:void Ptr(size:Int)
	Method Free(p:void Ptr)
	Method GetMaxAllocation:int32()
end

'-------------------------------------------------------------------
'./Common/b2Timer.h
'-------------------------------------------------------------------
class b2Timer extends void
	Method New()
	Method Reset()
	Method GetMilliseconds:float32()
end

'-------------------------------------------------------------------
'./Dynamics/b2Body.h
'-------------------------------------------------------------------
struct b2BodyDef
	Method New()
	Field type:b2BodyType
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
	Field userData:void Ptr
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
	Method GetAngle:float32()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetWorldCenter:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalCenter:b2Vec2()
	Method SetLinearVelocity(v:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLinearVelocity:b2Vec2()
	Method SetAngularVelocity(omega:Float)
	Method GetAngularVelocity:float32()
	Method ApplyForce(force:b2Vec2,point:b2Vec2,wake:bool)
	Method ApplyForceToCenter(force:b2Vec2,wake:bool)
	Method ApplyTorque(torque:Float,wake:bool)
	Method ApplyLinearImpulse(impulse:b2Vec2,point:b2Vec2,wake:bool)
	Method ApplyLinearImpulseToCenter(impulse:b2Vec2,wake:bool)
	Method ApplyAngularImpulse(impulse:Float,wake:bool)
	Method GetMass:float32()
	Method GetInertia:float32()
	Method GetMassData(data:b2MassData Ptr)
	Method SetMassData(data:b2MassData Ptr)
	Method ResetMassData()
	Method GetWorldPoint:b2Vec2(localPoint:b2Vec2)
	Method GetWorldVector:b2Vec2(localVector:b2Vec2)
	Method GetLocalPoint:b2Vec2(worldPoint:b2Vec2)
	Method GetLocalVector:b2Vec2(worldVector:b2Vec2)
	Method GetLinearVelocityFromWorldPoint:b2Vec2(worldPoint:b2Vec2)
	Method GetLinearVelocityFromLocalPoint:b2Vec2(localPoint:b2Vec2)
	Method GetLinearDamping:float32()
	Method SetLinearDamping(linearDamping:Float)
	Method GetAngularDamping:float32()
	Method SetAngularDamping(angularDamping:Float)
	Method GetGravityScale:float32()
	Method SetGravityScale(scale:Float)
	Method SetType(type:b2BodyType)
	Method GetType:b2BodyType()
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
	Method GetFixtureList:b2Fixture()
	Method GetJointList:b2JointEdge Ptr()
	Method GetJointList:b2JointEdge Ptr()
	Method GetContactList:b2ContactEdge Ptr()
	Method GetContactList:b2ContactEdge Ptr()
	Method GetNext:b2Body()
	Method GetNext:b2Body()
	Method GetUserData:void Ptr()
	Method SetUserData(data:void Ptr)
	Method GetWorld:b2World()
	Method GetWorld:b2World()
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
	Field categoryBits:uint16
	Field maskBits:uint16
	Field groupIndex:int16
end

struct b2FixtureDef
	Method New()
	Field shape:b2Shape
	Field userData:void Ptr
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
	Method GetType:b2Shape::Type()
	Method GetShape:b2Shape()
	Method GetShape:b2Shape()
	Method SetSensor(sensor:bool)
	Method IsSensor:bool()
	Method SetFilterData(filter:b2Filter)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetFilterData:b2Filter()
	Method Refilter()
	Method GetBody:b2Body()
	Method GetBody:b2Body()
	Method GetNext:b2Fixture()
	Method GetNext:b2Fixture()
	Method GetUserData:void Ptr()
	Method SetUserData(data:void Ptr)
	Method TestPoint:bool(p:b2Vec2)
	Method RayCast:bool(output:b2RayCastOutput Ptr,input:b2RayCastInput,childIndex:Int)
	Method GetMassData(massData:b2MassData Ptr)
	Method SetDensity(density:Float)
	Method GetDensity:float32()
	Method GetFriction:float32()
	Method SetFriction(friction:Float)
	Method GetRestitution:float32()
	Method SetRestitution(restitution:Float)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetAABB:b2AABB(childIndex:Int)
	Method Dump(bodyIndex:Int)
end

'------Ya du array à gérer ici!
'-------------------------------------------------------------------
'./Dynamics/b2Island.h
'-------------------------------------------------------------------
class b2Island extends void
	Method New(bodyCapacity:Int,contactCapacity:Int,jointCapacity:Int,allocator:b2StackAllocator,listener:b2ContactListener)
	Method Destroy() Extension="delete"
	Method Clear()
	Method Solve(profile:b2Profile Ptr,step:b2TimeStep,gravity:b2Vec2,allowSleep:bool)
	Method SolveTOI(subStep:b2TimeStep,toiIndexA:Int,toiIndexB:Int)
	Method Add(body:b2Body)
'------Ya du array à gérer ici!
	Method Add(contact:b2Contact)
'------Ya du array à gérer ici!
	Method Add(joint:b2Joint)
'------Ya du array à gérer ici!
	Method Report(constraints:b2ContactVelocityConstraint Ptr)
	Field m_allocator:b2StackAllocator
	Field m_listener:b2ContactListener
	Field m_bodies:b2Body
	Field m_contacts:b2Contact
	Field m_joints:b2Joint
	Field m_positions:b2Position Ptr
	Field m_velocities:b2Velocity Ptr
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
	Field step:Float
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
	Field step:b2TimeStep
	Field positions:b2Position Ptr
	Field velocities:b2Velocity Ptr
end

'-------------------------------------------------------------------
'./Dynamics/b2World.h
'-------------------------------------------------------------------
class b2World extends void
	Method New(gravity:b2Vec2)
	Method Destroy() Extension="delete"
	Method SetDestructionListener(listener:b2DestructionListener)
	Method SetContactFilter(filter:b2ContactFilter)
	Method SetContactListener(listener:b2ContactListener)
	Method SetDebugDraw(debugDraw:b2Draw)
	Method CreateBody:b2Body(def:b2BodyDef Ptr)
	Method DestroyBody(body:b2Body)
	Method CreateJoint:b2Joint(def:b2JointDef Ptr)
	Method DestroyJoint(joint:b2Joint)
	Method Step(timeStep:Float,velocityIterations:Int,positionIterations:Int)
	Method ClearForces()
	Method DrawDebugData()
	Method QueryAABB(callback:b2QueryCallback,aabb:b2AABB)
	Method RayCast(callback:b2RayCastCallback,point1:b2Vec2,point2:b2Vec2)
	Method GetBodyList:b2Body()
	Method GetBodyList:b2Body()
	Method GetJointList:b2Joint()
	Method GetJointList:b2Joint()
	Method GetContactList:b2Contact()
	Method GetContactList:b2Contact()
	Method SetAllowSleeping(flag:bool)
	Method GetAllowSleeping:bool()
	Method SetWarmStarting(flag:bool)
	Method GetWarmStarting:bool()
	Method SetContinuousPhysics(flag:bool)
	Method GetContinuousPhysics:bool()
	Method SetSubStepping(flag:bool)
	Method GetSubStepping:bool()
	Method GetProxyCount:int32()
	Method GetBodyCount:int32()
	Method GetJointCount:int32()
	Method GetContactCount:int32()
	Method GetTreeHeight:int32()
	Method GetTreeBalance:int32()
	Method GetTreeQuality:float32()
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
	Method SayGoodbye(joint:b2Joint) virtual
	Method SayGoodbye(fixture:b2Fixture) virtual
end

class b2ContactFilter extends void
	Method Destroy() Extension="delete"
	Method ShouldCollide:bool(fixtureA:b2Fixture,fixtureB:b2Fixture) virtual
end

struct b2ContactImpulse
'------Ya du array à gérer ici!
	Field normalImpulses:Float[]
'------Ya du array à gérer ici!
	Field tangentImpulses:Float[]
	Field count:Int
end

class b2ContactListener extends void
	Method Destroy() Extension="delete"
	Method BeginContact(contact:b2Contact) virtual
	Method EndContact(contact:b2Contact) virtual
	Method PreSolve(contact:b2Contact,oldManifold:b2Manifold Ptr) virtual
	Method PostSolve(contact:b2Contact,impulse:b2ContactImpulse Ptr) virtual
end

class b2QueryCallback extends void
	Method Destroy() Extension="delete"
	Method ReportFixture:bool(fixture:b2Fixture) virtual
end

class b2RayCastCallback extends void
	Method Destroy() Extension="delete"
	Method ReportFixture:float32(fixture:b2Fixture,point:b2Vec2,normal:b2Vec2,fraction:Float) virtual
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2ChainAndCircleContact.h
'-------------------------------------------------------------------
class b2ChainAndCircleContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2ChainAndPolygonContact.h
'-------------------------------------------------------------------
class b2ChainAndPolygonContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2CircleContact.h
'-------------------------------------------------------------------
class b2CircleContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2Contact.h
'-------------------------------------------------------------------
struct b2ContactRegister
	Field createFcn:b2ContactCreateFcn Ptr
	Field destroyFcn:b2ContactDestroyFcn Ptr
	Field primary:bool
end

struct b2ContactEdge
	Field other:b2Body
	Field contact:b2Contact
	Field prev:b2ContactEdge Ptr
	Field next:b2ContactEdge Ptr
end

class b2Contact extends void
	Method GetManifold:b2Manifold Ptr()
	Method GetManifold:b2Manifold Ptr()
	Method GetWorldManifold(worldManifold:b2WorldManifold Ptr)
	Method IsTouching:bool()
	Method SetEnabled(flag:bool)
	Method IsEnabled:bool()
	Method GetNext:b2Contact()
	Method GetNext:b2Contact()
	Method GetFixtureA:b2Fixture()
	Method GetFixtureA:b2Fixture()
	Method GetChildIndexA:int32()
	Method GetFixtureB:b2Fixture()
	Method GetFixtureB:b2Fixture()
	Method GetChildIndexB:int32()
	Method SetFriction(friction:Float)
	Method GetFriction:float32()
	Method ResetFriction()
	Method SetRestitution(restitution:Float)
	Method GetRestitution:float32()
	Method ResetRestitution()
	Method SetTangentSpeed(speed:Float)
	Method GetTangentSpeed:float32()
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) virtual
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
'------Ya du array à gérer ici!
	Field points:b2VelocityConstraintPoint[]
	Field normal:b2Vec2
	Field normalMass:b2Mat22
	Field K:b2Mat22
	Field indexA:Int
	Field indexB:Int
'-----------------------------------Multiple Fields
	Field invMassA:Float
	Field invMassB:Float
'-----------------------------------Multiple Fields
	Field invIA:Float
	Field invIB:Float
	Field friction:Float
	Field restitution:Float
	Field tangentSpeed:Float
	Field pointCount:Int
	Field contactIndex:Int
end

struct b2ContactSolverDef
	Field step:b2TimeStep
	Field contacts:b2Contact
	Field count:Int
	Field positions:b2Position Ptr
	Field velocities:b2Velocity Ptr
	Field allocator:b2StackAllocator
end

class b2ContactSolver extends void
	Method New(def:b2ContactSolverDef Ptr)
	Method Destroy() Extension="delete"
	Method InitializeVelocityConstraints()
	Method WarmStart()
	Method SolveVelocityConstraints()
	Method StoreImpulses()
	Method SolvePositionConstraints:bool()
	Method SolveTOIPositionConstraints:bool(toiIndexA:Int,toiIndexB:Int)
	Field m_step:b2TimeStep
	Field m_positions:b2Position Ptr
	Field m_velocities:b2Velocity Ptr
	Field m_allocator:b2StackAllocator
	Field m_positionConstraints:b2ContactPositionConstraint Ptr
	Field m_velocityConstraints:b2ContactVelocityConstraint Ptr
	Field m_contacts:b2Contact
	Field m_count:int
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2EdgeAndCircleContact.h
'-------------------------------------------------------------------
class b2EdgeAndCircleContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2EdgeAndPolygonContact.h
'-------------------------------------------------------------------
class b2EdgeAndPolygonContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2PolygonAndCircleContact.h
'-------------------------------------------------------------------
class b2PolygonAndCircleContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Contacts/b2PolygonContact.h
'-------------------------------------------------------------------
class b2PolygonContact extends b2Contact
	Method Create:b2Contact(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method Destroy(contact:b2Contact,allocator:b2BlockAllocator)
	Method New(fixtureA:b2Fixture,fixtureB:b2Fixture)
	Method Destroy() Extension="delete"
	Method Evaluate(manifold:b2Manifold Ptr,xfA:b2Transform,xfB:b2Transform) override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2DistanceJoint.h
'-------------------------------------------------------------------
struct b2DistanceJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchorA:b2Vec2,anchorB:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field length:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2DistanceJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method SetLength(length:Float)
	Method GetLength:float32()
	Method SetFrequency(hz:Float)
	Method GetFrequency:float32()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:float32()
	Method Dump()
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2FrictionJoint.h
'-------------------------------------------------------------------
struct b2FrictionJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxForce:Float
	Field maxTorque:Float
end

class b2FrictionJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:float32()
	Method SetMaxTorque(torque:Float)
	Method GetMaxTorque:float32()
	Method Dump() override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2GearJoint.h
'-------------------------------------------------------------------
struct b2GearJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Field joint1:b2Joint
	Field joint2:b2Joint
	Field ratio:Float
end

class b2GearJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
	Method GetJoint1:b2Joint()
	Method GetJoint2:b2Joint()
	Method SetRatio(ratio:Float)
	Method GetRatio:float32()
	Method Dump() override
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
	Field prev:b2JointEdge Ptr
	Field next:b2JointEdge Ptr
end

struct b2JointDef
	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
end

class b2Joint extends void
	Method GetType:b2JointType()
	Method GetBodyA:b2Body()
	Method GetBodyB:b2Body()
	Method GetAnchorA:b2Vec2() virtual
	Method GetAnchorB:b2Vec2() virtual
	Method GetReactionForce:b2Vec2(inv_dt:Float) virtual
	Method GetReactionTorque:float32(inv_dt:Float) virtual
	Method GetNext:b2Joint()
	Method GetNext:b2Joint()
	Method GetUserData:void Ptr()
	Method SetUserData(data:void Ptr)
	Method IsActive:bool()
	Method GetCollideConnected:bool()
	Method Dump() virtual
	Method ShiftOrigin(newOrigin:b2Vec2) virtual
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2MotorJoint.h
'-------------------------------------------------------------------
struct b2MotorJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
	Field linearOffset:b2Vec2
	Field angularOffset:Float
	Field maxForce:Float
	Field maxTorque:Float
	Field correctionFactor:Float
end

class b2MotorJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
	Method SetLinearOffset(linearOffset:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLinearOffset:b2Vec2()
	Method SetAngularOffset(angularOffset:Float)
	Method GetAngularOffset:float32()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:float32()
	Method SetMaxTorque(torque:Float)
	Method GetMaxTorque:float32()
	Method SetCorrectionFactor(factor:Float)
	Method GetCorrectionFactor:float32()
	Method Dump() override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2MouseJoint.h
'-------------------------------------------------------------------
struct b2MouseJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Field target:b2Vec2
	Field maxForce:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2MouseJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
	Method SetTarget(target:b2Vec2)
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetTarget:b2Vec2()
	Method SetMaxForce(force:Float)
	Method GetMaxForce:float32()
	Method SetFrequency(hz:Float)
	Method GetFrequency:float32()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:float32()
	Method Dump() override
	Method ShiftOrigin(newOrigin:b2Vec2) override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2PrismaticJoint.h
'-------------------------------------------------------------------
struct b2PrismaticJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
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
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAxisA:b2Vec2()
	Method GetReferenceAngle:float32()
	Method GetJointTranslation:float32()
	Method GetJointSpeed:float32()
	Method IsLimitEnabled:bool()
	Method EnableLimit(flag:bool)
	Method GetLowerLimit:float32()
	Method GetUpperLimit:float32()
	Method SetLimits(lower:Float,upper:Float)
	Method IsMotorEnabled:bool()
	Method EnableMotor(flag:bool)
	Method SetMotorSpeed(speed:Float)
	Method GetMotorSpeed:float32()
	Method SetMaxMotorForce(force:Float)
	Method GetMaxMotorForce:float32()
	Method GetMotorForce:float32(inv_dt:Float)
	Method Dump() override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2PulleyJoint.h
'-------------------------------------------------------------------
'-----const: const float32 b2_minPulleyLength = 2.0f;
struct b2PulleyJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,groundAnchorA:b2Vec2,groundAnchorB:b2Vec2,anchorA:b2Vec2,anchorB:b2Vec2,ratio:Float)
	Field groundAnchorA:b2Vec2
	Field groundAnchorB:b2Vec2
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field lengthA:Float
	Field lengthB:Float
	Field ratio:Float
end

class b2PulleyJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
	Method GetGroundAnchorA:b2Vec2()
	Method GetGroundAnchorB:b2Vec2()
	Method GetLengthA:float32()
	Method GetLengthB:float32()
	Method GetRatio:float32()
	Method GetCurrentLengthA:float32()
	Method GetCurrentLengthB:float32()
	Method Dump() override
	Method ShiftOrigin(newOrigin:b2Vec2) override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2RevoluteJoint.h
'-------------------------------------------------------------------
struct b2RevoluteJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
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
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method GetReferenceAngle:float32()
	Method GetJointAngle:float32()
	Method GetJointSpeed:float32()
	Method IsLimitEnabled:bool()
	Method EnableLimit(flag:bool)
	Method GetLowerLimit:float32()
	Method GetUpperLimit:float32()
	Method SetLimits(lower:Float,upper:Float)
	Method IsMotorEnabled:bool()
	Method EnableMotor(flag:bool)
	Method SetMotorSpeed(speed:Float)
	Method GetMotorSpeed:float32()
	Method SetMaxMotorTorque(torque:Float)
	Method GetMaxMotorTorque:float32()
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
	Method GetMotorTorque:float32(inv_dt:Float)
	Method Dump() override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2RopeJoint.h
'-------------------------------------------------------------------
struct b2RopeJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxLength:Float
end

class b2RopeJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method SetMaxLength(length:Float)
	Method GetMaxLength:float32()
	Method GetLimitState:b2LimitState()
	Method Dump() override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2WeldJoint.h
'-------------------------------------------------------------------
struct b2WeldJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field referenceAngle:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

class b2WeldJoint extends b2Joint
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
	Method GetReferenceAngle:float32()
	Method SetFrequency(hz:Float)
	Method GetFrequency:float32()
	Method SetDampingRatio(ratio:Float)
	Method GetDampingRatio:float32()
	Method Dump() override
end

'-------------------------------------------------------------------
'./Dynamics/Joints/b2WheelJoint.h
'-------------------------------------------------------------------
struct b2WheelJointDef 

	Method New()
	Field type:b2JointType
	Field userData:void Ptr
	Field bodyA:b2Body
	Field bodyB:b2Body
	Field collideConnected:bool
	Method New()
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
	Method GetAnchorA:b2Vec2() override
	Method GetAnchorB:b2Vec2() override
	Method GetReactionForce:b2Vec2(inv_dt:Float) override
	Method GetReactionTorque:float32(inv_dt:Float) override
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorA:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAnchorB:b2Vec2()
'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!
	Method GetLocalAxisA:b2Vec2()
	Method GetJointTranslation:float32()
	Method GetJointLinearSpeed:float32()
	Method GetJointAngle:float32()
	Method GetJointAngularSpeed:float32()
	Method IsMotorEnabled:bool()
	Method EnableMotor(flag:bool)
	Method SetMotorSpeed(speed:Float)
	Method GetMotorSpeed:float32()
	Method SetMaxMotorTorque(torque:Float)
	Method GetMaxMotorTorque:float32()
	Method GetMotorTorque:float32(inv_dt:Float)
	Method SetSpringFrequencyHz(hz:Float)
	Method GetSpringFrequencyHz:float32()
	Method SetSpringDampingRatio(ratio:Float)
	Method GetSpringDampingRatio:float32()
	Method Dump() override
end

'-------------------------------------------------------------------
'./mx2_box2d/mx2_specific.h
'-------------------------------------------------------------------
'-------------------------------------------------------------------
'./Rope/b2Rope.h
'-------------------------------------------------------------------
struct b2RopeDef
	Method New()
	Field vertices:b2Vec2 Ptr
	Field count:Int
	Field masses:Float Ptr
	Field gravity:b2Vec2
	Field damping:Float
	Field k2:Float
	Field k3:Float
end

class b2Rope extends void
	Method New()
	Method Destroy() Extension="delete"
	Method Initialize(def:b2RopeDef Ptr)
	Method Step(timeStep:Float,iterations:Int)
	Method GetVertexCount:int32()
	Method GetVertices:b2Vec2 Ptr()
	Method Draw(draw:b2Draw)
	Method SetAngle(angle:Float)
end


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

