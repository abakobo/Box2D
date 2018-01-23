pyro & b2json:
--------------

Isort pour exempl tank (et plus multi layers) + enlever les autres Functions de la foire  -->1/2

Faire createur de JointInfos et GetJoint(Name) (comme GetBody(Name))

ajouter control du tank

colision pyro entre 2 layers?

tranformer scales vec2 en Float --Fait?!

donner les noms quand ça fait writeTo?

retirer tout les files io de b2dJson et n'utiliser que fileSystem de mx2 (donc utiliser que write/read de string

ajouter offset à Extension camera.GetMatrix ?

ajouter offset à b2Manager

Détruire les b2djson!!!! dans mx2b2djson.xxx

offest json existing world dans mx2b2json et b2Manager

rename b2Draw_Pyro To b2Draw --Fait?!

cleanup the mess!

AABB box pour DDraw que ça dessine pas le bazar..  (mm chose pour pyro?, il le fait déjà?)


pure box2d:
----------


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