function Q = IK_fn(H)
d1=400;d2=560;d3=515;

%% get x y z from input Matrix we want to go to
x=H(1,4);
y=H(2,4);
z=H(3,4);


%% joint 3 angle
q3= acos( ( x^2 + y^2 + (-z+d1)^2 - d2^2 - d3^2)/(2*d2*d3) );

%limits of q3 +120/-156 

if q3>156*pi/180
    q3=156*pi/180;
elseif q3<-120*pi/180
    q3=-120*pi/180;
end
    
%here to show if it down elbow or up elbow configuration
%will be used to get Q2
if q3>0 
    m=-1;
else
    m=1;
end

%% joint 2 angle
q2 = m* atan2( d3*sin(q3),(d2+d3*cos(q3)))+ atan2( (-z+d1),(sqrt(x^2+y^2)) );

%limits of q2 +190/-45 
if q2>45*pi/180
    q2=45*pi/180;
elseif q2<-190*pi/180
    q2=-190*pi/180;
end

%% joint 1 angle
q1 = atan2(y,x);

%limits of q1 +170/-170 
if q1>170*pi/180
    q1=170*pi/180;
elseif q1<-170*pi/180
    q1=-170*pi/180;
end
    

%% now after we obtain q1,q2,q3 we will subsitute with them in the 
% first part of forward kinematic equation (T_123)
T123= Rz(q1)*Tz(400)*Ry(q2)*Tx(560)*Ry(q3)*Tx(515);

%T456 = inverse matrix of (T123) * H
T456 = inv(T123)*H;

nx=T456(1,1);
ny=T456(2,1);
nz=T456(3,1);

sx=T456(1,2);
sy=T456(2,2);
sz=T456(3,2);

ax=T456(1,3);
ay=T456(2,3);
az=T456(3,3);

%now to avoid singularities and take into account the angle limit of each
%joint we have to pass through following if Conditions
if nx ~= 1
    q4=atan2(ny,-nz);
    q6=atan2(sx,ax);
    %limits of q1 +170/-170 
    if q4>185*pi/180
        q4=185*pi/180;
    elseif q4<-185*pi/180
        q4=-185*pi/180;
    %limits of q1 +170/-170
    end
    if q6>350*pi/180
        q6=350*pi/180;
    elseif q6<-350*pi/180
        q6=-350*pi/180;
    end
    
    if ax~=0
        q5=atan2(ax/cos(q6),nx);
    else
        q5=atan2(sx/sin(q6),nx);
    end
else
    q5=acos(nx);
end

Q=[q1 q2 q3 q4 q5 q6];

end
