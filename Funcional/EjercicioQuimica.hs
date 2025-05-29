{-
1. Modelar las siguientes sustancias:
    a. El hidrógeno y el oxígeno 
    b. El agua, sustancia compuesta por 2 hidrógenos y 1 oxígeno.
-}

data Sustancia 
    = Elemento String String Int Grupo 
    | Compuesto String [(Sustancia, Int)] Grupo deriving (Show, Eq) 

hidrogeno = Elemento "Hidrogeno" "H" 1 NoMetal

oxigeno = Elemento "Oxigeno" "O" 8 NoMetal

agua = Compuesto "Agua" [(hidrogeno, 2),(oxigeno, 1)]

{-
2. Obtener el nombre de unión de un elemento. Esto se logra añadiendo "uro" al final del nombre, pero solo si el nombre termina en consonante. 
Si termina en vocal, se busca hasta la última consonante y luego sí, se le concatena "uro". 
Por ejemplo, el nombre de unión del Fluor es "fluoruro", mientras que el nombre de unión del mercurio es "mercururo".
-}


nombreDeUnion :: Sustancia -> String
nombreDeUnion elemento = sinVocalesAlFinal (nombre elemento) ++ "uro"

esVocal 'a' = True
esVocal 'e' = True
esVocal 'i' = True
esVocal 'o' = True
esVocal 'u' = True
esVocal _ = False

sinVocalesAlFinal :: String -> String
sinVocalesAlFinal = reverse . dropWhile esVocal . reverse

nombre :: Sustancia -> String
nombre (Elemento unNombre _ _ _ ) = unNombre
nombre (Compuesto unNombre _ _) = unNombre


{-
3. Poder saber si una sustancia conduce bien según un criterio. Los criterios actuales son electricidad y calor, pero podría haber más. 
Los metales conducen bien cualquier criterio, sean compuestos o elementos. 
Los elementos que sean gases nobles conducen bien la electricidad, y los compuestos halógenos conducen bien el calor. 
Para el resto, no son buenos conductores.
-}

data Grupo 
    = Metal 
    | NoMetal 
    | GasNoble 
    | Halogeno
    deriving (Show, Eq)

conduceBienElectricidad :: Sustancia -> Bool
conduceBienElectricidad (Elemento unNombre _ _ grupo)
    | grupo == Metal = True
    | grupo == GasNoble = True
    | otherwise = False
    

conduceBienElectricidad (Compuesto unNombre _ grupo)
    | grupo == Metal = True
    | otherwise = False

conduceBienCalor :: Sustancia -> Bool
conduceBienCalor (Elemento unNombre _ _ grupo)
    | grupo == Metal = True
    | otherwise = False

conduceBienCalor (Compuesto unNombre _ grupo)
    | grupo == Metal = True
    | grupo == Halogeno = True
    | otherwise = False


{-
4. Combinar 2 nombres. Al nombre de unión del primero lo concatenamos con el segundo, agregando un " de " entre medio. 
Por ejemplo, si combino "cloro" y "sodio" debería obtener "cloruro de sodio".
-}

combinarNombres :: Sustancia -> Sustancia -> String
combinarNombres sustancia1 sustancia2 = nombre sustancia1 ++ " de " ++ nombre sustancia2


{-
5. Mezclar una serie de componentes entre sí. El resultado de dicha mezcla será un compuesto. Sus componentes serán los componentes mezclados. 
El nombre se forma de combinar los nombres de la sustancia de cada componente. La especie será, arbitrariamente, un no metal.
-}
 
