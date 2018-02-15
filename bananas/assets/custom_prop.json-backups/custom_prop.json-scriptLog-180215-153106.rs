//Started script log at 02/15/18 15:29:52

getBody(1).select();
getBody(1).setPosition(-0.0473858,3.5509);
getBody(1).deselect();
getBody(1).select();
getBody(1).deselect();
addBody(3, '{"angle":0,"angularVelocity":0,"awake":true,"customProperties":[{"int":7,"name":"theint"},{"float":7.7,"name":"thefloat"},{"name":"thestring","string":"seven"},{"bool":true,"name":"thebool"}],"linearVelocity":0,"massData-I":0.09817477315664291,"massData-mass":0.7853981852531433,"name":"ball","position":{"x":-0.04738575220108032,"y":3.550898790359497},"type":"dynamic"}');
getBody(3).addFixture(3, '{"density":1,"friction":0.2,"name":"fixture0","restitution":0.9,"shapes":[{"radius":0.5,"type":"circle"}],"vertices":{"x":[0.0],"y":[0.0]}}');
getBody(3).setCustomInt('theint',7);
getBody(3).setCustomFloat('thefloat',7.7);
getBody(3).setCustomString('thestring','seven');
getBody(3).setCustomBool('thebool',1);
getBody(3).select();
getBody(3).setPosition(-0.0786652,4.75516);
getBody(3).deselect();
getBody(1).select();
getBody(1).deselect();
getBody(3).select();
getBody(3).deselect();
getBody(2).select();
