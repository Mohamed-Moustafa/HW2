clear all
syms q1 q2 q3 q4 q5 q6 d1 d2 d3 real

%% Forward Kinematics Equation 
H = Rz(q1)*Tz(d1)*Ry(q2)*Tx(d2)*Ry(q3)*Tx(d3)*Rx(q4)*Ry(q5)*Rx(q6);
H=simplify(H);

%%this to tes our transofrmation matrix is correct
D1=400;D2=560;D3=515;
Q1=0;
Q2=0;
Q3=0;
Q4=0;
Q5=0;
Q6=0;

%now it should give us x=560+515=1075 & y=0 & Z=400 & no orientation
H = Rz(Q1)*Tz(D1)*Ry(Q2)*Tx(D2)*Ry(Q3)*Tx(D3)*Rx(Q4)*Ry(Q5)*Rx(Q6)

