
!!! All "Step" and "step" Method/fields are replaced by "Stepp" and "stepp" because "Step"/"step" is a reserved Monkey2 keyword
-------------------------------------------------------------------------------------------------------------------------------

This binding is planned to become a module but for now it's not...

to use it copy the (first) box2d folder to your .monkey2 main file directory (like the HelloBox2D**** demos

-------
-Box2D-
-------
to import box2d:

<code>
\#Import "box2d/box2d.monkey2"
</code>

you must be using these namespaces:

<code>Using std..</code>

<code>Usind box2d..</code>

This will give you the pure Box2d without a b2Draw implementation (see HelloBox2D_text.monkey2)

--------
-b2Draw-
--------

a b2Draw for mojo is implemented. (class b2_Draw_mojo) To import it:

<code>
\#import "box2d/b2Draw_mojo.monkey2"
</code>

and

<code>
Using mojo..
</code>

To pass the mojo canvas to your b2Draw_mojo instance you have to call the SetCanvas(cnv:Canvas) Method 

It has to be called before a world.DrawDebugData() call

There is also a SetCamera(viewpoint:b2Vec2,scale:Float) Method. It allows you to move and zoom the view. You can acces the fields directly too: b2_Draw_mojo.viewpoint and b2_Draw_mojo.scale. The viewpoint is the center point of camera in the physics world.


a typical code:

in your New method:

<code>DDrawer=New b2Draw_mojo</code>

<code>world.SetDebugDraw( DDrawer )</code>

<code>DDrawer.SetFlags( e_shapeBit | e_jointBit )</code>

<code>DDrawer.SetCamera(New b2Vec2(0,0),40)</code>

in your OnRender:

<code>world.Stepp(timeStep, velocityIterations, positionIterations)</code>
	
<code>DDrawer.SetCanvas(canvas)</code>

<code>DDrawer.SetCamera(center,zoom)</code>
  
<code>world.DrawDebugData()</code>

See HelloBox2D_mojo.monkey2 for a working simple example


differentces between original Box2D and this Monkey2 version:
--------------------------------------------------------------

!!! All "Step" and "step" Method/fields are replaced by "Stepp" and "stepp" because "Step"/"step" is a reserved Monkey2 keyword

b2Draw.h has been modified and all passing by reference have been replaced by passing by value (mx2 can't pass by reference to extended virtual externals)

