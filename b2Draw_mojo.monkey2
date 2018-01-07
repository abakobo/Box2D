Namespace box2d


Public
'
' This is the debugDrawer. It can be called by your world class and you have to implement it by yourself...
'
'Global b2_GLOBAL_canvas:Canvas


Global b2_GLOBAL_canvas:Canvas


Class b2Draw_mojo Extends b2Draw

	Field scale:=10.0
	Field viewpoint:=New b2Vec2(0,0)
	'Field canvas_ptr:Canvas Ptr 'a pointer is used because adding a class as a field generates a "gcMark" error !!!!!!!! to be reported on mx2 github/forum  !!!!!!!
	Field w:=640
	Field h:=480
	Field y_axis_direction:=-1 'to invert y axis for screen draw (supposed to be 1 or -1 only)
	
	'Field e_shape:Bool,eaabb:Bool
	
	Method SetCanvas(cnv:Canvas)
		b2_GLOBAL_canvas=cnv
		w=b2_GLOBAL_canvas.Viewport.Width
		h=b2_GLOBAL_canvas.Viewport.Height
	End

	Method GetCanvasViewport()
		w=b2_GLOBAL_canvas.Viewport.Width
		h=b2_GLOBAL_canvas.Viewport.Height
	End
	
	Method SetCamera(view:b2Vec2,scl:Float)
		scale=scl
		viewpoint=view
	End
	
	Method CanvasToPhysics:b2Vec2(mouse:Vec2i)
		Local loc:b2Vec2
		loc.x=((mouse.x-w/2.0)/scale)+viewpoint.x
		loc.y=((mouse.y-h/2.0)/scale*y_axis_direction)+viewpoint.y
		Return loc
	End
	
	Method PhysicsToCanvas:Vec2f(loc:b2Vec2)
		Local point:Vec2f
		
		'loc.x=((point.x-w/2.0)/scale)+viewpoint.x
		 'loc.x=((point.x-(w/2.0))/scale)+viewpoint.x
		 'point.x=((w/2.0)/scale-viewpoint.x+loc.x)*scale
		point.x=(w/2.0)+scale*(loc.x-viewpoint.x)
		
		
		'loc.y=((point.y-h/2.0)/scale*y_axis_direction)+viewpoint.y
		point.y=(h/2.0)+scale*y_axis_direction*(loc.y-viewpoint.y)
		
		
		Return point
	End
	
	Method DrawCircle(center:b2Vec2,radius:Float,color:b2Color) Override
		'it's drawing a solid circle.... should be modified (does mojo have empty circle?) > won't do it because it's for chains and some joints only..
		Local cx:=(w/2.0)+(scale*(center.x-viewpoint.x))
		Local cy:=(h/2.0)+y_axis_direction*(scale*(center.y-viewpoint.y))
		b2_GLOBAL_canvas.Color = New Color(color.r,color.g,color.b)
		'b2_GLOBAL_canvas.Color = Color.Red
		b2_GLOBAL_canvas.DrawCircle(cx,cy,radius*scale)
	End
	Method DrawSolidCircle(center:b2Vec2,radius:Float,axis:b2Vec2,color:b2Color) Override
		Local cx:=(w/2.0)+(scale*(center.x-viewpoint.x))
		Local cy:=(h/2.0)+y_axis_direction*(scale*(center.y-viewpoint.y))
		b2_GLOBAL_canvas.Color = New Color(color.r,color.g,color.b)
		b2_GLOBAL_canvas.DrawCircle(cx,cy,radius*scale)
		b2_GLOBAL_canvas.Color = New Color(color.r/2.0,color.g/2.0,color.b/2.0)
		b2_GLOBAL_canvas.DrawLine(cx,cy,cx+axis.x*scale*radius,cy+y_axis_direction*axis.y*scale*radius)
	End
	Method DrawPolygon(vertices:b2Vec2 Ptr, vertexCount:int, color:b2Color) Override

		b2_GLOBAL_canvas.Color = New Color(color.r,color.g,color.b)
		
    		Local v:=New Float[vertexCount*2]
    		Local i:Int
    		Local l:=vertexCount-1
    		For i=0 To l
    			v[i*2]=w/2.0+(vertices[i].x-viewpoint.x)*scale
    			v[i*2+1]=h/2.0+y_axis_direction*(vertices[i].y-viewpoint.y)*scale
    		Next
    		For i=1 To l
    			b2_GLOBAL_canvas.DrawLine(v[(i-1)*2],v[(i-1)*2+1],v[i*2],v[i*2+1])
    		Next
    		i=l
    		b2_GLOBAL_canvas.DrawLine(v[0],v[1],v[i*2],v[i*2+1])
	End
    Method DrawSolidPolygon(vertices:b2Vec2 Ptr, vertexCount:int, color:b2Color) Override
    
		b2_GLOBAL_canvas.Color = New Color(color.r,color.g,color.b)
		
    	Local v:=New Float[vertexCount*2]
    		For Local i:=0 To vertexCount-1
    			v[i*2]=w/2.0+(vertices[i].x-viewpoint.x)*scale
    			v[i*2+1]=h/2.0+y_axis_direction*(vertices[i].y-viewpoint.y)*scale
    		Next
    		b2_GLOBAL_canvas.DrawPoly(v)
    End
    Method DrawSegment(p1:b2Vec2, p2:b2Vec2, color:b2Color) Override
    	b2_GLOBAL_canvas.Color = New Color(color.r,color.g,color.b)
    	Local p1x:=(w/2.0)+(scale*(p1.x-viewpoint.x))
		Local p1y:=(h/2.0)+y_axis_direction*(scale*(p1.y-viewpoint.y))
		Local p2x:=(w/2.0)+(scale*(p2.x-viewpoint.x))
		Local p2y:=(h/2.0)+y_axis_direction*(scale*(p2.y-viewpoint.y))
    	b2_GLOBAL_canvas.DrawLine(p1x,p1y,p2x,p2y)
    End
    Method DrawTransform(xf:b2Transform) Override
		Local x:=(w/2.0)+(scale*(xf.p.x-viewpoint.x))
		Local y:=(h/2.0)+y_axis_direction*(scale*(xf.p.y-viewpoint.y))
		b2_GLOBAL_canvas.Color = Color.Red
		b2_GLOBAL_canvas.DrawCircle(x,y,0.08*scale)
		Local x2:=x+0.05*scale*xf.q.c
		Local y2:=y+0.05*scale*y_axis_direction*xf.q.s
		b2_GLOBAL_canvas.Color = Color.Black
		b2_GLOBAL_canvas.DrawLine(x,y,x2,y2)
    End
    Method DrawPoint(p:b2Vec2,size:Float,color:b2Color) Override
		Local px:=(w/2.0)+(scale*(p.x-viewpoint.x))
		Local py:=(h/2.0)+y_axis_direction*(scale*(p.y-viewpoint.y))
		b2_GLOBAL_canvas.Color = New Color(color.r,color.g,color.b)
		b2_GLOBAL_canvas.DrawCircle(px,py,size)
	End
End