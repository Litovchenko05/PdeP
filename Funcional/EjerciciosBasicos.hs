{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant /=" #-}
{-# HLINT ignore "Eta reduce" #-}
import Distribution.Compat.Prelude (Bool(False))
import Data.Bool (Bool)
{-
Notas previas
    En algunos ejercicios se van a utilizar algunas de las funciones que están en el Prelude por ej: 
    mod 20 3 = 2	el resto de la división entre 20 y 3 es 2. 
    div 14 3 = 4	parte entera de la división entre 14 y 3 es 4. 
    max 8 10 = 10	devuelve el max entre 2 números. 
    min 9 15 = 9	devuelve el min entre 2 números. 
-}

-- Básicos
{-
1. Definir la función esMultiploDeTres/1, que devuelve True si un número es múltiplo de 3, por ejemplo: 
Main> esMultiploDeTres 9 
True 
-}

esMultiploDeTres :: Int -> Bool
esMultiploDeTres x = mod x 3 == 0


{-
2. Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero, p.ej. 
Main> esMultiploDe 3 12
True
-}

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = mod y x == 0 

{-
3. Definir la función cubo/1, devuelve el cubo de un número
-}

cubo :: Int -> Int
cubo x = x*x*x

{-
4. Definir la función area/2, devuelve el área de un rectángulo a partir de su base y su altura
-}

area :: Float -> Float -> Float
area base altura = base * altura

{-
5. Definir la función esBisiesto/1, indica si un año es bisiesto. 
(Un año es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100) 
Nota: Resolverlo reutilizando la función esMultiploDe/2
-}

esBisiesto :: Int -> Bool
esBisiesto anio = esMultiploDe 400 anio || (esMultiploDe 4 anio && (esMultiploDe 100 anio /= True))

{-
6. Definir la función celsiusToFahr/1, pasa una temperatura en grados Celsius a grados Fahrenheit
-}

celsiusToFahr :: Float -> Float
celsiusToFahr grados = (grados * (9/5)) + 32

{-
7. Definir la función fahrToCelsius/1, la inversa de la anterior
-}

fahrToCelsius :: Float -> Float
fahrToCelsius grados = (grados - 32) / (9/5)

{-
8. Definir la función haceFrioF/1, indica si una temperatura expresada en grados Fahrenheit es fría. 
Decimos que hace frío si la temperatura es menor a 8 grados Celsius.
-}

haceFrioF :: Float -> Bool
haceFrioF grados = fahrToCelsius grados <8


{-
9. Definir la función mcm/2 que devuelva el mínimo común múltiplo entre dos números, de acuerdo a esta fórmula. 
m.c.m.(a, b) = {a * b} / {m.c.d.(a, b)}
Nota: Se puede utilizar gcd
-}

mcm :: Int -> Int -> Int
mcm x y = div (x * y) (gcd x y)


{-
10. Dispersión
Trabajamos con tres números que imaginamos como el nivel del río Paraná a la altura de Corrientes medido en tres días consecutivos; cada medición es un entero que representa una cantidad de cm. 
P.ej. medí los días 1, 2 y 3, las mediciones son: 322 cm, 283 cm, y 294 cm. 
A partir de estos tres números, podemos obtener algunas conclusiones. 
Definir estas funciones: 

A. dispersion, que toma los tres valores y devuelve la diferencia entre el más alto y el más bajo. Ayuda: extender max y min a tres argumentos, usando las versiones de dos elementos. De esa forma se puede definir dispersión sin escribir ninguna guarda (las guardas están en max y min, que estamos usando). 

B. diasParejos, diasLocos y diasNormales reciben los valores de los tres días. Se dice que son días parejos si la dispersión es chica, que son días locos si la dispersión es grande, y que son días normales si no son ni parejos ni locos. Una dispersión se considera chica si es de menos de 30 cm, y grande si es de más de un metro. 
Nota: Definir diasNormales a partir de las otras dos, no volver a hacer las cuentas. 
-}

dispersion :: Int -> Int -> Int -> Int
dispersion medida1 medida2 medida3 = max medida1 (max medida2 medida3) - min medida1 (min medida2 medida3)

diasParejos :: Int -> Int -> Int -> Bool
diasParejos medida1 medida2 medida3 = dispersion medida1 medida2 medida3 < 30

diasLocos :: Int -> Int -> Int -> Bool
diasLocos medida1 medida2 medida3 = dispersion medida1 medida2 medida3 > 100


{-
11. En una plantación de pinos, de cada árbol se conoce la altura expresada en cm. El peso de un pino se puede calcular a partir de la altura así: 3 kg x cm hasta 3 metros, 2 kg x cm arriba de los 3 metros. P.ej. 2 metros ⇒  600 kg, 5 metros ⇒  1300 kg. 
Los pinos se usan para llevarlos a una fábrica de muebles, a la que le sirven árboles de entre 400 y 1000 kilos, un pino fuera de este rango no le sirve a la fábrica. Para esta situación: 
Definir la función pesoPino, recibe la altura de un pino y devuelve su peso. 
Definir la función esPesoUtil, recibe un peso en kg y devuelve True si un pino de ese peso le sirve a la fábrica, y False en caso contrario. 
Definir la función sirvePino, recibe la altura de un pino y devuelve True si un pino de ese peso le sirve a la fábrica, y False en caso contrario. Usar composición en la definición. 
-}

pesoPino :: Float -> Float
pesoPino altura = if altura <= 300 then 3 * altura else (3 * 300) + ((altura - 300) * 2)

esPesoUtil :: Float -> Bool
esPesoUtil peso = peso > 400 && peso < 1000

sirvePino :: Float -> Bool
sirvePino altura = (esPesoUtil . pesoPino) altura


{-
12. Implementar la función esCuadradoPerfecto/1, sin hacer operaciones con punto flotante. 
Ayuda: les va a venir bien una función auxiliar, tal vez de dos parámetros. 
Pensar que el primer cuadrado perfecto es 0, para llegar al 2do (1) sumo 1, para llegar al 3ro (4) sumo 3, para llegar al siguiente (9) sumo 5, después sumo 7, 9, 11 etc.. 
También algo de recursividad van a tener que usar.
-}

