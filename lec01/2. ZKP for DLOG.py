import random

numOfChallenges = 50

def dlogProof(x, g, p):
    r = []
    for _ in range(numOfChallenges):
        r.append(random.randrange(1, p))
    t = list(map(lambda r: pow(g, r) % p, r))
    b = list(map(lambda t: t % 2, t))
    s = []
    for i in range(numOfChallenges):
        s.append(r[i] + b[i] * x)
    return (t, s)

def verify(y, g, p, pf):
    t, s = pf
    b = list(map(lambda t: t % 2, t))
    for i in range(numOfChallenges):
        lhs = pow(g, s[i]) % p
        rhs = (y if b[i] == 1 else 1) * t[i] % p
        if lhs != rhs:
            return False
    return True

p = 31
g = 3
x = 17
y = 22

proof = dlogProof(x, g, p)
print(proof)
check = verify(y, g, p, proof)
print(check)
