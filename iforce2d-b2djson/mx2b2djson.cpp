

#include <string>
#include <iostream>

#include "b2dJson.h"
//#include "json/json.h"

//using namespace std;


b2World* b2dJsonReadFromString_ext (const char* thecstring, char* charErrMsg, int charsize, b2World* existingWorld) {

	std::string errMsg;
	std::string thecppstring(thecstring);
	b2dJson json;
	b2World* returnWorld = json.readFromString(thecppstring, errMsg, existingWorld );

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

int Getb2dJsonStringSize(b2World* world,b2dJson* existingJson = NULL){
	int ret;
	std::string thecppstring;
	if (existingJson==NULL) {
		b2dJson json;
		thecppstring=json.writeToString(world);
		ret=thecppstring.length() + 1;
		}
	else {
		thecppstring=existingJson->writeToString(world);
		ret=thecppstring.length() + 1;
		}
	return ret;	
}

void b2dJsonWriteToString_ext(char* thecstring , b2World* world , b2dJson* existingJson){
	std::string thecppstring;
	if (existingJson==NULL) {
		b2dJson json;
		thecppstring=json.writeToString(world);
		}
	else {
		thecppstring=existingJson->writeToString(world);
		}
	strcpy(thecstring, thecppstring.c_str());	
}



	
