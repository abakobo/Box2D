#ifndef MX2B2DJSON_H
#define MX2B2DJSON_H

//#include <stdio.h>
//#include <map>
//#include <set>
//#include <string>
//#include <vector>
#include <Box2D/Box2D.h>

#include "b2dJson.h"
//#include "json/json.h"
#include "bbtypes.h"


b2World* b2dJsonReadFromString_ext (const char* thecstring, char* charErrMsg, int charsize, b2World* existingWorld = NULL);

b2World* b2dJsonReadFromString_Ref_ext (b2dJson* jsonP , const char* thecstring, char* charErrMsg, int charsize, b2World* existingWorld);

void b2dJsonWriteToString_ext(char* thecstring , b2World* world , b2dJson* existingJson = NULL);

int Getb2dJsonStringSize(b2World* world,b2dJson* existingJson = NULL);


b2Fixture* GetFixtureByName(b2dJson* json , const char* name);
bbArray<b2Fixture*> GetFixturesByName(b2dJson* json , const char* name );

b2Joint* GetJointByName(b2dJson* json , const char* name);
bbArray<b2Joint*> GetJointsByName(b2dJson* json , const char* name );

b2Body* GetBodyByName(b2dJson* json , const char* name);

#endif // MX2B2DJSON_H