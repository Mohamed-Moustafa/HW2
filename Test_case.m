Test_angles   =       [pi/4 ,-pi/3 ,-pi/6, pi/4 ,pi/4 ,pi/4];

FK_matrix_1           =    FK_fn(Test_angles);

Obtained_IK_angles =   Ik_fn(FK_matrix_1);

Fk_matrix_2         =   Fk_fn(Obtained_IK_angles);

%% if FK_matrix_1 same as FK_matrix_2 then our model is correct

