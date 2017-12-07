Namespace mx2b2dJson

#Import "<std>"
#Import "<libc>"

'should be #Import<Box2D> when a Box2D module is set up
#Import "../box2d.monkey2" 

#Import "mx2b2dJson.h"
#Import "*.h"

#Import "mx2b2dJson.cpp"
#Import "b2dJson.cpp"
#Import "b2dJsonImage.cpp"
#Import "jsoncpp.cpp"

Using std..
Using libc..
Using box2d..

Extern

Function b2dJsonReadFromFile_ext:b2World(filename:CString , errorMsg:char_t Ptr , charsize:Int , existingWorld:b2World = Null)

Public

Function b2dJsonReadFromFile:b2World(filename:String , existingWorld:b2World = Null)
	
	Local maxChrSize:Int=321
	Local buf:=New char_t[maxChrSize]
	
	Local retWorld:=b2dJsonReadFromFile_ext(filename , buf.Data , maxChrSize , existingWorld )
	
	#If __DEBUG__
		Print String.FromCString( buf.Data )
	#Endif
	
	Return retWorld
		
End



