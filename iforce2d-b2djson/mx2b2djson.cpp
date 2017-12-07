

#include <string>

#include "b2dJson.h"
#include "json/json.h"

b2World* b2dJsonReadFromFile_ext (const char* filename, char* charErrMsg, int charsize, b2World* existingWorld) {

	std::string errMsg;
	b2dJson json;
	b2World* returnWorld = json.readFromFile(filename, errMsg, existingWorld );

	if (charsize>8) { // the char array must have a certain size..
		if (errMsg.size()<charsize-2){
			std::copy(errMsg.begin(), errMsg.end(), charErrMsg);
		}
		else {
			std::string errMsgBis;
			errMsgBis = errMsg.substr (0,charsize-3);
			std::copy(errMsgBis.begin(), errMsgBis.end(), charErrMsg);
			charErrMsg[errMsgBis.size()] = '\0'; // terminating the cstring
		}
	}
	return returnWorld;
}