class b2Contact
	Method GetManifold:b2Manifold()
	Method GetManifold:b2Manifold()
	Method GetWorldManifold(worldManifold:b2WorldManifold)
	Method IsTouching:bool()
	Method SetEnabled(flag:bool)
	Method IsEnabled:bool()
	Method GetNext:b2Contact()
	Method GetNext:b2Contact()
	Method GetFixtureA:b2Fixture()
	Method GetFixtureA:b2Fixture()
	Method GetChildIndexA:Int()
	Method GetFixtureB:b2Fixture()
	Method GetFixtureB:b2Fixture()
	Method GetChildIndexB:Int()
	Method SetFriction(friction:Float)
	Method GetFriction:Float()
	Method ResetFriction()
	Method SetRestitution(restitution:Float)
	Method GetRestitution:Float()
	Method ResetRestitution()
	Method SetTangentSpeed(speed:Float)
	Method GetTangentSpeed:Float()
	Method Evaluate(manifold:b2Manifold,xfA:b2Transform,xfB:b2Transform)
	'Field class b2ContactManager:friend
	'Field class b2World:friend
	'Field class b2ContactSolver:friend
	'Field class b2Body:friend
	'Field class b2Fixture:friend
	Field Flags stored in m_flags://
	Method FlagForFiltering()
	'Method void AddType:static(createFcn:b2ContactCreateFcn,destroyFcn:b2ContactDestroyFcn)
	Field typeA, b2Shape::Type typeB):b2Shape::Type
	Method void InitializeRegisters:static()
	Method b2Contact* Create:static(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int,allocator:b2BlockAllocator)
	Method void Destroy:static(contact:b2Contact,typeA:b2Shape::Type,typeB:b2Shape::Type,allocator:b2BlockAllocator)
	Method void Destroy:static(contact:b2Contact,allocator:b2BlockAllocator)
	Method :b2Contact()()
	Method :b2Contact(b2Fixture(fixtureA:b2Fixture,indexA:Int,fixtureB:b2Fixture,indexB:Int)
	Method :~b2Contact()()
	Method Update(listener:b2ContactListener)
	Field b2ContactRegister s_registers[b2Shape::e_typeCount][b2Shape::e_typeCount]:static
	Field bool s_initialized:static
	Field m_flags:uint
	Field World pool and list pointers.://
	Field m_prev:b2Contact
	Field m_next:b2Contact
	Field Nodes for connecting bodies.://
	Field m_nodeA:b2ContactEdge
	Field m_nodeB:b2ContactEdge
	Field m_fixtureA:b2Fixture
	Field m_fixtureB:b2Fixture
	Field m_indexA:Int
	Field m_indexB:Int
	Field m_manifold:b2Manifold
	Field m_toiCount:Int
	Field m_toi:Float
	Field m_friction:Float
	Field m_restitution:Float
	Field m_tangentSpeed:Float
End

class b2Island
	Method New(bodyCapacity:Int,contactCapacity:Int,jointCapacity:Int,allocator:b2StackAllocator Ptr,listener:b2ContactListener Ptr)
	Method Clear()
	Method Solve(profile:b2Profile,stepp:b2TimeStep="step",gravity:b2Vec2,allowSleep:bool)
	Method SolveTOI(subStep:b2TimeStep,toiIndexA:Int,toiIndexB:Int)
	Method Add(body:b2Body)
	Method Add(contact:b2Contact)
	Method Add(joint:b2Joint)
	Method Report(constrains:b2ContactVelocityConstraint) ' may be it has to be passed by pointer.... but island is an internal Box2D class so I don't really mind 
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