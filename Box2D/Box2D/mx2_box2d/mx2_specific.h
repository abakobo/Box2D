/*
functions for monkey2 module wrapper
*/

#ifndef MX2_SPECIFIC_H
#define MX2_SPECIFIC_H

#include <Box2D/Dynamics/Joints/b2Joint.h>

// joints extension casters
b2MouseJoint* b2JointTob2MouseJoint(b2Joint* jptr);

#endif