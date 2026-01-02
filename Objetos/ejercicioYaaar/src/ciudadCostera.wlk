import Objetos.ejercicioYaaar.src.victima.*
import Objetos.ejercicioYaaar.src.barcos.*
import Objetos.ejercicioYaaar.src.piratas.*

object ciudadCostera inherits Victima{
    var property habitantes = 1000

    override method esVulnerable(barco) = (barco.tripulantes() >= (self.habitantes() * 0.4)) or barco.pasadoDeGrogXD()

    override method esSaqueablePor(pirata) = pirata.nivelDeEbriedad() >= 50 
}