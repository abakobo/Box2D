doing:

AABB box pour DDraw que ça dessine pas le bazar..  (mm chose pour pyro?, il le fait déjà?)
e7-AABB_callback2 line 112

TODO
-----
b2json:
--------


ajouter offset à b2Manager
offest json existing world dans mx2b2json et b2Manager


checker que imageWorldPosition fonctionne correc avec yAxisInvert=False  checker avec draw bodies aussi...
donc faire un exemple yaxisNonInversé avec images!

ajouter velocityiteration etc.. Est-ce que y a moyen de changer ça dans RUBE? -> question posée.

cleanup the mess!:
	-virer b2djsonImage
	-virer cpp fileio et bitmap render...
	


trouver ce qui Print du vide dans e0-load_delete -->seulement en debug donc +-ok

pyro:
--------


AABB box pour DDraw que ça dessine pas le bazar..  (mm chose pour pyro?, il le fait déjà?)

ajouter opacity et flip dans pyro2.CreatLayerSprites

ajouter offset à Extension camera.GetMatrix ???? playniax?

colision pyro entre 2 layers?

Isort pour exempl tank (et plus multi layers) + enlever les autres Functions de la foire(Create/Updateb2LayerSprites)  -->1/2



pure box2d:
----------

créer resource Extends pour gérer les call backs?

checker que Double dans b2vec2 extensions fait pas ralentir

fixture getAABB pour prob de non ref based Var avec & (voir box2d.monkey2)

bouger box2d.monkey dans mx2_box2d

conversion char > Short pour externals?

mieux comprendre enums

b2Vec2 Operator + - et ...? pas poss pour le moment

b2 contact id union (dans l'oigon?)

b2ContactCreateFcn + b2ContactDestroyFcn 'typedef aliasses

b2ContactPositionConstraint semble être défini dans .cpp!

autres callbacks

function pour convertir b2Joint en b2Joint**** + déplacer celle de mouse dans box2d.monkey2 et dans le .h .cpp
	
b2fixture.gettype mal traduit (commenté)

Function b2Log(string:char Ptr,...:..)
	
Field data:Byte Ptr 'was char ptr need char_t?

checker Global fn avec generics
	
	
	------------------------------------------------------
	checker que ça marche avec generics et pointers
		b2broadphase
		'Method UpdatePairs(callback:T Ptr) This method Has generics!!!!!!!!!!!!!!!!
		'Method Query(callback:T Ptr,aabb:b2AABB) This method Has generics!!!!!!!!!!!!!!!!
		'Method RayCast(callback:T Ptr,input:b2RayCastInput) This method Has generics!!!!!!!!!!!!!!!!
	class b2GrowableStack extends void
	
		'Method Push(element:T) This method Has generics!!!!!!!!!!!!!!!!
		'Method Pop:T() This method Has generics!!!!!!!!!!!!!!!!
	class b2DynamicTree extends void
	
		'Method Query(callback:T Ptr,aabb:b2AABB) This method Has generics!!!!!!!!!!!!!!!!
		'Method RayCast(callback:T Ptr,input:b2RayCastInput) This method Has generics!!!!!!!!!!!!!!!!
	----------------------------------------------------
	
----	listimports:
	
		X-operators---> pas poss pour le moment
		O-warning pure Virtual ---> bof
		V-détecter fonctions non Inline (y en a dans mx2 specific en tout cas)
	M-dédoubler methodes recevant des Extends de Struct (comme b2JointDef avec tout les joints defs)
		V-ajouter base Struct dans les extends
		V-enums
	generics funcs et methods (avec caca pas Ptr si Class?)
		V-fields avec , (Float x,y,z) (prob dans b2worldmanifold p.ex)
		V b2body getnext 
		V overrides et Virtual
	Arrays
	
	
	'./Dynamics/Contacts/b2EdgeAndPolygonContact.h
	'-------------------------------------------------------------------	

			

			
	struct b2ContactVelocityConstraint
		Field points[b2_maxManifoldPoints]:b2VelocityConstraintPoint