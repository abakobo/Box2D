struct b2ManifoldPoint
	Field localPoint:b2Vec2
	Field normalImpulse:Float
	Field tangentImpulse:Float
	Field id:b2ContactID
end

struct b2ClipVertex
	Field v:b2Vec2
	Field id:b2ContactID
end

struct b2RayCastInput
	Field p1, p2:b2Vec2
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
end

struct b2SimplexCache
	Field metric:Float
	Field count:ushort
	Field indexA[3]:Byte
	Field indexB[3]:Byte
end

struct b2ContactRegister
	Field createFcn:b2ContactCreateFcn
	Field destroyFcn:b2ContactDestroyFcn
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



struct b2DistanceJointDef extends b2JointDef
	Method Initialize(bodyA:b2Body,bodyB:b2Body)
	Field anchorA, b2Vec2 anchorB):b2Vec2
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field length:Float
	Field frequencyHz:Float
	Field dampingRatio:Float
end

struct b2FrictionJointDef extends b2JointDef
	Method Initialize(bodyA:b2Body,bodyB:b2Body,anchor:b2Vec2)
	Field localAnchorA:b2Vec2
	Field localAnchorB:b2Vec2
	Field maxForce:Float
	Field maxTorque:Float
end

struct b2GearJointDef extends b2JointDef
	Field joint1:b2Joint
	Field joint2:b2Joint
	Field ratio:Float
end

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
	Field stepp:b2TimeStep
	Field contacts:b2Contact
	Field count:Int
	Field positions:b2Position
	Field velocities:b2Velocity
	Field allocator:b2StackAllocator
End
class b2Rope
	Method Initialize(def:b2RopeDef)
	Method Stepp(timeStep:Float,iterations:Int)
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

class b2Island
	Method New(bodyCapacity:Int,contactCapacity:Int,jointCapacity:Int,allocator:b2StackAllocator Ptr,listener:b2ContactListener Ptr)
	Method Clear()
	Method Solve(profile:b2Profile,step:b2TimeStep,gravity:b2Vec2,allowSleep:bool)
	Method SolveTOI(subStep:b2TimeStep,toiIndexA:Int,toiIndexB:Int)
	Method Add(body:b2Body)
	Method Add(contact:b2Contact)
	Method Add(joint:b2Joint)
	Method Report(b2ContactVelocityConstraint*raints:b2ContactVelocityConstraintraint)
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

struct b2Profile
	Field stepp:Float
	Field collide:Float
	Field solve:Float
	Field solveInit:Float
	Field solveVelocity:Float
	Field solvePosition:Float
	Field broadphase:Float
	Field solveTOI:Float
end

