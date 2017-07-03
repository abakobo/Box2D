#Import "<std>"

Using std..

	Global objindex:=New StringMap<String>
	Global extendedstructsindex:=New StringMap<String>

	Global doccing:=false
	Global debuge:=false

	Global header:String
	Global inclass:=0
	Global isPublic:=False
	Global inDocs:=0
	Global pretrim:String
	Global inprivate:=False
	Global classname:=""
	Global privbrack:=0
	Global line:String
	Global tru:=True
	Global fals:=false
	Global bracklevel:=0
	Global output:String="'imports"
	


Function DecodeCHeader(path:String)
	
	'init globals
	inclass=0
	isPublic=False
	inDocs=0
	inprivate=False
	classname=""
	privbrack=0
	pretrim=""
	line=""
	bracklevel=0

	header=LoadString(path)
			
	For line=Eachin header.Split("~r~n")
		'output+="~r~n"+ "------------------------------------"
		'output+="~r~n"+ ">>"+line
		
		'template T cleaner
		
		'If line.Find("enum")>-1 Then Print "-------------------------------------------------------------------------------"
		'Print line
		
		
		If line.Trim().StartsWith("'")
			output+="~r~n"+line
			Continue
		Endif
		
		line=line.Replace("template <typename T> ","")
		line=line.Replace("template<typename T> ","")
		
		If line.Find("{")>-1 And Not line.Trim().StartsWith("/") Then bracklevel+=1
		If line.Find("}")>-1 And Not line.Trim().StartsWith("/") Then bracklevel-=1
		
		
		pretrim=line.Trim()
		'private skipper
		If privator() continue
		' copy docs to #rem monkeydoc
		If remsor() continue
		' les autres skips
		If definor() continue
		If skipor() continue
		
		If line.Find("[")>-1 output+="~r~n'------Ya du array à gérer ici!"
				
		'Les fonction (inline) (check si y djah un methode à faire plus tard) y aurait moyen de 
		'If inlineor() Continue
		'fonction sans inline
		If functionor() continue
		'classor
		If classorstructor() continue
		' du traitement de netoyage et autres
		Local semi:=line.Find(";")
		If semi>0 line=line.Slice(0,semi)
		line=line.Trim()
		line=line.Replace("const ","")
		line=line.Replace(" const ","")
		If inclass
			If line="{" 
				inclass+=1
				Continue
			Endif
			If line="}" 
				inclass-=1
				Continue
			Endif
		Endif
		' inclass analyse
		If inclassor() Continue
	Next
			
End

Function ListHeaders(filepath:String, ext:String)
	Local files:=LoadDir(filepath)
	For Local file:=Eachin files
		Local path:=filepath+"/"+file
		Select GetFileType(path)		
			Case FileType.File			
				If file.EndsWith(ext)
					output+="~r~n"+ "'-------------------------------------------------------------------"
					output+="~r~n"+ "'"+path
					output+="~r~n"+ "'-------------------------------------------------------------------"		
					DecodeCHeader(path)
				Endif				
			Case FileType.Directory
				ListHeaders(path,ext)				
		End
	Next
	
End
Function ListObjects(filepath:String, ext:String)
	Local files:=LoadDir(filepath)
	For Local file:=Eachin files
		Local path:=filepath+"/"+file

		Select GetFileType(path)		
			Case FileType.File			
				If file.EndsWith(ext)		
					listobjects(path)
				Endif				
			Case FileType.Directory
				ListObjects(path,ext)				
		End
	Next
	
End

Function Listcomas(filepath:String, ext:String)
	Local files:=LoadDir(filepath)
	For Local file:=Eachin files
		Local path:=filepath+"/"+file

		Select GetFileType(path)		
			Case FileType.File			
				If file.EndsWith(ext)
					output+="'-------------------------------------------------------------------"+"~r~n"
					output+="'"+path+"~r~n" 
					output+="'-------------------------------------------------------------------"+"~r~n"		
					concator(path)
				Endif				
			Case FileType.Directory
				Listcomas(path,ext)				
		End
	Next
	
