function H = FK_fn(q)

T123= Rz(q(1))*Tz(400)*Ry(q(2))*Tx(560)*Ry(q(3))*Tx(515);
T456 = Rx(q(4))*Ry(q(5))*Rx(q(6));
H= T123 * T456;

end
