function Q = IK_fn(FK)
d1=400;d2=560;d3=515;
%% joint 3 angle
x=FK(1,4);
y=FK(2,4);
z=FK(3,4);

q3= acosd( (x^2+y^2+ (-z+d1)^2- d2^2 -d3^2)/(2*d2*d3) );

%limits of q3 +120/-156 

if q3>120
    q3=120;
elseif q3<-156
    q3=-156;
end
    
%here to show if it down elbow or up elbow configuration
%will be used to get Q2
if q3>0 
    m=-1;
else
    m=1;
end

q2 = -m* atand( d3*sind(q3)/(d2+d3*cosd(q3)))+ atand( (-z+d1)/(sqrt(x^2+y^2)) );
%limits of q2 +190/-45 
if q2>190
    q2=190;
elseif q2<-45
    q2=-45;
end


q1 = atand(y/x);

%limits of q1 +170/-170 
if q1>170
    q1=170;
elseif q1<-170
    q1=-170;
end

T123_new= Rz(q1*pi/180)*Tz(400)*Ry(q2*pi/180)*Tx(560)*Ry(q3*pi/180)*Tx(515);

T456_new = inv(T123_new)*FK;

nx=T456_new(1,1);
ny=T456_new(2,1);
nz=T456_new(3,1);

sx=T456_new(1,2);
sy=T456_new(2,2);
sz=T456_new(3,2);

ax=T456_new(1,3);
ay=T456_new(2,3);
az=T456_new(3,3);


if nx ~= 1
    q4=atand(ny/-nz);
    q6=atand(sx/ax);
    %limits of q1 +170/-170 
    if q4>185
        q4=185;
    elseif q4<-185
        q4=-185;
    %limits of q1 +170/-170
    end
    if q6>350
        q6=350;
    elseif q6<-350
        q6=-350;
    end
    
    if ax~=0
        q5=atand(ax/(cosd(q6)*nx));
    else
        q5=atand(sx/(sind(q6)*nx));
    end
else
    q5=cosd(nx);
end
q1
q2
q3
q4
q5
q6
Q=[q1 q2 q3 q4 q5 q6];
q1=q1*pi/180;
q2=q2*pi/180;
q3=q3*pi/180;
q4=q4*pi/180;
q5=q5*pi/180;
q6=q6*pi/180;
T=Rz(q1)*Tz(400)*Ry(q2)*Tx(560)*Ry(q3)*Tx(515)*Rx(q4)*Ry(q5)*Rx(q6);

end
    
    

   