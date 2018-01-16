Namespace b2dPyro2

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"
#Import "b2Draw_Pyro.monkey2"
#Import "<pyro-scenegraph>"																				' Import pyro scene.

Using std..
Using mojo..
Using pyro.framework..
Using pyro.scenegraph..
Using box2d..

Function Createb2LayerSprites:LayerSprite[](layer:Layer,bodyInfos:b2BodyImageInfo[],scalef:Float,inverted_y_axis:Bool=True)
	
	Local ret:=New LayerSprite[bodyInfos.Length]
	'y axis inversion management
	Local sign:Int=-1
	Local countBodiesWithImage:=0
	If inverted_y_axis=False Then sign=1
	
	For Local i:= 0 Until bodyInfos.Length

			ret[i]=New LayerSprite( layer, bodyInfos[i].image )
			ret[i].Location=b2Vec2ToVec2f(bodyInfos[i].imageWorldPosition)*(New Vec2f(scalef,sign*scalef)) '-for y axis inversion RUBE using standart coordinates system
			ret[i].Rotation=sign*bodyInfos[i].imageWorldAngle '-for y axis inversion due to RUBE using standart coordinates system
			ret[i].Scale=bodyInfos[i].imageRenderScale*New Vec2f(scalef,scalef)


	Next
	
	Return ret
	
End	

Function Updateb2LayerSprites(sprites:LayerSprite[],bodyInfos:b2BodyImageInfo[],scalef:Float,inverted_y_axis:Bool=True)
	
	Local sign:Int=-1
	If inverted_y_axis=False Then sign=1
	
	For Local i:= 0 Until bodyInfos.Length
		
		sprites[i].Location=b2Vec2ToVec2f(bodyInfos[i].imageWorldPosition)*(New Vec2f(scalef,sign*scalef)) 'sign for y axis inversion RUBE using standart coordinates system
		sprites[i].Rotation=sign*bodyInfos[i].imageWorldAngle' sign for y axis inversion RUBE using standart coordinates system
		sprites[i].Scale=bodyInfos[i].imageRenderScale*New Vec2f(scalef,scalef)


	Next
	

	
End	

Class Camera Extension
	Method SetByCenterViewpoint(viewpoint:Vec2f,zoom:Float,rotation:Float,vResolution:Vec2f)
		
		RotationPoint=vResolution/2
		ZoomPoint=vResolution/2
		Location=viewpoint-(vResolution/2)
		
		Rotation=rotation
		Zoom=zoom		
	End
	
	Method GetMatrix:AffineMat3f(mat:AffineMat3f=New AffineMat3f())
	
			
			'_offset.x=width*_scale.x*.5-VirtualWidth*.5
			'_offset.y=height*_scale.y*.5-VirtualHeight*.5
			'mat=mat.Translate( -_offset )
	
			mat=mat.Scale( Scale )
			
			mat=mat.Translate( RotationPoint)
			mat=mat.Rotate( Rotation*EngineBehaviour.RotationMode )
			mat=mat.Translate( -RotationPoint )
	
			mat=mat.Translate( ZoomPoint )
			mat=mat.Scale( Zoom,Zoom )
			mat=mat.Translate( -ZoomPoint)
			
			mat=mat.Translate( -Location )
	
			Return mat
	
	End
	
	Method TransformCanvas(cnv:Canvas)
		
					cnv.Scale( Scale )
					
					cnv.Translate( RotationPoint)
					cnv.Rotate( Rotation*EngineBehaviour.RotationMode )
					cnv.Translate( -RotationPoint )
			
					cnv.Translate( ZoomPoint )
					cnv.Scale( Zoom,Zoom )
					cnv.Translate( -ZoomPoint)
					
					cnv.Translate( -Location )
					
	End
	
End