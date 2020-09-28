clear all
syms q1 q2 q3 q4 q5 q6 d1 d2 d3 real

%% End Effector 
H = Rz(q1)*Tz(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Rx(q4)*Ry(q5)*Rx(q6);
H=simplify(H);

%% Now lets take first part of equations 3 Links part of our robot
% and solve the

%T123 will give us x y z components in 4 coulmn from 1st to 3rd row
%respectively
D1=400;D2=560;D3=515;
T123=simplify(Rz(q1)*Tz(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3))

x = T123(1,4) %xx= cos(q1)*(d3*cos(q2 + q3) + d2*cos(q2))
y = T123(2,4) %yy= sin(q1)*(d3*cos(q2 + q3) + d2*cos(q2))
z = T123(3,4) %zz= d1 - d3*sin(q2 + q3) - d2*sin(q2)

% now we will treat our robot as 2-link Planar since both have same
% equation
% +/- sqrt(xx^2+yy^2)=  d3*cos(q2 + q3) + d2*cos(q2)
%      -zz + d1      =  d3*sin(q2 + q3) d2*sin(q2)


%% joint 3 angle
Q3= acosd( (x^2+y^2+ (-z+d1)^2- d2^2 -d3^2)/(2*d2*d3) )

%limits of q3 +120/-156 

if Q3>120
    Q3=120;
elseif Q3<-156
    Q3=-156;

%here to show if it down elbow or up elbow configuration
%will be used to get Q2
if Q3>0 
    m=-1;
else
    m=1;
end

Q2 = -m* atand( d3*sind(Q3)/(d2+d3*cosd(Q3)))+ atand( (-z+d1)/(sqrt(x^2+y^2)) )
%limits of q2 +190/-45 
if Q2>190
    Q2=190;
elseif Q2<-45
    Q2=-45;


Q1 = atand(y/x)

%limits of q1 +170/-170 
if Q1>170
    Q1=170;
elseif Q1<-170
    Q1=-170;
    








