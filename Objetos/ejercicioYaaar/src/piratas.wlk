import Objetos.ejercicioYaaar.src.misiones.*
import Objetos.ejercicioYaaar.src.barcos.*


class Pirata {
    var nivelDeEbriedad
    var dinero
    const items = []

    method dinero() = dinero

    method nivelDeEbriedad() = nivelDeEbriedad 

    method esUtilPara(mision) = mision.esUtil(self)

    method tiene(item) = items.contains(item) 

    method seAnimaASaquear(victima) = victima.esSaqueablePor(self)
}