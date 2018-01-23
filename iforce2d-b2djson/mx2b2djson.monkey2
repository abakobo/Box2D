Namespace mx2b2dJson

#Import "<std>"
#Import "<libc>"

'should be #Import<Box2D> when a Box2D module is set up
#Import "../box2d.monkey2" 

#Import "mx2b2dJson.h"
#Import "b2dJson.h"
'#Import "json/json.h"
#Import "*.h"

#Import "mx2b2dJson.cpp"
#Import "b2dJson.cpp"
#Import "b2dJsonImage.cpp"
#Import "jsoncpp.cpp"

Using std..
Using libc..
Using box2d..

Extern

	
Function b2dJsonReadFromString_ext:b2World(thecstring:CString , errorMsg:char_t Ptr , charsize:Int , existingWorld:b2World = Null)

Function b2dJsonWriteToString_ext(thecstring:char_t Ptr , world:b2World,existingJson:b2dJson=Null)
	
Function Getb2dJsonStringSize:Int (world:b2World,existingJson:b2dJson=Null)

	
Class b2dJson Extends Void
	
	  '//constructor
	    'Method New b2dJson(bool useHumanReadableFloats = false);
	    '~b2dJson();
	    
		Method New(useHumanReadableFloats:Bool=False)
		Method Destroy() Extension="delete"

	
	    Method clear()
	
	    '//writing functions
	    'Json::Value writeToValue(b2World* world);  'not manipulating json values here..
	    'std::string writeToString(b2World* world);
	    'bool writeToFile(b2World* world, const char* filename);
	
	    'Json::Value b2j(b2World* world);
	    'Json::Value b2j(b2Body* body);
	    'Json::Value b2j(b2Fixture* fixture);
	    'Json::Value b2j(b2Joint* joint);
	    'Json::Value b2j(b2dJsonImage* image);
	
	    'Void setBodyName(b2Body* body, Const char* name);
	    'void setFixtureName(b2Fixture* fixture, const char* name);
	    'void setJointName(b2Joint* joint, const char* name);
	    
	    Method setBodyName(body:b2Body, name:CString)
		Method setFixtureName(fixture:b2Fixture, name:CString)
		Method setJointName(joint:b2Joint, name:CString)   
	    'void setImageName(b2dJsonImage* image,:CString const char* name);
	
	    'void setBodyPath(b2Body* body, const char* path);
	    'void setFixturePath(b2Fixture* fixture, const char* path);
	    'void setJointPath(b2Joint* joint, const char* path);
	    'void setImagePath(b2dJsonImage* image, const char* path);
	
	    'void addImage(b2dJsonImage* image);
	
	    '//reading functions
	    'b2World* readFromValue(Json::Value worldValue, b2World *existingWorld = NULL);
	    'b2World* readFromString(std::string str, std::string& errorMsg, b2World *existingWorld = NULL);
	    'b2World* readFromFile(const char* filename, std::string& errorMsg, b2World* existingWorld = NULL);
	
	    '//backward compatibility
	    'bool readIntoWorldFromValue(b2World *existingWorld, Json::Value &worldValue)                    { return readFromValue(worldValue, existingWorld); }
	    'bool readIntoWorldFromString(b2World *existingWorld, std::string str, std::string& errorMsg)    { return readFromString(str, errorMsg, existingWorld); }
	    'bool readIntoWorldFromFile(b2World *existingWorld, const char* filename, std::string& errorMsg) { return readFromFile(filename, errorMsg, existingWorld); }
	
	    'b2World* j2b2World(Json::Value &worldValue, b2World* world = NULL);
	    'b2Body* j2b2Body(b2World* world, Json::Value& bodyValue);
	    'b2Fixture* j2b2Fixture(b2Body* body, Json::Value& fixtureValue);
	    'b2Joint* j2b2Joint(b2World* world, Json::Value& jointValue);
	    'b2dJsonImage* j2b2dJsonImage(Json::Value& imageValue);
	    
	    '//function copies json world into existing world
	    'bool j2Intob2World(b2World *world, Json::Value& worldValue);
	
	    'int getBodiesByName(std::string name, std::vector<b2Body*>& bodies);
	    'int getFixturesByName(std::string name, std::vector<b2Fixture*>& fixtures);
	    'int getJointsByName(std::string name, std::vector<b2Joint*>& joints);
	    'int getImagesByName(std::string name, std::vector<b2dJsonImage*>& images);
	
	    'int getBodiesByPath(std::string path, std::vector<b2Body*>& bodies);
	    'int getFixturesByPath(std::string path, std::vector<b2Fixture*>& fixtures);
	    'int getJointsByPath(std::string path, std::vector<b2Joint*>& joints);
	    'int getImagesByPath(std::string path, std::vector<b2dJsonImage*>& images);
	
	    'int getAllBodies(std::vector<b2Body*>& bodies);
	    'int getAllFixtures(std::vector<b2Fixture*>& fixtures);
	    'int getAllJoints(std::vector<b2Joint*>& joints);
	    'int getAllImages(std::vector<b2dJsonImage*>& images);
	
	    'b2Body* getBodyByName(std::string name);
	    'b2Fixture* getFixtureByName(std::string name);
	    'b2Joint* getJointByName(std::string name);
	    'b2dJsonImage* getImageByName(std::string name);
	
	    'b2Body* getBodyByPathAndName(std::string path, std::string name);
	    'b2Fixture* getFixtureByPathAndName(std::string path, std::string name);
	    'b2Joint* getJointByPathAndName(std::string path, std::string name);
	    'b2dJsonImage* getImageByPathAndName(std::string path, std::string name);
	
	    'std::map<b2Joint*,std::string> getJointToNameMap() const { return m_jointToNameMap; }
	    'std::map<b2Fixture*,std::string> getFixtureToNameMap() const { return m_fixtureToNameMap; }
	
	    'std::string getBodyName(b2Body* body);
	    'std::string getFixtureName(b2Fixture* fixture);
	    'std::string getJointName(b2Joint* joint);
	    'std::string getImageName(b2dJsonImage* img);
	
	    'std::string getBodyPath(b2Body* body);
	    'std::string getFixturePath(b2Fixture* fixture);
	    'std::string getJointPath(b2Joint* joint);
	    'std::string getImagePath(b2dJsonImage* img);
	
	    '////// custom properties
	
	    'b2dJsonCustomProperties* getCustomPropertiesForItem(void* item, bool createIfNotExisting);
	
End
	


Public
'
'convenience funcs To be able To work with mx2 asset construct (using mx2'load/saveString)
'
Function Loadb2dJson:b2World(filename:String , existingWorld:b2World = Null)
	
	Local maxChrSize:Int=321
	Local buf:=New char_t[maxChrSize]
	
			
	Local theStr:=LoadString(filename,True)
	
	Return mx2b2dJson.b2dJsonReadFromString(theStr)
		
End

Function b2dJsonReadFromString:b2World(theString:String , existingWorld:b2World = Null)
	
	Local maxChrSize:Int=321
	Local buf:=New char_t[maxChrSize]
	
	Local retWorld:=b2dJsonReadFromString_ext(theString , buf.Data , maxChrSize , existingWorld )
	
	#If __DEBUG__
		Print String.FromCString( buf.Data )
	#Endif
	
	Return retWorld
		
End


' this will not save the names and images paths
Function Saveb2dJson(filename:String , world:b2World)
	
	
	Local strSize:=mx2b2dJson.Getb2dJsonStringSize(world)
	Local jsonCStr:=New char_t[strSize]
	b2dJsonWriteToString_ext(jsonCStr.Data,world)

	SaveString(String.FromCString(jsonCStr.Data),filename,True)
		
End