End


Function ListImports(filepath:String, ext:String)
	Local files:=LoadDir(filepath)
	For Local file:=Eachin files
		Local path:=filepath+"/"+file
		Select GetFileType(path)		
			Case FileType.File			
				If file.EndsWith(ext)		
					Local subpath:=path.Slice(2)
					output+="~r~n"+ "#Import ~q"+subpath+"~q"				
				Endif				
			Case FileType.Directory
				ListImports(path,ext)				
		End
	Next
End

Function definor:bool()
	Local tempoline:=line
	tempoline.Trim()
	If tempoline.StartsWith("#define") And Not tempoline.EndsWith("_H")
		output+="~r~n"+ "'-----ALIAS(orconst)!?: "+line
		Return true
	End
	If tempoline.StartsWith("const")
		output+="~r~n"+ "'-----const: "+line
		Return True
	end
	return false
End

Function classorstructor:Bool()
			If line.StartsWith("class ") And Not line.EndsWith(";")
				Local splitlines:=line.Split(" ")
				classname=splitlines[1]
				objindex.Add(classname,"class")
				If line.Find("public")>-1
					line=line.Replace(": public", "extends")
				Else
					line=line+" extends void"
				End
				
				output+="~r~n"+ line
				inclass=1
				If classname="b2Shape"
					output+="~r~n~tEnum Type"
					output+="~r~n~t~te_circle,e_edge,e_polygon,e_chain,e_typeCount"
					output+="~r~n~tEnd"
				end
				Return true
			Endif
			
			If debuge output+="~r~n"+ "'----------Class passé"
				
			If line.StartsWith("struct ") And Not line.EndsWith(";")
				Local splitlines:=line.Split(" ")
				classname=splitlines[1]
				objindex.Add(classname,"struct")
				
				If line.Find("public")>-1
					'line=line.Replace(": public", "extends") 'ICI GROS bordel parceque strust peut pas extend !!!!!!!!!!!!!!!
					Local tempylines:=line.Split(": public")
					line=tempylines[0]
					extendedstructsindex.Add(classname,tempylines[1].Trim())
					'Print classname+" extends "+tempylines[1].Trim()
					
				Else
					'mapper le johny pour pouvoir copier dans les extends
				End
				output+="~r~n"+ line
				If classname="b2TOIOutput"
					output+="~r~n~tEnum State"
					output+="~r~n~t~te_unknown,e_failed,e_overlapped,e_touching,e_separated"
					output+="~r~n~tEnd"
				elseIf classname="b2Manifold"
					output+="~r~n~tEnum Type"
					output+="~r~n~t~te_circles,e_faceA,e_faceB"
					output+="~r~n~tEnd"
				elseIf classname="b2ContactFeature"
					output+="~r~n~tEnum Type"
					output+="~r~n~t~te_vertex,e_face"
					output+="~r~n~tEnd"
				end
				inclass=1
				Return true
			Endif
			If line.StartsWith("};") And inclass
				inclass-=1
				If inclass=1 
					output+="~r~n"+ "end~n"
					inclass=0
				Endif
			Endif
			Return false
End
Function listobjects(path:string)

		header=LoadString(path)
		
		For line=Eachin header.Split("~r~n")
			If line.StartsWith("class ") And Not line.EndsWith(";")
				Local splitlines:=line.Split(" ")
				classname=splitlines[1]
				objindex.Add(classname,"class")
				If line.Find("public")>-1
					line=line.Replace(": public", "extends")
				Else
					line=line+" extends void"
				End

			Endif
			

				
			If line.StartsWith("struct ") And Not line.EndsWith(";")
				Local splitlines:=line.Split(" ")
				classname=splitlines[1]
				objindex.Add(classname,"struct")
				If line.Find("public")>-1
					line=line.Replace(": public", "extends") 'ICI GROS bordel parceque strust peut pas extend !!!!!!!!!!!!!!!
				Else
					'mapper le johny pour pouvoir copier dans les extends
				End
			Endif


		Next
