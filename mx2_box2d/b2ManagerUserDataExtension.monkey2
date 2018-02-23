Namespace box2d

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"
#Import "b2dJsonBodyImage.monkey2"
#Import "b2dJsonJoint.monkey2"



Using std..
Using mojo..
Using box2d..
Using b2dJsonInfo..

Class b2Manager Extension
	
'---------------------------- Body user data singleton by Name
	
	Method GetBodyUserDataToM:StringMap<Variant>(name:String)
		Local i:=0
		While i<bodyInfos.Length
			If bodyInfos[i].bodyName=name Then Return bodyInfos[i].bodyUserData
			i+=1
		Wend
		
		#If __DEBUG__
			Print "No body with name "+name+" !!!!!!!!!!!!!!!"
		#End
		
		Return Null

	End
	
	Method GetBodyUserData:Variant(name:String,dataName:String)
		
		Local data:=GetBodyUserDataToM(name)
		
		Local ret:=data[dataName]
		
		#If __DEBUG__
			If ret=False Then Print "No body-data "+dataName+" for body "+name+" !!!!!!!!!!!!!!!"
		#End
		
		Return ret

	End
	Method GetBodyUserDataToS:String(name:String,dataName:String)
		
		Local dataVariant:=GetBodyUserDataToM(name)[dataName]
		
		If dataVariant.Type.Name="String"
			
			Return Cast<String>(dataVariant)
			
		Else
		
			#If __DEBUG__
				Print "body-data "+dataName+" for body "+name+" Is Not a String !!!!!!!!!!!!!!!"
			#End
			
		End
		
		Return Null

	End
	
	Method GetBodyUserDataToB:Bool(name:String,dataName:String)
	
		Local dataVariant:=GetBodyUserDataToM(name)[dataName]
	
		If dataVariant.Type.Name="Bool"
	
			Return Cast<Bool>(dataVariant)
	
		Else
	
			#If __DEBUG__
				If dataVariant=False Then Print "body-data "+dataName+" for body "+name+" Is Not a Bool !!!!!!!!!!!!!!!"
			#End
	
		End
	
		Return Null
	
	End
	
	Method GetBodyUserDataToI:Int(name:String,dataName:String)
	
		Local dataVariant:=GetBodyUserDataToM(name)[dataName]
	
		If dataVariant.Type.Name="Int"
	
			Return Cast<Int>(dataVariant)
	
		Else
	
			#If __DEBUG__
				If dataVariant=False Then Print "body-data "+dataName+" for body "+name+" Is Not an Int !!!!!!!!!!!!!!!"
			#End
	
		End
	
		Return Null
	
	End
	
	Method GetBodyUserDataToF:Float(name:String,dataName:String)
	
		Local dataVariant:=GetBodyUserDataToM(name)[dataName]
	
		If dataVariant.Type.Name="Float"
	
			Return Cast<Float>(dataVariant)
	
		Else
	
			#If __DEBUG__
				If dataVariant=False Then Print "body-data "+dataName+" for body "+name+" Is Not a Float !!!!!!!!!!!!!!!"
			#End
	
		End
	
		Return Null
	
	End
	
	Method GetBodyUserDataToN:Float(name:String,dataName:String)
	
		Local dataVariant:=GetBodyUserDataToM(name)[dataName]
	
		If dataVariant.Type.Name="Float"
	
			Return Cast<Float>(dataVariant)
			
		Elseif dataVariant.Type.Name="Int"
		
				Return Cast<Int>(dataVariant)
				
		Else
	
			#If __DEBUG__
				If dataVariant=False Then Print "body-data "+dataName+" for body "+name+" Is Not a 32 bit Numeric (Int,Float) !!!!!!!!!!!!!!!"
			#End
	
		End
	
		Return Null
	
	End
	

	'---------------getbody user data by body--------------------------------------------------------
	
	Method GetBodyUserDataToM:StringMap<Variant>(body:b2Body)
		
		
		Local ret:=Cast<StringMap<Variant>>(body.GetUserData())
		#If __DEBUG__
			If ret=Null Then Print "Body GetUserData returns Null !!!!!!!!!!!!!!!"
		#End
		Return ret

	End
	
	Method GetBodyUserData:Variant(body:b2Body,dataName:String)
		
		Local data:=GetBodyUserDataToM(body)
		
		
		If data<>Null
			If data.Contains(dataName)
				Return data[dataName]
			Else
				#If __DEBUG__
					Print "body has no data called "+dataName+" !!!!!!!!!!!!!!!"
				#End		
			End
		Else
			#If __DEBUG__
				Print "body user data is null !!!!!!!!!!!!!!!"
			#End
		End
		
		Local v:Variant
		Return v

	End
	
	Method GetBodyUserDataToS:String(body:b2Body,dataName:String)
		
		Local data:=GetBodyUserDataToM(body)
		
		
		If data<>Null
			If data.Contains(dataName)
				If data[dataName].Type.Name="String"
					Return Cast<String>(data[dataName])
				Else
					#If __DEBUG__
						Print "body data called "+dataName+" is Not a string !!!!!!!!!!!!!!!"
					#End
				End
			Else
				#If __DEBUG__
					Print "body has no data called "+dataName+" !!!!!!!!!!!!!!!"
				#End		
			End
		Else
			#If __DEBUG__
				Print "body user data is null !!!!!!!!!!!!!!!"
			#End
		End
		
		Return Null

	End
	
	Method GetBodyUserDataToB:Bool(body:b2Body,dataName:String)
		
		Local data:=GetBodyUserDataToM(body)
		
		
		If data<>Null
			If data.Contains(dataName)
				If data[dataName].Type.Name="Bool"
					Local v:=data[dataName]
					Return Cast<Bool>(v)
				Else
					#If __DEBUG__
						Print "body data called "+dataName+" is Not a Bool !!!!!!!!!!!!!!!"
					#End
				End
			Else
				#If __DEBUG__
					Print "body has no data called "+dataName+" !!!!!!!!!!!!!!!"
				#End		
			End
		Else
			#If __DEBUG__
				Print "body user data is null !!!!!!!!!!!!!!!"
			#End
		End
		
		Return Null

	End
	
	Method GetBodyUserDataToF:Float(body:b2Body,dataName:String)
		
		Local data:=GetBodyUserDataToM(body)
		
		
		If data<>Null
			If data.Contains(dataName)
				If data[dataName].Type.Name="Float"
					Return Cast<Float>(data[dataName])
				Else
					#If __DEBUG__
						Print "body data called "+dataName+" is Not a Float !!!!!!!!!!!!!!!"
					#End
				End
			Else
				#If __DEBUG__
					Print "body has no data called "+dataName+" !!!!!!!!!!!!!!!"
				#End		
			End
		Else
			#If __DEBUG__
				Print "body user data is null !!!!!!!!!!!!!!!"
			#End
		End
		
		Return Null

	End
	Method GetBodyUserDataToI:Int(body:b2Body,dataName:String)
		
		Local data:=GetBodyUserDataToM(body)
		
		
		If data<>Null
			If data.Contains(dataName)
				If data[dataName].Type.Name="Int"
					Return Cast<Int>(data[dataName])
				Else
					#If __DEBUG__
						Print "body data called "+dataName+" is Not an int !!!!!!!!!!!!!!!"
					#End
				End
			Else
				#If __DEBUG__
					Print "body has no data called "+dataName+" !!!!!!!!!!!!!!!"
				#End		
			End
		Else
			#If __DEBUG__
				Print "body user data is null !!!!!!!!!!!!!!!"
			#End
		End
		
		Return Null

	End
	
	Method GetBodyUserDataToN:Float(body:b2Body,dataName:String)
		
		Local data:=GetBodyUserDataToM(body)
		
		If data<>Null
			If data.Contains(dataName)
				If data[dataName].Type.Name="Int"
					Local i:= Cast<Int>(data[dataName])
					Return i
				Elseif data[dataName].Type.Name="Float"
					Return Cast<Float>(data[dataName])
				Else
					#If __DEBUG__
						Print "body data called "+dataName+" is Not a Number (int or float) !!!!!!!!!!!!!!!"
					#End
				End
			Else
				#If __DEBUG__
					Print "body has no data called "+dataName+" !!!!!!!!!!!!!!!"
				#End		
			End
		Else
			#If __DEBUG__
				Print "body user data is null !!!!!!!!!!!!!!!"
			#End
		End
		
		Return Null

	End
	
	
End