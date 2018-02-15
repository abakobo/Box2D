//Started script log at 02/15/18 15:32:44

getBody(1).select();
getFixture(1).select();
addCustomProperty('body','myint','myint','int');
getBody(1).setCustomInt('myint',7);
