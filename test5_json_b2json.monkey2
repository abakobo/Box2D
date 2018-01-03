
Namespace myapp

#Import "<std>"
#Import "assets/"

Using std..

Function Main()
	Local vectArr:=GetImageCenterArray("asset::125.json")
	'	Local vectArr:=GetImageCenterArray("asset::iim_nocentre.json")
End

Function GetImageCenterArray:Vec2f[](path:String)
	
	Local lobj:=JsonObject.Load( path )
	
	If lobj["image"]
		Local imgval:=lobj["image"]
		Local imgarr:=imgval.ToArray() 'image est d'abord un array contennant objet json 
		Local imgArraySize:=imgarr.Length

		For Local i:=0 Until imgArraySize
			Print "image" +i
			Local imgarrelem:=imgarr[i]
			
			Local imgelemobj:=imgarrelem.ToObject()
			
			Print imgelemobj["body"].ToNumber()
			
			If imgelemobj["center"]

				Local imgval:=imgelemobj["center"]
				
				If imgval.IsNumber 'center is (0,0)
					
					Print "center: 0,0 :  "+imgval.ToNumber()
					
				Else 'imgval.isObject --> center with two elements x and y
					
					Local centerobj:=imgval.ToObject()
					Local x:= centerobj["x"].ToNumber()
					Local y:= centerobj["y"].ToNumber()
					Print "center: "+ x +" , "+y
					
					
					
				End
				
		'		Print imgval
'				Print "-------"+i
'				Print imgval.IsObject
'				Print imgval.IsBool
'				Print imgval.IsArray
'				Print imgval.IsNull
'				Print imgval.IsNumber
'				Print imgval.IsString
'				Print "++++++++++"
				
				
			Else
				"-+-+-+-+-+-+-+-+-+"
			End
		Next
		
		
'		JOAll=leobj.ToObject().All()
		'
		'While JOAll.Current <> Null
'			Print JOAll.Current.Key
'			JOAll.Bump()
'		Wend
		
		'Print marrALL
		
		'While marrALL.Current <> Null
		'	Print marrALL.Current.ToString()
		'	marrALL.Bump()
		'Wend
		
		
		'Local mobjALL:=mobj.All()

		'Print cobj.IsObject
		'Print cobj.IsBool
		'Print cobj.IsArray
		'Print cobj.IsNull
		'Print cobj.IsNumber
		'Print cobj.IsString
	Else
		Print "no 'image' value"
	End
	
	Return Null
	
End