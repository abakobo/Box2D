//Started script log at 01/30/18 14:05:25

getJoint(2).select();
getJoint(2).setMotorSpeed(0);
getJoint(2).deselect();
getJoint(1).select();
getJoint(1).setMotorSpeed(0);
getBody(10).select();
getBody(10).deselect();
getBody(2).select();
getBody(2).deselect();
getBody(10).select();
getBody(10).deselect();
getBody(9).select();
getBody(9).deselect();
getBody(10).select();
getBody(10).setName("car");
getBody(10).deselect();
getFixture(37).select();
getFixture(37).setFriction(50);
getFixture(37).deselect();
getFixture(44).select();
getJoint(1).setEnableMotor(0);
getJoint(1).setMaxMotorTorque(0);
