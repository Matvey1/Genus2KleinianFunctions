
p := p__2*x^2 + p__1*x + p__0;
q := q__2*x^2 + q__1*x + q__0;
r := r__2*x^2 + r__1*x + r__0;
P := collect(diff(q(x), x)*r(x) - q(x)*diff(r(x), x), x);
Q := collect(diff(r(x), x)*p(x) - r(x)*diff(p(x), x), x);
R := collect(diff(p(x), x)*q(x) - p(x)*diff(q(x), x), x);
M := Matrix(3, 3, [[coeff(p, x, 0), coeff(q, x, 0), coeff(r, x, 0)], [coeff(p, x, 1), coeff(q, x, 1), coeff(r, x, 1)], [coeff(p, x, 2), coeff(q, x, 2), coeff(r, x, 2)]]);
Delta := abs(M);
NULL;
mu := (j, k, l, m) -> coeff(P, x, j)*coeff(p, x, k)*coeff(p, x, l)*coeff(q, x, m)*coeff(r, x, m) + coeff(Q, x, j)*coeff(q, x, k)*coeff(q, x, l)*coeff(p, x, m)*coeff(r, x, m) + coeff(R, x, j)*coeff(r, x, k)*coeff(r, x, l)*coeff(p, x, m)*coeff(q, x, m);
psi__0 := 4*mu(0, 0, 0, 2) + mu(2, 1, 1, 0) + mu(2, 0, 0, 1);
psi__1 := -Delta/2*p__1*q__1*r__1 - mu(1, 0, 2, 1);
psi__2 := -4*mu(2, 2, 2, 0) - mu(0, 1, 1, 2) - mu(0, 2, 2, 1);
Cinv := Matrix(4, 4, [[-p__0/Delta, -1/2*p__1/Delta, p__2/Delta, 0], [-q__0/Delta, -1/2*q__1/Delta, q__2/Delta, 0], [-r__0/Delta, -1/2*r__1/Delta, r__2/Delta, 0], [psi__0, psi__1, psi__2, -16*Delta]]);

DD := Matrix(4, 4, [[coeff(P, x, 2), coeff(Q, x, 2), coeff(R, x, 2), 0], [-coeff(P, x, 1), -coeff(Q, x, 1), -coeff(R, x, 1), 0], [-coeff(P, x, 0), -coeff(Q, x, 0), -coeff(R, x, 0), 0], [1/8*(Delta - coeff(P, x, 1)*coeff(p, x, 1))*coeff(q, x, 1)*coeff(r, x, 1), 1/8*(Delta - coeff(Q, x, 1)*coeff(q, x, 1))*coeff(r, x, 1)*coeff(p, x, 1), 1/8*(Delta - coeff(R, x, 1)*coeff(r, x, 1))*coeff(p, x, 1)*coeff(q, x, 1), -1/8*Delta]]);
a := Vector[column](4, [a__1, a__2, a__3, a__4]);
b := Cinv . a;

D__p := -4*p__0*p__2 + p__1^2;
D__q := -4*q__0*q__2 + q__1^2;
D__r := -4*r__0*r__2 + r__1^2;
c := Vector[column](4, [2*D__p*Delta^4*b[2]*b[3] + 2*Delta^2*b[1]*b[4], 2*D__q*Delta^4*b[1]*b[3] + 2*Delta^2*b[2]*b[4], 2*D__r*Delta^4*b[1]*b[2] + 2*Delta^2*b[3]*b[4], Delta^4*(D__p*D__q*b[3]^2 + D__p*D__r*b[2]^2 + D__q*D__r*b[1]^2) + b[4]^2]);
A := expand(DD . c);
W := collect(A[4], a__4);
verify(coeff(W, a__4, 2), -32*Delta^3, equal);
verify(coeff(W, a__4, 1), 4*((Delta^3*(p__0*q__1*r__1 + p__1*q__0*r__1 + p__1*q__1*r__0) + Delta^2*psi__0)*a__1 - Delta^2*mu(1, 0, 2, 1)*a__2 + (-Delta^3*(p__1*q__1*r__2 + p__1*q__2*r__1 + p__2*q__1*r__1) + Delta^2*psi__2)*a__3), equal);
NULL;
