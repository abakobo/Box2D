
'-------------------------------------------------------------------
'./importsnocomasepar.temph
'-------------------------------------------------------------------
'-------------------------------------------------------------------
'./b2dJson.h
'-------------------------------------------------------------------
class b2dJsonColor4 { extends void
class b2dJsonCustomProperties { extends void
class b2dJson extends void
public
	Method New(useHumanReadableFloats = false:bool)
	Method Destroy() Extension="delete"
	Method clear()
	Method writeToValue:Json::Value(world:b2World Ptr)
	Method writeToString:std::string(world:b2World Ptr)
	Method writeToFile:bool(world:b2World Ptr,filename:char Ptr)
	Method b2j:Json::Value(world:b2World Ptr)
	Method b2j:Json::Value(body:b2Body Ptr)
	Method b2j:Json::Value(fixture:b2Fixture Ptr)
	Method b2j:Json::Value(joint:b2Joint Ptr)
	Method b2j:Json::Value(image:b2dJsonImage)
	Method setBodyName(body:b2Body Ptr,name:char Ptr)
	Method setFixtureName(fixture:b2Fixture Ptr,name:char Ptr)
	Method setJointName(joint:b2Joint Ptr,name:char Ptr)
	Method setImageName(image:b2dJsonImage,name:char Ptr)
	Method setBodyPath(body:b2Body Ptr,path:char Ptr)
	Method setFixturePath(fixture:b2Fixture Ptr,path:char Ptr)
	Method setJointPath(joint:b2Joint Ptr,path:char Ptr)
	Method setImagePath(image:b2dJsonImage,path:char Ptr)
	Method addImage(image:b2dJsonImage)
	Method readFromValue:b2World Ptr(worldValue:Json::Value,*existingWorld = NULL:b2World)
	Method readFromString:b2World Ptr(str:std::string,errorMsg:std::string,*existingWorld = NULL:b2World)
	Method readFromFile:b2World Ptr(filename:char Ptr,errorMsg:std::string,existingWorld = NULL:b2World Ptr)
	Method readIntoWorldFromValue:bool(*existingWorld:b2World,&worldValue:Json::Value)
	Method readIntoWorldFromString:bool(*existingWorld:b2World,str:std::string,errorMsg:std::string)
	Method readIntoWorldFromFile:bool(*existingWorld:b2World,filename:char Ptr,errorMsg:std::string)
	Method j2b2World:b2World Ptr(&worldValue:Json::Value,world = NULL:b2World Ptr)
	Method j2b2Body:b2Body Ptr(world:b2World Ptr,bodyValue:Json::Value)
	Method j2b2Fixture:b2Fixture Ptr(body:b2Body Ptr,fixtureValue:Json::Value)
	Method j2b2Joint:b2Joint Ptr(world:b2World Ptr,jointValue:Json::Value)
	Method j2b2dJsonImage:b2dJsonImage(imageValue:Json::Value)
	Method j2Intob2World:bool(*world:b2World,worldValue:Json::Value)
	Method getBodiesByName:int(name:std::string,bodies:std::vector<b2Body Ptr>)
	Method getFixturesByName:int(name:std::string,fixtures:std::vector<b2Fixture Ptr>)
	Method getJointsByName:int(name:std::string,joints:std::vector<b2Joint Ptr>)
	Method getImagesByName:int(name:std::string,images:std::vector<b2dJsonImage Ptr>)
	Method getBodiesByPath:int(path:std::string,bodies:std::vector<b2Body Ptr>)
	Method getFixturesByPath:int(path:std::string,fixtures:std::vector<b2Fixture Ptr>)
	Method getJointsByPath:int(path:std::string,joints:std::vector<b2Joint Ptr>)
	Method getImagesByPath:int(path:std::string,images:std::vector<b2dJsonImage Ptr>)
	Method getAllBodies:int(bodies:std::vector<b2Body Ptr>)
	Method getAllFixtures:int(fixtures:std::vector<b2Fixture Ptr>)
	Method getAllJoints:int(joints:std::vector<b2Joint Ptr>)
	Method getAllImages:int(images:std::vector<b2dJsonImage Ptr>)
	Method getBodyByName:b2Body Ptr(name:std::string)
	Method getFixtureByName:b2Fixture Ptr(name:std::string)
	Method getJointByName:b2Joint Ptr(name:std::string)
	Method getImageByName:b2dJsonImage(name:std::string)
	Method getBodyByPathAndName:b2Body Ptr(path:std::string,name:std::string)
	Method getFixtureByPathAndName:b2Fixture Ptr(path:std::string,name:std::string)
	Method getJointByPathAndName:b2Joint Ptr(path:std::string,name:std::string)
	Method getImageByPathAndName:b2dJsonImage(path:std::string,name:std::string)
	Method getJointToNameMap:std::map<b2Joint Ptr,std::string>()
	Method getFixtureToNameMap:std::map<b2Fixture Ptr,std::string>()
	Method getBodyName:std::string(body:b2Body Ptr)
	Method getFixtureName:std::string(fixture:b2Fixture Ptr)
	Method getJointName:std::string(joint:b2Joint Ptr)
	Method getImageName:std::string(img:b2dJsonImage)
	Method getBodyPath:std::string(body:b2Body Ptr)
	Method getFixturePath:std::string(fixture:b2Fixture Ptr)
	Method getJointPath:std::string(joint:b2Joint Ptr)
	Method getImagePath:std::string(img:b2dJsonImage)
	Method getCustomPropertiesForItem:b2dJsonCustomProperties(item:void Ptr,createIfNotExisting:bool)
public
'-----ALIAS(orconst)!?: #define DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(ucType, lcType)\
	Method setCustom##ucType(item:b2Body Ptr,propertyName:std::string,val:lcType)
	Method setCustom##ucType(item:b2Fixture Ptr,propertyName:std::string,val:lcType)
	Method setCustom##ucType(item:b2Joint Ptr,propertyName:std::string,val:lcType)
	Method setCustom##ucType(item:b2dJsonImage,propertyName:std::string,val:lcType)
	Method setCustom##ucType(item:b2World Ptr,propertyName:std::string,val:lcType)
	Method :DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(Int,(Int:In,int:in)
	Method :DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(Float,(Float:Floa,float:floa)
	Method :DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(String,(String:Strin,std::string:std::strin)
	Method :DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(Vector,(Vector:Vecto,b2Vec2:b2Vec)
	Method :DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(Bool,(Bool:Boo,bool:boo)
	Method :DECLARE_SET_CUSTOM_PROPERTY_VALUE_FUNCTIONS(Color,(Color:Colo,b2dJsonColor4:b2dJsonColor)
	Method hasCustomInt:bool(item:void Ptr,propertyName:std::string)
	Method hasCustomFloat:bool(item:void Ptr,propertyName:std::string)
	Method hasCustomString:bool(item:void Ptr,propertyName:std::string)
	Method hasCustomVector:bool(item:void Ptr,propertyName:std::string)
	Method hasCustomBool:bool(item:void Ptr,propertyName:std::string)
	Method hasCustomColor:bool(item:void Ptr,propertyName:std::string)
	Method getCustomInt:int(item:void Ptr,propertyName:std::string,defaultVal = 0:int)
	Method getCustomFloat:float(item:void Ptr,propertyName:std::string,defaultVal = 0:float)
	Method getCustomString:std::string(item:void Ptr,propertyName:std::string,defaultVal = "":std::string)
	Method getCustomVector:b2Vec2(item:void Ptr,propertyName:std::string,defaultVal = b2Vec2(0:b2Vec2,0:)
	Method getCustomBool:bool(item:void Ptr,propertyName:std::string,defaultVal = false:bool)
	Method getCustomColor:b2dJsonColor4(item:void Ptr,propertyName:std::string,defaultVal = b2dJsonColor4(:b2dJsonColor4)
'-----ALIAS(orconst)!?: #define DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_VECTOR(ucType, lcType)\
	Method getBodiesByCustom##ucType:int(propertyName:std::string,valueToMatch:lcType,bodies:std::vector<b2Body Ptr>)
	Method getFixturesByCustom##ucType:int(propertyName:std::string,valueToMatch:lcType,fixtures:std::vector<b2Fixture Ptr>)
	Method getJointsByCustom##ucType:int(propertyName:std::string,valueToMatch:lcType,joints:std::vector<b2Joint Ptr>)
	Method getImagesByCustom##ucType:int(propertyName:std::string,valueToMatch:lcType,images:std::vector<b2dJsonImage Ptr>)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_VECTOR(Int,(Int:In,int:in)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_VECTOR(Float,(Float:Floa,float:floa)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_VECTOR(String,(String:Strin,std::string:std::strin)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_VECTOR(Vector,(Vector:Vecto,b2Vec2:b2Vec)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_VECTOR(Bool,(Bool:Boo,bool:boo)
'-----ALIAS(orconst)!?: #define DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_SINGLE(ucType, lcType)\
	Method         getBodyByCustom##ucType:b2Body Ptr(propertyName:std::string,valueToMatch:lcType)
	Method      getFixtureByCustom##ucType:b2Fixture Ptr(propertyName:std::string,valueToMatch:lcType)
	Method        getJointByCustom##ucType:b2Joint Ptr(propertyName:std::string,valueToMatch:lcType)
	Method   getImageByCustom##ucType:b2dJsonImage(propertyName:std::string,valueToMatch:lcType)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_SINGLE(Int,(Int:In,int:in)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_SINGLE(Float,(Float:Floa,float:floa)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_SINGLE(String,(String:Strin,std::string:std::strin)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_SINGLE(Vector,(Vector:Vecto,b2Vec2:b2Vec)
	Method :DECLARE_GET_BY_CUSTOM_PROPERTY_VALUE_FUNCTIONS_SINGLE(Bool,(Bool:Boo,bool:boo)
public
	Method floatToHex:std::string(f:float)
	Method hexToFloat:float(str:std::string)
	Method jsonToFloat:float(name:char Ptr,value:Json::Value,index = -1:int,defaultValue = 0:float)
	Method jsonToVec:b2Vec2(name:char Ptr,value:Json::Value,index = -1:int,defaultValue = b2Vec2(0:b2Vec2,0:)
end

'-------------------------------------------------------------------
'./b2dJsonImage.h
'-------------------------------------------------------------------
class b2dJsonImage { extends void
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'-------------------------------------------------------------------
'./b2dJsonImage_OpenGL.h
'-------------------------------------------------------------------
class b2dJsonImage_OpenGL extends b2dJsonImage {
public
'-------------------------------------------------------------------
'./bitmap.h
'-------------------------------------------------------------------
'-----ALIAS(orconst)!?: #define __LITTLE_ENDIAN__
'-----ALIAS(orconst)!?: #define BITMAP_SIGNATURE 0x4d42
'-----ALIAS(orconst)!?: #define BITMAP_SIGNATURE 0x424d
'-----ALIAS(orconst)!?: #define BITMAP_FILEHEADER_SIZE 14
'------Ya du array à gérer ici!
class CBitmap { extends void
public
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'-------------------------------------------------------------------
'./json/json-forwards.h
'-------------------------------------------------------------------
Function author :The(Lepilleur:Baptiste)
Function jurisdictions which do not recognize Public Domain property :In(Germany as o:e.g.)
Function this software is Copyright :2010),()
Function under the terms of the MIT License :released(below:see)
Function of the MIT License :conditions(below:see)
Function :Copyright(c:)
Function :files("Software":the)
'-----ALIAS(orconst)!?: #define JSON_IS_AMALGATED
'-----ALIAS(orconst)!?: #define JSON_USE_INT64_DOUBLE_CONVERSION 1
'-------------------------------------------------------------------
'./json/json.h
'-------------------------------------------------------------------
Function author :The(Lepilleur:Baptiste)
Function jurisdictions which do not recognize Public Domain property :In(Germany as o:e.g.)
Function this software is Copyright :2010),()
Function under the terms of the MIT License :released(below:see)
Function of the MIT License :conditions(below:see)
Function :Copyright(c:)
Function :files("Software":the)
'-----ALIAS(orconst)!?: #define JSON_IS_AMALGATED
'-----ALIAS(orconst)!?: #define JSON_IS_AMALGAMATION
'-----ALIAS(orconst)!?: #define JSON_USE_INT64_DOUBLE_CONVERSION 1
public
public
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
'------Ya du array à gérer ici!
class DefaultValueArrayAllocator extends ValueArrayAllocator
	Method Destroy() Extension="delete"
	Method *newArray:ValueInternalArray() virtual
	Method *newArrayCopy:ValueInternalArray(&other:ValueInternalArray) virtual
	Method destruct(*array:ValueInternalArray) virtual
	Method reallocateArrayPageIndex(**&indexes:Value,&indexCount:ValueInternalArray::PageIndex,minNewIndexCount:ValueInternalArray::PageIndex) virtual
	Method releaseArrayPageIndex(**indexes:Value,indexCount:ValueInternalArray::PageIndex) virtual
	Method *allocateArrayPage:Value() virtual
	Method releaseArrayPage(*value:Value) virtual
end

public
public
public
'------Ya du array à gérer ici!
public
public



