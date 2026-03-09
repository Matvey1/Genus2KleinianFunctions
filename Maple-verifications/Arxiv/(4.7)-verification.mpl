
U := Matrix(4, 4, [[Delta^2*delta__q*delta__r, Delta^2*delta__p*delta__r, Delta^2*delta__p*delta__q, 1], [-Delta^2*delta__q*delta__r, -Delta^2*delta__p*delta__r, Delta^2*delta__p*delta__q, 1], [-Delta^2*delta__q*delta__r, Delta^2*delta__p*delta__r, -Delta^2*delta__p*delta__q, 1], [Delta^2*delta__q*delta__r, -Delta^2*delta__p*delta__r, -Delta^2*delta__p*delta__q, 1]]);
V := Matrix(4, 4, [[delta__p, -delta__p, -delta__p, delta__p], [delta__q, -delta__q, delta__q, -delta__q], [delta__r, delta__r, -delta__r, -delta__r], [delta__p*delta__q*delta__r, delta__p*delta__q*delta__r, delta__p*delta__q*delta__r, delta__p*delta__q*delta__r]]);
a := Vector[column](4, [a__1, a__2, a__3, a__4]);
T := simplify(V . ((U . a) *~ (U . a)/(4*delta__p*delta__q*delta__r)));
NULL;
