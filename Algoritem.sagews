def modularni_produkt(G, H):
    A = H.cartesian_product(G)
    B = H.tensor_product(G)
    C = H.complement().tensor_product(G.complement())
    X = A.union(B)
    Y = X.union(C)
    return Y









