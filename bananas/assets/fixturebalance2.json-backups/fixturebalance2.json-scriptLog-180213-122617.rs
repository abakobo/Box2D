//Started script log at 02/13/18 12:17:43

getBody(18).select();
getBody(18).deselect();
getFixture(24).delete();
getBody(18).delete();
addBody(19, '{"awake":true,"type":"dynamic"}');
getBody(19).addFixture(25, '{"density":1,"shapes":[{"radius":0,"type":"polygon"}],"friction":0.2,"vertices":{"x":[-0.5,0.5,0.5,-0.5],"y":[-0.5,-0.5,0.5,0.5]}}');
getBody(19).setPosition(0,0);
getBody(19).select();
getBody(19).setPosition(0,4.31868);
getBody(19).setPosition(0,4.20043);
{
	fixture _rube_redoFixture = getFixture(25);
	_rube_redoFixture.setVertex(0,-0.48631,-0.48631);
	_rube_redoFixture.setVertex(1,0.48631,-0.48631);
	_rube_redoFixture.setVertex(2,0.48631,0.48631);
	_rube_redoFixture.setVertex(3,-0.48631,0.48631);
}
getVertex(25,0).select();
getVertex(25,1).select();
getVertex(25,0).setPos(-0.498441, -2.83975);
getVertex(25,1).setPos(0.474179, -2.83975);
getVertex(25,0).deselect();
getVertex(25,1).deselect();
getBody(19).setType(1);
getBody(19).setAngularVelocity(0.785398);
getFixture(25).select();
getFixture(25).setSensor(2);
getFixture(25).setSensor(0);
getFixture(25).setSensor(2);
getFixture(25).setName("radar");
