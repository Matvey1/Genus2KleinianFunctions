
P := P__2*x^2 + P__1*x + P__0;
Q__1 := Q__11*x + Q__10;
Q__2 := Q__21*x + Q__20;
Q := collect(Q__1*Q__2, x);
R := R__2*x^2 + R__1*x + R__0;
g := collect(P*Q__1, x);

h := collect(Q__2*R/(4*Delta), x);
T := Vector[row](4, [coeff(g, x, 2)*coeff(h, x, 0) + coeff(g, x, 0)*coeff(h, x, 2), coeff(g, x, 3)*coeff(h, x, 0) + coeff(g, x, 0)*coeff(h, x, 3), -coeff(g, x, 3)*coeff(h, x, 1) - coeff(g, x, 1)*coeff(h, x, 3), 4]);
phi__1 := -1/(16*Delta)*(coeff(P, x, 2)^2*coeff(Q, x, 0)*coeff(R, x, 0) + coeff(P, x, 2)*coeff(P, x, 0)*(coeff(Q, x, 2)*coeff(R, x, 0) + coeff(Q, x, 1)*coeff(R, x, 1) + coeff(Q, x, 0)*coeff(R, x, 2)) + coeff(P, x, 0)^2*coeff(Q, x, 2)*coeff(R, x, 2));
phi__2 := -1/(16*Delta)*(coeff(Q, x, 2)^2*coeff(P, x, 0)*coeff(R, x, 0) + coeff(Q, x, 2)*coeff(Q, x, 0)*(coeff(P, x, 2)*coeff(R, x, 0) + coeff(P, x, 1)*coeff(R, x, 1) + coeff(P, x, 0)*coeff(R, x, 2)) + coeff(Q, x, 0)^2*coeff(P, x, 2)*coeff(R, x, 2));
phi__3 := -1/(16*Delta)*(coeff(R, x, 2)^2*coeff(Q, x, 0)*coeff(P, x, 0) + coeff(R, x, 2)*coeff(R, x, 0)*(coeff(Q, x, 2)*coeff(P, x, 0) + coeff(Q, x, 1)*coeff(P, x, 1) + coeff(Q, x, 0)*coeff(P, x, 2)) + coeff(R, x, 0)^2*coeff(Q, x, 2)*coeff(P, x, 2));
C := Matrix(4, 4, [[coeff(P, x, 2), coeff(Q, x, 2), coeff(R, x, 2), 0], [-coeff(P, x, 1), -coeff(Q, x, 1), -coeff(R, x, 1), 0], [-coeff(P, x, 0), -coeff(Q, x, 0), -coeff(R, x, 0), 0], [phi__1, phi__2, phi__3, -1/16*1/Delta]]);

W := T . C;
simplify(-4*Delta*W);
NULL;

