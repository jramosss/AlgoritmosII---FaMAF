Documents/programs/TADS/TADBooleano.hs                                                              0000664 0001750 0001750 00000000770 13456621656 016533  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                   -- TAD Booleano

module TADBooleano(Booleano,v,f,no,y,o,imp,eq) where

    -- Constructores

    data Booleano= V | F
        deriving (Show)

    v = V
    f = F

    -- Operaciones
    no :: Booleano -> Booleano
    y, o, imp, eq :: Booleano -> Booleano -> Booleano

    -- Ecuaciones


    no V = F
    no F = V

    V `y` b = b
    F `y` b = F

    F `o` b = b
    V `o` b = V

    V `imp` F = F
    V `imp` V = V
    F `imp` b = V

    V `eq` F = F
    V `eq` V = V
    F `eq` F = V
    F `eq` V = F        Documents/programs/TADS/TADConjunto.hs                                                              0000644 0001750 0001750 00000001475 13457333216 016566  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                   module TADConjunto (Conjunto, unionC, interC, diffC, es_vacioC, perC) where
    
-- Constructores

data Conjunto e = Vacio | Agg e (Conjunto e)
    deriving (Eq, Ord, Show)

-- Operaciones

unionC, interC :: Conjunto e -> Conjunto e -> Conjunto e 
es_vacioC :: Conjunto e -> Bool
perC :: forall e .Conjunto e -> e -> Bool
sinC :: e -> Conjunto e -> Conjunto e
-- Ecuaciones

es_vacioC Vacio = True
es_vacioC (Agg k _) = False

perC _ Vacio = False
perC x (Agg k p) | x == k = True
                 | otherwise = (perC x p)

Vacio `unionC` p = p
(Agg k q) `unionC` p = Agg k (q `unionC` p)

Vacio `interC` p = p
(Agg k q) `interC` p | (perC k p) = Agg k (q `interC` p)
                     | otherwise = (q `interC` p)

sinC x Vacio = "Error cjt vacio"
sinC x (Agg k p) | k == x = p
                 | otherwise = Agg k (sinC x p)                                                                                                                                                                                                   Documents/programs/TADS/TADEntero.hs                                                                0000644 0001750 0001750 00000004024 13456736622 016223  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                   -- TAD Entero

module TADEntero(Entero, posE, ceroE, negE, sucE, preE, masE, menosE, porE, cocE, alaE, opE, absE) where

import TADNatural

-- CONSTRUCTORES

data Entero = Neg Natural 
            | Pos Natural
            deriving Show

-- CONSTRUCTORES

-- ECUACIONES ENTRE CONSTRUCTORES
-- Pos cero == Neg cero

posE = Pos
ceroE = Pos cero
negE = Neg

-- OPERACIONES

sucE, preE :: Entero -> Entero
masE, menosE, porE, cocE :: Entero -> Entero -> Entero
alaE :: Entero -> Natural -> Entero
opE :: Entero -> Entero
absE :: Entero -> Natural

-- alaE no se aplica si ambos argumentos son cero
-- cocE no se aplica si el divisor es cero

-- ECUACIONES

sucE (Pos n) = Pos (suc n)
sucE (Neg n) | n == cero = Pos (suc cero)
             | n > cero = Neg (pre n)

preE (Neg n) = Neg (suc n)
preE (Pos n) | n == cero = Neg (suc cero)
             | n > cero = Pos (pre n)

Pos n `masE` Pos m = Pos (n `mas` m)
Pos n `masE` Neg m | n >= m = Pos (n `menos` m)
                   | otherwise = Neg (m `menos` n)
Neg n `masE` Pos m | n >= m = Neg (n `menos` m)
                   | otherwise = Pos (m `menos` n)
Neg n `masE` Neg m = Neg (n `mas` m)
 
z `menosE` y = z `masE` (opE y)

Pos n `porE` Pos m = Pos (n `por` m)
Pos n `porE` Neg m = Neg (n `por` m)
Neg n `porE` Pos m = Neg (n `por` m)
Neg n `porE` Neg m = Pos (n `por` m)

z `alaE` n | z==0 && n==0 = "Potencia indefinida"
           | n==0 = Pos (suc ceroE)
           | otherwise = z `porE` (z `alaE` preE n)

z `cocE` y | y == 0 = "Division indefinida"
Pos z `cocE` Pos y = Pos (z `coc` y)
Pos z `cocE` Neg y = Neg (z `coc` y)
Neg z `cocE` Pos y = Neg (z `coc` y)
Neg z `cocE` Neg y = Pos (z `coc` y)

