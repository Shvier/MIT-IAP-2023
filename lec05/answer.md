## 1
The commitment of KZG is [f(tau)]_1, and V checks e(C - [y]_1, G_2) ?= e(Pi, [tau]_2 - [x]_2), where Pi is a group element of G. That is, checking f(tau) - y ?= Pi * (tau - x). Pi*G_1^-1 is (f(tau) - y)/(tau - x), denoting pi. To create a fake open proof, we can find a y^prime != y but still satisfies the equation. pi^prime = (f(tau) - y^prime)/(tau - x) => Pi^prime = pi^prime * G_1 = (f(tau) - y^prime)^{1/(tau - x)}.

## 2
We can create a vector commitment scheme M(X) = sum{m_X*l(X)}, where l(X) is the Lagrange polynomial, i.e., l(X) equals 1 when x = i otherwise 0.
The space requirement of Merkle tree is O(k*log_k^n) because the prover needs to open one point, the nodes on the path to the root, and the alongside siblings. For Verkle tree, the prover only needs to open one point and all parent nodes on the path to the root, O(log_k^n).

## 3
To make the commitment scheme support multiple points, the verification checking will be P(X) - y_i = Pi * prod{(X - x_i)}. So P(X) = sum{p(X)l(X)}, where l(X) is the Lagrange polynomial. The proof Pi, (C - y)/(X - x), will be (P(X)- y_i)/prod{(X - x_i)}.
