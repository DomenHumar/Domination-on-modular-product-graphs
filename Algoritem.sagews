# Definiramo modularni produkt kot unijo kartezičnega produkta, direktnega produkta in direktnega produkta komplementov dveh grafov

def modularni_produkt(G, H):
    A = H.cartesian_product(G)
    B = H.tensor_product(G) # tensor_product je direktni produkt po slovensko
    C = H.complement().tensor_product(G.complement())
    X = A.union(B)
    Y = X.union(C)
    return Y

# Primer za modularni produkt

G = Graph([(0, 1), (0, 2), (2, 3), (1, 3)])
H = Graph([(0, 1), (0, 2)])
I = modularni_produkt(G, H)
G.show()
H.show()
I.show()

# Iskanje dominacijskega števila (kopiran iz https://www.steinertriples.ch/ncohen/tut/LP_examples/)

def dominacijsko_stevilo (G):
    p = MixedIntegerLinearProgram(maximization = False)
    b = p.new_variable(binary = True)
    p.set_objective( sum([b[v] for v in G]) )
    for u in G:
        p.add_constraint( b[u] + sum([b[v] for v in G.neighbors(u)]) >= 1 )
    a = p.solve()
    return a

# Primer za iskanje dominacijskega števila

g = dominacijsko_stevilo(G)
h = dominacijsko_stevilo(H)
i = dominacijsko_stevilo(I)
print(g, h, i)

# Neenakost iz naloge

def preveri_neenakost(x, y, z):
    return x <= y + z - 1

def preveri_enakost(x, y, z):
    return x == y + z - 1

# Funkcija, ki nam poda podatke o grafih, ki imajo do n vozlišč in podatke o njihovih modularnih produktov z grafi, ki imajo do m vozlišč
# Funkcija še preveri, kdaj velja neenakost iz naloge in kdaj v njej nastopi enakost

def naredi_matriko(n, m):
    matrika = [["V(H)", "E(H)", "γ(H)", "V(G)", "E(G)", "γ(G)", "γ(G ◇ H)", "neenakost", "enakost"]]
    for k in range(2, n):
        for H in graphs(k):
            for d in range(2, m):
                for G in graphs(d):
                    Y = modularni_produkt(G, H)
                    y = dominacijsko_stevilo (Y)
                    h = dominacijsko_stevilo (H)
                    g = dominacijsko_stevilo (G)
                    i = preveri_neenakost(y, h, g)
                    j = preveri_enakost(y, h, g)
                    matrika.append([H.order(), H.size(), h, G.order(), G.size(), g, y, i, j])
    return matrika

# Ista funkcija kot prej, le da nam ta vrne samo podatke o tistih grafih, za katere nastopi enakost v naši neenakosti

def naredi_matriko_enakosti(n, m):
    matrika_enakosti = [["V(H)", "E(H)", "γ(H)", "V(G)", "E(G)", "γ(G)", "γ(G ◇ H)"]]
    for k in range(2, n):
        for H in graphs(k):
            for d in range(2, m):
                for G in graphs(d):
                    Y = modularni_produkt(G, H)
                    y = dominacijsko_stevilo (Y)
                    h = dominacijsko_stevilo (H)
                    g = dominacijsko_stevilo (G)
                    j = preveri_enakost(y, h, g)
                    if j == True:
                        matrika_enakosti.append([H.order(), H.size(), h, G.order(), G.size(), g, y])
    return matrika_enakosti

# Primer tabele za grafe velikosti 5 in 5

table(naredi_matriko(5, 5))

# Primer tabele za grafe ko nastopi enakost velikosti 6 in 6

table(naredi_matriko_enakosti(6, 6))

# Iz tabele je razvidno, da je zadosten pogoj za enakost to, da ima eden izmed grafov dominacijsko število 1
# Vendar pa ta pogoj ni nujen, saj obstajajo grafi kjer nima nobeden dominacijsko število 1, vendar enakost nastopi vseeno.
# Naslednji trije primeri so prikaz te lastnosti

G1 = Graph([(0, 1), (0, 2), (1, 3), (2, 3)])
H1 = Graph([(0, 1), (0, 2), (1, 3), (2, 3)])
I1 = modularni_produkt(G1, H1)
G1.show()
H1.show()
I1.show()

g1 = dominacijsko_stevilo(G1)
h1 = dominacijsko_stevilo(H1)
i1 = dominacijsko_stevilo(I1)
j1 = preveri_enakost(i1, g1, h1)
print(g1, h1, i1, j1)

G2 = Graph([(0, 1), (0, 2), (0, 3), (3, 4)])
H2 = Graph([(0, 1), (0, 2), (1, 3), (2, 3)])
I2 = modularni_produkt(G2, H2)
G2.show()
H2.show()
I2.show()

g2 = dominacijsko_stevilo(G2)
h2 = dominacijsko_stevilo(H2)
i2 = dominacijsko_stevilo(I2)
j2 = preveri_enakost(i2, g2, h2)
print(g2, h2, i2, j2)

G3 = graphs.PetersenGraph()
H3 = Graph([(0, 1), (0, 2), (1, 3), (2, 3)])
I3 = modularni_produkt(G3, H3)
G3.show()
H3.show()
I3.show()

g3 = dominacijsko_stevilo(G3)
h3 = dominacijsko_stevilo(H3)
i3 = dominacijsko_stevilo(I3)
j3 = preveri_enakost(i3, g3, h3)
print(g3, h3, i3, j3)










