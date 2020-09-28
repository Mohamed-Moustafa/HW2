function T = FK_fn(q1,q2,q3,q4,q5,q6)
T = Rz(q1)*Tz(400)*Ry(q2)*Tx(560)*Ry(q3)*Tx(515)*Rx(q4)*Ry(q5)*Rx(q6);

