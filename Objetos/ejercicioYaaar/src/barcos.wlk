import Objetos.ejercicioYaaar.src.victima.*
import Objetos.ejercicioYaaar.src.piratas.*

class Barco inherits Victima{
    var mision
    const capacidad
    var tripulantes

    method tripulantes() = tripulantes

    method esTemible() = mision.puedeSerRealizadaPor(self)

    method tieneSuficienteTripulacion() = tripulantes.size() >= (capacidad * 0.9)

    override method esVulnerable(barco) = self.tripulantes() <= barco.tripulantes() 

    override method esSaqueablePor(pirata) = pirata.nivelDeEbriedad() >= 90 
}