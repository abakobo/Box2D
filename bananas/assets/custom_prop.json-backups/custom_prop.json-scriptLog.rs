//Started script log at 02/15/18 16:14:31

getBody(1).select();
addBody(3, '{"awake":true,"type":"dynamic"}');
getBody(3).addFixture(3, '{"density":1,"shapes":[{"radius":0.5,"type":"circle"}],"friction":0.2,"vertices":{"x":[0],"y":[0]}}');
getBody(3).setPosition(0,0);
getBody(1).deselect();
getBody(3).select();
getBody(3).setPosition(0.0156397,3.47202);
addCustomProperty('body','intProp','intProp','int');
getBody(3).deselect();
getBody(1).select();
addCustomProperty('body','stringProp','stringProp','string');
getBody(1).setCustomInt('intProp',4);
getBody(1).setCustomString('stringProp','nmy');
getBody(1).deselect();
getBody(3).select();
getBody(3).setCustomInt('intProp',6);
getBody(3).setCustomString('stringProp','friend');
getBody(3).deselect();
getBody(3).select();
getBody(3).deselect();
getBody(1).select();
getBody(1).deselect();
getBody(3).select();
getBody(3).setName("ball");
