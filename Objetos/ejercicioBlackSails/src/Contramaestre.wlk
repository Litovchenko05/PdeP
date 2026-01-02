import Objetos.ejercicioBlackSails.src.Tripulante.*
import Objetos.ejercicioBlackSails.src.Espada.*
import Objetos.ejercicioBlackSails.src.Pistola.*
import Objetos.ejercicioBlackSails.src.Escoba.*
import Objetos.ejercicioBlackSails.src.Cuchillo.*

class Contramaestre inherits Tripulante{
    const armas = [new Espada(complejidad = 30), new Espada(complejidad = 30), new Cuchillo()]

    override method corajeSegunRango(embarcacion) = 0.1 * embarcacion.corajeTotalTripulanteCargoBajo() 

    
}