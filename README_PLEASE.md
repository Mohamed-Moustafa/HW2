# HW2
Solve Forward Kinematics &amp; Inverse Kinematics For 6DOF Robot Arm (Kuka)

Full work explain on the script files

i have upload 3 main files

1- FK_fn.m  ----> this file hold function for the forward kinematics 
also it takes vector of six elements (angles of robot in radians) and give us the orientation and position of our robot (Forward Kinematics Matrix) 

2- IK_fn  -----> this file hold the whole analytical method to obtain the angles of robot joints and it 
takes Matrix of the Required Position & Orientation we want to go to and give us the angles of each 
joint required to achieve this with taking into consideration angles limits & singularties Explained in the file also


3- Test_Case.m this file is just to confirm that IK_fn.m works Fine with our model
