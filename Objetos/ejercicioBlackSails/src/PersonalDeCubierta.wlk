import Objetos.ejercicioBlackSails.src.Tripulante.*
import Objetos.ejercicioBlackSails.src.Espada.*
import Objetos.ejercicioBlackSails.src.Pistola.*
import Objetos.ejercicioBlackSails.src.Escoba.*
import Objetos.ejercicioBlackSails.src.Cuchillo.*
class PersonalDeCubierta inherits Tripulante{
    var armas = [new Cuchillo(), new Escoba(cerdas = cerdasDePaja, longitud = 50)]

    override method corajeTotal(embarcacion) = corajeBase
}