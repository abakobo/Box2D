#ifndef MX2B2DJSON_H
#define MX2B2DJSON_H

//#include <stdio.h>
//#include <map>
//#include <set>
//#include <string>
//#include <vector>
#include <Box2D/Box2D.h>

//#include "b2dJson.h"
//#include "json/json.h"

b2World* b2dJsonReadFromFile_ext (const char* filename, char* errorMsg, int charsize, b2World* existingWorld = NULL);

b2World* b2dJsonReadFromString_ext (const char* thecstring, char* charErrMsg, int charsize, b2World* existingWorld = NULL);

#endif // MX2B2DJSON_H