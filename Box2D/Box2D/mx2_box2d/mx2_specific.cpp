/*
functions for monkey2 module wrapper
*/
#include <Box2D/Dynamics/Joints/b2MouseJoint.h>
#include <Box2D/Dynamics/b2Body.h>
#include <Box2D/Dynamics/b2TimeStep.h>


b2MouseJoint* b2JointTob2MouseJoint(b2Joint* jptr)
{
	b2MouseJoint* ret;

	ret=(b2MouseJoint*)jptr;

	return ret;
}