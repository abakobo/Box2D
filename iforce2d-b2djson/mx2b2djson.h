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


b2World* b2dJsonReadFromString_ext (const char* thecstring, char* charErrMsg, int charsize, b2World* existingWorld = NULL);

void b2dJsonWriteToString_ext(char* thecstring , b2World* world , b2dJson* existingJson = NULL);

int Getb2dJsonStringSize(b2World* world,b2dJson* existingJson = NULL);



#endif // MX2B2DJSON_H