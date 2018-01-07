Namespace b2dPyro2

#Import "<std>"
#Import "<mojo>"

#Import "../box2d.monkey2"
#Import "b2Draw_mojo.monkey2"
#Import "<pyro-scenegraph>"																				' Import pyro scene.

Using std..
Using mojo..
Using pyro.framework..
Using pyro.scenegraph..
Using box2d..



Class Camera Extension
	Method SetByCenterViewpoint(viewpoint:Vec2f,zoom:Float,rotation:Float,vResolution:Vec2f)
		
		RotationPoint=vResolution/2
		ZoomPoint=vResolution/2
		Location=viewpoint-(vResolution/2)
		
		Rotation=rotation
		Zoom=zoom		
	End
End