end
Function concator(path:string)

		header=LoadString(path)
		
		For line=Eachin header.Split("~r~n")
			If line.Trim().EndsWith(",")
				output+=line	
			Else
				output+=line+"~r~n"
			End

		Next
end
Function inclassor:Bool()
			If inclass=2 And line.Length
				
				Local hasgenerics:=False
				Local isoperator:=False
				Local isvirtual:=false
				Local isoverride:=false
				
				If line.StartsWith("///")
					If doccing output+="~r~n"+ "!!!!!!!!!!!!!!Docs trainent"
					Return true 
				end
				If line.Find("<typename T>")>-1 Return true
				'skippe operateurs
				If line.Find(" operator ")>-1
					isoperator=true
					output+="~r~n"+ "'!!!!!!operator skipped!! line: "+line
					Return true
				End
				If line.StartsWith("static ")
					'output+="~r~n"+ "'--------------------------Static removed"
					line=line.Slice(7)
				End
				
				If line.StartsWith("#") Return true
				
				If line="public:" Return true
							
				If line.StartsWith("virtual ")
					line=line.Slice(8)
					isvirtual=True
				End
				
				If line.Find("override")>-1
					isoverride=True
				end
				
				'tranforme new cpp en new mx2
				Local templine:=""
				If line.StartsWith(classname) And line.Find("(")>0 Then templine=line.Replace(classname,"")
		
					
				If (templine.StartsWith("(") Or templine.StartsWith(" (") )
					
					line=line.Replace(classname,"µùµùµùµ")
					line=line.Slice(7)
					line="void New"+line
					line=line.Replace("µùµùµùµ",classname)
					
				End
				If line.StartsWith("~~"+classname) And line.Find("(")>0
					output+="~r~n"+ "~tMethod Destroy() Extension=~qdelete~q"
					Return true
				End
				

				
				Local s:Int=line.Find(" ")
				Local b0:Int=line.Find("(")
				Local b1:Int=line.Find(")")
				
				If b0>0
					If s>0	
									
						Local t:String=line.Slice(0,s)
						Local f:String=line.Slice(s+1,b0)
						t.Replace("int32","Int")
						t.Replace("float32","Float")
						t.Replace("uint8","Byte")
						t.Replace("int32","Int")
						' transformation de ptr si class pas de ptr, sinon le ptr reste
						Local tempt:=t
						tempt=tempt.Replace("*","")
						tempt=tempt.Replace("&","")
						tempt=tempt.Trim()
						'output+="~r~n"+ "inclass tempc: "+tempt+" is a "+objindex.Get(tempt)
						If tempt="T" then hasgenerics=true
						
						If objindex.Get(tempt)="class"
							 t=t.Replace("*","")
						Else
							t=t.Replace("*"," Ptr")
						End
						If t.Find("&")>-1 And objindex.Get(tempt)<>"class" output+="~r~n"+ "'!!!!! Folowing method is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!" 
						t=t.Replace ("&","")
						If t="void" t="" Else t=":"+t
						
						Local args:=New List<String>
		
						Local b:String=line.Slice(b0+1,b1)
						For Local a:=Eachin b.Split(",")
						
							a=a.Trim()
							
							If a="" Continue
							
							Local arrytemp:=""
							
							Local p:=a.Find(" ")
							Local c:=a.Slice(0,p)
							Local n:=a.Slice(p+1)
							' transformation de ptr si class pas de ptr, sinon le ptr reste
							Local tempc:=c
							tempc=tempc.Replace("*","")
							tempc=tempc.Replace("&","")
							tempc=tempc.Trim()
							'output+="~r~n"+ "inclass tempc: "+tempc+" is a "+objindex.Get(tempc)
							If objindex.Get(tempc)="class"
								 c=c.Replace("*","")
							else
								c=c.Replace("*"," Ptr")
							End
							
						
							If n.Find("[")>-1
								n=n.Slice(0,n.Find("["))
								arrytemp=" Ptr"
								output+="~r~n'--- "+n+" is actualy an array, a extension/override could be cool"
							end
							
							
							c=c.Replace("&","")
							
							If c="T" Or c="T Ptr" Then hasgenerics=true
							
							c=c.Replace("int32","Int")
							c=c.Replace("float32","Float")
							c=c.Replace("uint8","Byte")
							c=c.Replace("int32","Int")
	
							args.AddLast(n+":"+c+arrytemp)
						
						Next
						
						If Not hasgenerics
							output+="~r~n"+ "~tMethod "+f+t+"("+args.Join(",")+")"
							If isvirtual output+=" virtual"
							If isoverride output+=" override"
						Else
							output+="~r~n"+ "~t'Method "+f+t+"("+args.Join(",")+")"+" This method Has generics!!!!!!!!!!!!!!!!"
							If isvirtual output+=" virtual"
							If isoverride output+=" override"
						end
					
					Endif
				Else				
					If s>0
						Local t:String=line.Slice(0,s)
						Local f:String=line.Slice(s+1)

		'					t=t.Trim()
							Local temptyp:=t.Replace("*","")
							If temptyp="enum" Return true

							If objindex.Get(temptyp)="class"
								t=t.Replace("*","")
							Else
								t=t.Replace("*"," Ptr")
							end
							
							'If t="void" t="" Else t=":"+t
								
							t=t.Replace("int32","Int")
							t=t.Replace("float32","Float")
							t=t.Replace("uint8","Byte")
							t=t.Replace("int32","Int")
							t=t.Replace("void*","Void ptr")
							If t="void" Print "---VOIDD Pas Bon!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---"+line
							t=":"+t
							'If t="void" t="" Else t=":"+t
							
						If f.Find(",")=-1
							Local arrytemp:=""
							If f.Find("[")>-1
								f=f.Slice(0,f.Find("["))
								arrytemp="[]"
							end
							output+="~r~n"+ "~tField "+f+t+arrytemp
						Else
							output+="~r~n'-----------------------------------Multiple Fields"
							Local fsplit:=f.Split(",")				
							For Local tif:=Eachin fsplit
								tif=tif.Trim()
								Local arrytemp:=""
								If tif.Find("[")>-1
									tif=tif.Slice(0,tif.Find("["))
									arrytemp="[]"
								end
								output+="~r~n"+ "~tField "+tif+t+arrytemp
							next
						endif
					Endif
				Endif
				
				
	'			output+="~r~n"+ "~t"+line
				If debuge output+="~r~n"+ "finfin d'if"
			
			Endif
	Return false