opE (Pos n) = Neg n
opE (Neg n) = Pos n

absE (Pos n) = n
absE (Neg n) = n

instance Entero Eq where
    Pos n == Pos m = n == m
    Neg n == Neg m = n == m
    Neg n == Pos m = n == ceroE && m == ceroE
    Pos n == Neg m = n == ceroE && m == ceroE

instance Entero Ord where
    Pos n <= Pos m = n <= m
    Pos n <= Neg m = n == ceroE && m == ceroE
    Neg n <= Pos m = True  
    Neg n <= Neg m = m <= n
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            Documents/programs/TADS/TADEnteroJ.hs                                                               0000644 0001750 0001750 00000000006 13457360544 016326  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                   module                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          Documents/programs/TADS/TADMc.hs                                                                    0000644 0001750 0001750 00000005115 13457161205 015316  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                    module TADMc (MC,addcafe,addchoc,addvaso,hscof,hschoc,hsvaso,expcafe,expchoc,cafecant,choccant,vasocant,addccafe,addcchoc,addcvaso) where

--CONSTRUCTORES 
 	data MC = Vacia
 			 | Addcafe (MC)
 			 | Addchoc (MC)
 			 | Addvaso (MC)

vacia = Vacia
acafe = Addcafe
achoc = Addchoc
avaso = Addvaso

--OPERACIONES

hscof, hschoc, hsvaso :: MC -> Bool
expcafe,expchoc :: MC -> MC
cafecant, choccant, vasocant :: MC -> Nat
addccafe, addcchoc, addcvaso :: Nat -> MC -> MC

--ECUACIONES

hscafe Vacia = "La maquina esta vacia"
hscafe (Addcafe p) = True
hscafe (Addchoc p) = Addchoc (hscafe p)
hscafe (Addvaso p) = Addvaso (hscafe p)

hschoc Vacia = "La maquina esta vacia"
hschoc (Addcafe p) = Addcafe (hschoc p)
hschoc (Addchoc p) = True
hschoc (Addvaso p) = Addvaso (hschoc p)

hsvaso Vacia = "La maquina esta vacia"
hsvaso (Addcafe p) = Addcafe (hsvaso p)
hsvaso (Addchoc p) = Addchoc (hsvaso p)
hsvaso (Addvaso p) = True

expelvaso :: MC -> MC
expelvaso Vacia = "Error Maquina vacia"
expelvaso (Addvaso p) = p
expelvaso (Addcafe p) = Addcafe (expelvaso p)
expelvaso (Addchoc p) = Addchoc (expelvaso p)

expcafe Vacia = "Error maquina vacia"
expcafe (Addcafe p) | (hsvaso p) = (expelvaso p)
			   	    | otherwise = "La maquina no tiene vasos"				  	
expcafe (p) | (hscafe p) && (hsvaso p) = expcafe (expelvaso p)
		    | otherwise = "La mquina no tiene ingredientes"

expchoc Vacia = "Error maquina vacia"
expchoc (Addchoc p) | (hsvaso p) = (expelvaso p)
			   	    | otherwise = "La maquina no tiene vasos"				  	
expchoc (p) | (hschoc p) && (hsvaso p) = expchoc (expelvaso p)
		    | otherwise = "La mquina no tiene ingredientes"

cafecant Vacia = 0
cafecant (Addcafe p) = 1+(cafecant p)
cafecant (Addchoc p) = 0 + (cafecant p)
cafecant (Addvaso p) = 0 + (cafecant p)

choccant Vacia = 0
choccant (Addchoc p) = 1 + (choccant p)
choccant (Addvaso p) = 0 + (choccant p)
choccant (Addcafe p) = 0 + (choccant p)

vasocant Vacia = 0
vasocant (Addvaso p) = 1 + (vasocant p)
vasocant (Addcafe p) = 0 + (vasocant p)
vasocant (Addchoc p) = 0 + (vasocant p)

addccafe 0 p = "Debe ingresar otra cantidad"
addccafe n Vacia = Addcafe (addccafe (n-1) Vacia)
addccafe n p = Addcafe (addccafe (n-1) p)

addcchoc 0 p = "Debe ingresar otra cantidad"
addcchoc n Vacia = Addchoc (addcchoc (n-1) Vacia)
addcchoc n p = Addchoc (addcchoc (n-1) p)

