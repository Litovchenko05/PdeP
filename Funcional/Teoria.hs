{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}

-- siguiente : Z -> Z
siguiente x = x + 1

-- doble : R -> R
doble x = x * 2

-- mitad : R -> R
mitad x = x / 2 

-- multiplicar : R R -> R
multiplicar x y = x * y

masDos x = siguiente(siguiente x)

-- identidad : p -> p
identidad x = x


-- Se pueden componer funciones: F(G(x)) -> (F.G) x
dobleDelSiguiente unNumero = doble(siguiente unNumero)
dobleDelSiguienteV2 unNumero = (doble . siguiente) unNumero
dobleDelDobleDelSiguiente unNumero = (doble . doble . siguiente) unNumero

{-
    String -> Se usa comillas dobles " "
    Caracter -> Se usa comillas simples ' '

    El tipo de un dato es el conjunto de valores asociados a sus operaciones
-}


-- Forma de definir el tipado de la funcion
doble :: Float -> Float
multiplicar :: Float -> Float -> Float


-- Tipos de Datos
edadDeFede :: Int
edadDeFede = 37

nombreDeNacho :: String
nombreDeNacho = "Ignacio"

alturaDeLucho :: Float
alturaDeLucho = 1.75

existenPunteros :: Bool
existenPunteros = False

arroba :: Char
arroba = '@'

{-
    Restricciones de Tipo:
    Algo --> Num --> Fractional (Float, Double)
        |       |
        |       |--> Integral (Int, Integer)
        |       |
        |       |--> Conplex (No ordenable)
        |
        |
        |--> Ord --> Fractional
        |       |
        |       |--> Integral
        |       |
        |       |--> String, Char
        |
        |
        |--> Eq --> Todos
            
-}

-- La composición (.) tambien es una función, y su tipo es:  (b -> c) -> (a -> b) -> a -> c

-- (Ord a) significa "ordenable", ya que si planteamos una comparacion tiene que poderse comparar; los números complejos (Conplex) NO son ordenables 

-- Como interpretamos la "flechita gorda"?   Restriciones => Tipos

{-
    Orden de Presendencia
        1. Parentesis
        2. Aplicacion prefija (Funcion parametro parametro)
        3. Composición
        4. Exponente (^ y **)
        5. Producto y Cociente (* y /)
        6. Suma y Resta (+ y -)
        7. Comparación (>, <, <=, >=, ==, /=)
        8. Conjunción, Disyuncion (&&, ||)
        9. $ (Funcion $ Parametro)
-}

-- Las funciones que reciben funciones por parametros se llaman funciones de Orden Superior

-- Aplicación parcial: Cuando tenemos una funcion que espera 'n' parametros ('n' > 1) y le pasamos argumentos < 'n'
-- Un ejemplo de implementacion es la funcion desarrollada más abajo (diaDeSuerte)
encontrarBillete :: Int -> Int -> Int
encontrarBillete denominacion billetera = billetera + denominacion

comprarCaramelo :: Int -> Int
comprarCaramelo billetera = billetera - 50 

diaDeSuerte :: Int -> Int
diaDeSuerte billetera =  comprarCaramelo $ comprarCaramelo . encontrarBillete 20000 . encontrarBillete 10000 $ billetera


-- Las listas tiene que ser homogeneas
notas :: [Int]
notas = [9, 8, 4, 10]

{-
La función map itera una lista y le aplica la funcion a cada uno de sus elementos, devuelve otra lista con los resultados. 
Sintaxis: map funcion lista
 

Pensamiento TOPDOWN: Hay que pensar primero en la función más "fuerte", ¿Cual es mi problematica? Atacar eso, lo demás despues lo desarrollamos


La función filter filtra una lista segun una condición
Sintaxis: filter condicion lista


la función lambda es una función anómima, no tiene nombre y su sintaxis es: \x -> x * x
-}


{-
Haskell ve las funciones de otra manera:
    suma3 x y z = x + y + z
    suma3 = (\x -> \y -> \z -> x + y + z)
-}

{-
Currificacion: Toda funcion recibe solo un parametro y devuelve una nueva funcion que espera los restantes

Tuplas: Son como una lista pero podemos tener distintos tipos de datos

Type {alias} (type)
data {alias} = {alias} [definimos los tipos]

Recordar que data define un tipo de dato nuevo, pero Type le pone un alias (otra forma de llamarlo)
-}