End
Function skipor:bool()
			If pretrim.StartsWith("/") 	Return true
			If pretrim.StartsWith("*") 	Return true
			If pretrim.StartsWith("#") 	Return true
			
			If pretrim.StartsWith("extern") 	Return true 'passe version et b2vec2_zero seulement
			
			If debuge output+="~r~n"+ "autres skpissssssssssss passé"
				
			Return false
end

Function remsor:bool()
			If pretrim.StartsWith("///") And doccing
				If inDocs=0
					inDocs=1
					pretrim=pretrim.Replace("///","#rem monkeydoc")
					If inclass>0 pretrim="~t"+pretrim
						pretrim="~n"+pretrim
					output+="~r~n"+ pretrim
					Return true
				Else
					pretrim=pretrim.Replace("///","")
					If inclass>0 pretrim="~t"+pretrim
					output+="~r~n"+ pretrim
						Return true
				End
			Else
				If inDocs>0
					inDocs=0
					If inclass>0
						output+="~r~n"+ "~t#End"
					Else
						output+="~r~n"+ "#End"
					End
					'pas de continue ici vu qu'il faut encore analyser la ligne...
				End
			End
			' quand le /// est pas au début mais dans la ligne
			If pretrim.Find("///")>0 And Not pretrim.StartsWith("///")
				If debuge output+="~r~n"+ "Splittttttttttttttttttttttttttttttttttttttttttt/////////////////////////: "
				Local splitlines:=line.Split("///")
				If doccing And splitlines.Length>1
					splitlines[1].Replace("<","")
					output+="~r~n"+ "~n#rem monkeydoc "+splitlines[1]
					output+="~r~n"+ "#end"
				Endif
				line=splitlines[0]
			Endif
			' quand ça commence avec //
			If pretrim.StartsWith("//") 	Return True
			' quand ya // après la ligne
			If pretrim.Find("//")>-1
				Local splitlines:=line.Split("//")
				line=splitlines[0]
			Endif
			Return False
