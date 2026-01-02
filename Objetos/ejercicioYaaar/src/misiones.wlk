import Objetos.ejercicioYaaar.src.barcos.*

class Mision {
    method puedeSerRealizadaPor(barco)

    method puedeCompletarsePor(barco) {
        barco.tieneSuficienteTripulacion()
    }
}

object busquedaDelTesoro {
    method esUtil(pirata) = self.cumpleCondiciones(pirata)

    method cumpleCondiciones(pirata) = 
        pirata.contains("brujula") and (pirata.contains("mapa") or pirata.contains("botellaGrogXD")) and (pirata.monedas() <= 5)

    method puedeSerRealizadaPor(barco) = self.algunoTiene(barco, "llaveDeCofre")

    method algunoTiene(barco, item) = barco.tripulantes().filter({tripulante => tripulante.tiene(item)}).size() > 0
}

// object convertirseEnLeyenda {
//     method esUtil(pirata) = //TODO 
// }

class Saqueo inherits Mision {
    const victima
    var dineroMaximo

    method esUtil(pirata) = (pirata.dinero() < dineroMaximo) and pirata.seAnimaASaquear(victima) 
    
    override method puedeSerRealizadaPor(barco) = victima.esVulnerable(barco)
}