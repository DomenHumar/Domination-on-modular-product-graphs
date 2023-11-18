# 1. primer
G = {g1: {g2, g3}, g2: {g1}, g3: {g1}}
H = {h1: {h2}, h2: {h1}}

# množica vozlišč modularnega produkta = {(g1, h1), (g1, h2), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}
# modularni produkt G in H = {(g1, h1): {(g1, h2), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}, 
#                             (g1, h2): {(g1, h1), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}, 
#                             (g2, h1): {(g1, h1), (g1, h2), (g2, h2)}, 
#                             (g2, h2): {(g1, h1), (g1, h2), (g2, h1)},
#                             (g3, h1): {(g1, h1), (g1, h2), (g3, h2)},
#                             (g3, h2): {(g1, h1), (g1, h2), (g3, h1)}}

# 2. primer
G = {g1: {g2, g3}, g2: {g1, g3}, g3: {g1, g2}}
H = {h1: {h2}, h2: {h1}}

# množica vozlišč modularnega produkta = {(g1, h1), (g1, h2), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}
# modularni produkt G in H = {(g1, h1): {(g1, h2), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}, 
#                             (g1, h2): {(g1, h1), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}, 
#                             (g2, h1): {((g1, h1), (g1, h2), (g2, h2), (g3, h1), (g3, h2)}, 
#                             (g2, h2): {(g1, h1), (g1, h2), (g2, h1), (g3, h1), (g3, h2)},
#                             (g3, h1): {(g1, h1), (g1, h2), (g2, h1), (g2, h2), (g3, h2)},
#                             (g3, h2): {(g1, h1), (g1, h2), (g2, h1), (g2, h2), (g3, h1)}}

# 3. primer
G = {g1: {g2, g3}, g2: {g1}, g3: {g1}}
H = {h1: {h2, h3}, h2: {h1}, h3: {h1}}

# množica vozlišč modularnega produkta = {(g1, h1), (g1, h2), (g1, h3), (g2, h1), (g2, h2), (g2, h3), (g3, h1), (g3, h2), (g3, h3)}
# modularni produkt G in H = {(g1, h1): {(g1, h2), (g1, h3), (g2, h1), (g2, h2), (g2, h3), (g3, h1), (g3, h2), (g3, h3)}, 
#                             (g1, h2): {(g1, h1), (g2, h1), (g2, h2), (g3, h1), (g3, h2)}, 
#                             (g1, h3): {(g1, h1), (g2, h1), (g2, h3), (g3, h1), (g3, h3)},   
#                             (g2, h1): {(g1, h1), (g1, h3), (g2, h2), (g2, h3), (g3, h3)}, 
#                             (g2, h2): {(g1, h1), (g1, h2), (g2, h1)},
#                             (g2, h3): {(g1, h1), (g1, h3), (g2, h1)},
#                             (g3, h1): {(g1, h1), (g1, h2), (g1, h3), (g3, h2), (g3, h3)},
#                             (g3, h2): {(g1, h1), (g1, h2), (g3, h1)}
#                             (g3, h3): {(g1, h1), (g1, h3), (g3, h1)}}