End 

Function functionor:Bool()
			If line.Find("(")>0 And line.Find("::")=-1 And bracklevel=0
				'output+="~r~n"+ "'-----------------------------Some global func?"
				If line.StartsWith("static ")
					'output+="~r~n"+ "'--------------------------Static removed"
					line=line.Slice(7)
				End
				If line.StartsWith("inline ")
					'output+="~r~n"+ "'--------------------------inline removed"
					line=line.Slice(7)
				end
				
				If line.StartsWith("Templatorrrrrrrrrrrrrrrrrrr ") 'ancien detecteur de generics T
					output+="~r~n"+ "func t"
					
				Else
					Local hasgenerics:=False
					Local isoperator:=false
	
					line=line.Replace("const ","")
					line=line.Replace(" const ","")
					'line=line.Replace("&","")
					
					Local s:Int=line.Find(" ")
					Local b0:Int=line.Find("(")
					Local b1:Int=line.Find(")")
					
					If b0>0
						If s>0				
							Local t:String=line.Slice(0,s)
							Local f:String=line.Slice(s+1,b0)
							If t="T"
								'output+="~r~n"+ "'Function "+f+" is with generics"
								hasgenerics=True
								'Continue
							Else If f.Find("operator")>-1
								 'output+="~r~n"+ "'Function "+t+" Opeerator"
								 isoperator=true
								'Continue
							End
							t.Replace("int32","Int")
							t.Replace("float32","Float")
							t.Replace("uint8","Byte")
							t.Replace("int32","Int")
							
							Local tempt:=t
							tempt=tempt.Replace("*","")
							tempt=tempt.Replace("&","")
							tempt=tempt.Trim()
							'output+="~r~n"+ "inclass tempc: "+tempt+" is a "+objindex.Get(tempt)
							If objindex.Get(tempt)="class"
								 t=t.Replace("*","")
							else
								t=t.Replace("*"," Ptr")
							End
							If t.Find("&")>-1 And objindex.Get(tempt)<>"class" output+="~r~n"+ "'!!!!! Folowing function is returning reference to a non ref based variable (but & removed) (you may need pointer)!!!!!!!" 
							t=t.Replace ("&","")
							If t="void" t="" Else t=":"+t
					
							Local args:=New List<String>
					
							Local b:String=line.Slice(b0+1,b1)
							For Local a:=Eachin b.Split(",")
								Local arrytemp:=""
				
								a=a.Trim()
					
								If a="" Continue
					
								Local p:=a.Find(" ")
								Local c:=a.Slice(0,p)
								Local n:=a.Slice(p+1)
								
								If n.Find("[")>-1
									n=n.Slice(0,n.Find("["))
									arrytemp=" Ptr"
									output+="~r~n'--- "+n+" is actualy an array, a extension/override could be cool"
								end
					
								Local tempc:=c
								tempc=tempc.Replace("*","")
								tempc=tempc.Replace("&","")
								tempc=tempc.Trim()
								'output+="~r~n"+ "inclass tempc: "+tempc+" is a "+objindex.Get(tempc)
								If objindex.Get(tempc)="class"
									 c=c.Replace("*","")
								else
									c=c.Replace("*"," Ptr")
								End
								c=c.Replace("&","")
								
								If c="T" Or c="T Ptr" Then hasgenerics=true
								c.Replace("int32","Int")
								c.Replace("float32","Float")
								c.Replace("uint8","Byte")
								c.Replace("int32","Int")
					
								args.AddLast(n+":"+c+arrytemp)
					
							Next
							If Not hasgenerics And Not isoperator
								output+="~r~n"+ "Function "+f+t+"("+args.Join(",")+")"
								Return true
							Elseif isoperator
								output+="~r~n"+ "'Function "+t+" Opeerator"
								Return true
							Else
								output+="~r~n"+ "'Function "+f+" is with generics"
								Return true 
							end
					
						Endif
					Endif
	'				
				End
			End
			Return false
