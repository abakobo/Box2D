//Started script log at 02/12/18 22:41:25

getBody(1).select();
getBody(1).setSleepingAllowed(0);
getBody(1).deselect();
addBody(18, '{"awake":true,"type":"dynamic"}');
getBody(18).addFixture(24, '{"density":1,"shapes":[{"radius":0.5,"type":"circle"}],"friction":0.2,"vertices":{"x":[0],"y":[0]}}');
getBody(18).setPosition(0,0);
getBody(2).select();
getBody(2).deselect();
getBody(18).select();
getBody(18).setPosition(-0.00828571,1.82286);
getBody(18).setType(0);
getBody(18).setName("boule");
getBody(18).deselect();
getBody(1).select();
getBody(1).setSleepingAllowed(2);
getJoint(1).select();
getJoint(1).setCollideConnected(2);
getJoint(1).setCollideConnected(0);
