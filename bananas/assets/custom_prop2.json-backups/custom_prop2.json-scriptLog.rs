//Started script log at 02/16/18 11:47:05

getBody(2).select();
addCustomProperty('body','stringProp','stringProp','string');
getBody(2).deselect();
getBody(3).select();
getBody(3).setCustomString('stringProp','theGround');
addCustomProperty('body','intProp','intProp','int');
getBody(3).deselect();
getBody(2).select();
addCustomProperty('body','floatProp','floatProp','float');
addCustomProperty('body','boolProp','boolProp','int');
getBody(1).clearCustomProperty('boolProp');
removeCustomProperty('body','boolProp');
addCustomProperty('body','boolProp','boolProp','bool');
getBody(2).deselect();
getBody(3).select();
getBody(3).setCustomBool('boolProp',1);
getBody(3).setCustomFloat('floatProp',9.9);
getBody(3).setCustomInt('intProp',8);