end

Function privator:bool()
			If pretrim.StartsWith("private") Or pretrim.StartsWith("protected")
				inprivate=True
				Return true
			End
			
			If inprivate
				If pretrim.StartsWith("public")
					output+="~r~n"+ ("public")
					inprivate=False
					Return true
				Elseif pretrim.StartsWith("{")
					privbrack+=1
				Elseif pretrim.StartsWith("}")
					If privbrack>0
						privbrack-=1
					Else 'les braces sont fermés à l'intérieur donc fin decl de class/struct
						inprivate=False
					End
				Else
					Return true
				endif
			Endif
			Return false
End

Function passstructextends(path:string)
	
	header=LoadString(path)
	'Print header
	
	For line=Eachin header.Split("~r~n")
		output+=line+"~r~n"
		If line.StartsWith("struct ")
			
			Local templine:=line.Replace("struct ","")
			templine=templine.Trim()
			
			For Local n:=Eachin extendedstructsindex
				If n.Key=templine 'on est a la ligne de déclaration de la struct étendue

					Local inbasestruct:=False
					Local tempoutput:="~r~n"
					For Local linebis:=Eachin header.Split("~r~n")
						
						
						If linebis.StartsWith("struct "+n.Value)
							'Print n.Value+" detected for"+ n.Key
							inbasestruct=True
							continue
						End
						If inbasestruct And Not (linebis.StartsWith("end") Or linebis.StartsWith("End"))
							'Print linebis
							tempoutput+=linebis+"~r~n"
						end
						If inbasestruct And ( linebis.StartsWith("end") Or linebis.StartsWith("End"))
							inbasestruct=False
							'Print n.Value+" ended"
							exit
						End
					Next
					'Print tempoutput
					output+=tempoutput
					exit
				end
			next
		end
	Next

End

Function Main()
	output+="~r~n"+ "'ListImports v0.03 (based on v0.01 by nitrologic)"
	ChangeDir("C:\Users\W7Son\Desktop\box2dGit\box2d\Box2D\Box2D")
	ChangeDir("C:\Users\W7Son\Dropbox\mx2\learn_monkey2\externs\mayday")
	'ChangeDir("C:\shorth\Day")
	'ListImports(".",".cpp")
	ListObjects(".",".h")
	
	output=""
	Listcomas(".",".h")

	SaveString(output,"importsnocomasepar.temph")
	
	output=""
	ListHeaders(".",".temph")
	SaveString(output,"imports.monkey2")
	
	output=""
	passstructextends("imports.monkey2")
	
	output+="~r~n"
	Local enums:=LoadString("box2dEnums.monkey2")
	'Print enums
	output+=enums
	output+="~r~n"
	output+="~r~n"
	SaveString(output,"importspass2.monkey2")
	
	For Local nude:=Eachin extendedstructsindex
		Print nude.Key+" -- "+nude.Value	
	Next


End