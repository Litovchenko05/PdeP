import Data.Monoid (Sum(Sum))
-- 1)
data Guerrero = Guerrero {fatiga :: Float, 
                          ki     :: Float, 
                          personalidad :: Personalidad}

type Ejercicio = (Guerrero -> Guerrero)

flexionesDeBrazo :: Ejercicio
flexionesDeBrazo guerrero = Guerrero {fatiga = fatiga guerrero + 50}

saltosAlCajon :: Float -> Ejercicio
saltosAlCajon altura guerrero = Guerrero {fatiga = fatiga + (altura / 5), ki = ki + (altura / 10)}

snatch :: Ejercicio
snatch guerrero | esExperimentado guerrero = guerrero{fatiga = fatiga * 1.1, ki = ki * 1.05}
                | otherwise = guerrero{fatiga = fatiga + 100}

esExperimentado :: Guerrero -> Bool
esExperimentado guerrero = ki guerrero > 22000

estaCansado :: Guerrero -> Bool
estaCansado guerrero = fatiga guerrero > ki guerrero * 0.44

estaExhausto :: Guerrero -> Bool
estaExhausto guerrero = fatiga guerrero > ki guerrero * 0.72

realizarEjercicio :: Ejercicio -> Guerrero -> Guerrero
realizarEjercicio ejercicio guerrero | estaExhausto guerrero = Guerrero {fatiga = fatiga + aumentoDeFatiga guerrero (ejercicio guerrero), ki = ki * 0.98}
                                     | estaCansado guerrero = Guerrero {fatiga = fatiga + (4 * aumentoDeFatiga guerrero (ejercicio guerrero)), ki = ki + (2 * aumentoDeKi guerrero (ejercicio guerrero))}
                                     | otherwise = ejercicio guerrero
                                    
aumentoDeFatiga :: Guerrero -> Guerrero -> Float
aumentoDeFatiga guerreroOriginal guerreroEntrenado = fatiga guerreroEntrenado - fatiga guerreroOriginal

aumentoDeKi :: Guerrero -> Guerrero -> Float
aumentoDeKi guerreroOriginal guerreroEntrenado = ki guerreroEntrenado - ki guerreroOriginal


-- 2)
descansar :: Int -> Guerrero
descansar minutos guerrero = Guerrero {fatiga = fatiga - Sum[1..minutos]}

-- 3)
descansoOptimo :: Guerrero -> Int
descansoOptimo guerrero = length . takeWhile estaCansado . map (flip descansar guerrero) $ [0..]