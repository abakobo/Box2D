doing:

trouver les Extension à ajouter pour éviter du Varptr (comme (vertex[],count:Int) p.ex)

virer m_blah? ou ajouter getters et Setters pour les m_blah attributes qui sont des bbArray (direct dans box2d .h et . cpps)

virer bbArrayTest de b2polygonshape .h et .cpp

de merge:
---------
taille pixel/phys scale pour backrounds!!

ajouter fixture.getname et joint.getName (y a déjà body?)


TODO
-----
b2json:
--------

plusieurs images pour 1 body?


load/save world state (pas world custom properties?)

AABB box pour DDraw que ça dessine pas le bazar..  (mm chose pour pyro?, il le fait déjà?)

caster vers wrong joint type assert que Return nul alors que assert donc Return rien du tout! (enlever "Return null")

ajouter offset à b2Manager -> fait?
is addjson Completed? (yes?)

checker que imageWorldPosition fonctionne correc avec yAxisInvert=False  checker avec draw bodies aussi...
donc faire un exemple yaxisNonInversé avec images!

ajouter joints/fixtures getuserDataToX comme GetBodiesUserDataToX?
ajouter fixture.getname et joint.getName

is addjson Completed? (yes?)

cleanup the mess!:
	-virer b2djsonImage
	-virer cpp fileio et bitmap render...
	
remplacer If debug prints par assert? Bof

trouver ce qui Print du vide dans e0-load_delete -->seulement en debug donc +-ok

load/save collision mask --> fonctionne tout seul avec b2dJson mais RUBE ne lit pas le nom des BitPlanes donc pas implémenté

----> ajouter un petit json avec les noms + mettre quand même les noms dans le json principal

pyro:
--------


AABB box pour DDraw que ça dessine pas le bazar..  (mm chose pour pyro?, il le fait déjà?)

ajouter opacity et flip dans pyro2.CreatLayerSprites

ajouter offset à Extension camera.GetMatrix ???? playniax?

colision pyro entre 2 layers?

Isort pour exempl tank (et plus multi layers) + enlever les autres Functions de la foire(Create/Updateb2LayerSprites)  -->1/2



pure box2d:
----------

tester destroyjoint avec différents joints et avec/sans Varptr

v-faire Extension anti-varptr pour tous les shapes.Set (que b2polygonshape pour le moment) (faire chainshape.CreateLoop p.ex)

créer resource Extends pour gérer les call backs?

créer Getter/Setter en utilisant bbArray pour les fields avec 'need-bbArray getter/setter-> en commentaire

x-checker que y a pas de m_blah qui sont utiles car ils sont tous désactivés! Si ils sont utilisés!

checker que Double dans b2vec2 extensions fait pas ralentir->mieux d'être en float pour tout le monde le même

fixture getAABB pour prob de non ref based Var avec & (voir box2d.monkey2)

bouger box2d.monkey dans mx2_box2d

conversion char > Short pour externals?

mieux comprendre enums

v-b2Vec2 Operator + - et ...? pas poss pour le moment -> si, done

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
	
		X-operators---> pas poss pour le moment -> si avec Extension (en creant Default New() et en déprivatisant constrctor/destructor)
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