addcvaso 0 p = "Debe ingresar otra cantidad"
addcvaso n Vacia = Addvaso (addcvaso (n-1) Vacia)
addcvaso n p = Addvaso (addcvaso (n-1) p)


 instance MC Eq where
 	Addcafe(Addchoc(m)) = Addchoc(Addcafe(m))
 	Addchoc(Addvaso(m)) = Addvaso(Addchoc(m))
 	Addvaso(Addcafe(m)) = Addcafe(Addvaso(m))


















                                                                                                                                                                                                                                                                                                                                                                                                                                                   Documents/programs/TADS/TADNatural.hs                                                               0000644 0001750 0001750 00000002117 13456626621 016373  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                   
module TADNatural (Natural,c,suc,mas,por,pot,men,menig,may,mayig,ig) where
    
    data Natural= Cero
                | Sucesor Natural

-- Operaciones
mas:: Natural -> Natural -> Natural
por, pot :: Natural -> Natural -> Natural
ig, may, mayig, men, menig, ig :: Natural -> Natural -> Bool

-- Ecuaciones

Cero `mas` x = x
Sucesor x `mas` y = Sucesor (x`mas`y)

Cero `por` x = Cero
Sucesor Cero `por` x = x
Sucesor x `por`y = Sucesor (x`por`y)

Cero `pot` Cero = "Indeterminado"
x `pot` Cero = Sucesor Cero
Sucesor x `pot` y = Sucesor (x`pot`y)

Cero `ig` Cero = True
Sucesor x `ig` Sucesor y = x `ig` y

Sucesor x `may` Cero = True
Sucesor x `may` y = Sucesor (x `may` y)

Cero `mayig` Cero = True
Sucesor x `mayig` Cero = True
Sucesor x `mayig` y | x `may` y = True    
                    | Sucesor x `ig` y = True
                    | otherwise = False

Sucesor x `men` Cero = False
Sucesor x `men` y = x `men` y

Cero `menig` Cero = True
Sucesor x `menig` Cero = False
Sucesor x `menig` y | x `men` y = True
                    | Sucesor x `ig` y = True
                    | otherwise = False
                                                                                                                                                                                                                                                                                                                                                                                                                                                 Documents/programs/TADS/TADTablero.hs                                                               0000664 0001750 0001750 00000003257 13457330313 016354  0                                                                                                    ustar   jero                            jero                                                                                                                                                                                                                   -- TADTablero
module TADTablero (Tablero, ptoA, ptoB, tabes_cero, scoredA, scoredB, winA, winB, emp, bonusA, bonusB, castigoA, castigoB) where

-- CONSTRUCTORES
	data Tablero = Inicial
	                  | PtoA (Tablero)
                      | PtoB (Tablero)

    Inicial = start
    PtoA = puntoA
    PtoB = puntoB

-- OPERACIONES
    tab_cero, scoredA, scoredB, winA, winB, emp :: Tablero -> Bool
    bonusA, bonusB, castigoA, castigoB :: Nat -> Tablero -> Tablero

-- ECUACIONES

    tab_cero Inicial = True
    tab_cero PtoA p  = False
    tab_cero PtoB p  = False

    scoredA Inicial = False
    scoredA PtoA p = True
    scoredA PtoB p = scoredA p

    scoredB Inicial = False
    scoredB PtoB p = True
    scoredB PtoA p = scoredB p    

    ctaptoA :: Tablero -> Nat
    ctaptoA Inicial = 0
    ctaptoA PtoA p = 1 + (ctaptoA p)
    ctaptoA PtoB p = 0 + (ctaptoA p)

    ctaptoB :: Tablero -> Nat
    ctaptoB Inicial = 0
    ctaptoB PtoB p = 1 + (ctaptoB p)
    ctaptoB PtoA p = 0 + (ctaptoB p)

    winA Inicial = False
    winA p | (ctaptoA p) > (ctaptoB p) = True
           | otherwise = False  

    winB Inicial = False
    winB p | (ctaptoB p) > (ctaptoA) = True
           | otherwise = False

    emp Inicial = True
    emp p | (ctaptoA p) == (ctaptoB p) = True
          | otherwise = False
    
    bonusA 0 p = p
    bonusA n p = PtoA (bonusA (n-1) p)

    bonusB 0 p = p
    bonusB n p = PtoB (bonusB (n-1) p)

    castigoA 0 p = p
    castigoA n Inicial = Inicial
    castigoA n PtoA p = castigoA (n-1) p
    castigoA n PtoB p = PtoB (castigoA n p)

    castigoB 0 p = p
    castigoB n Inicial = Inicial
    castigoB n PtoB p = castigoB (n-1) p
    castigoB n PtoA p = PtoA (castigoB n p)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 