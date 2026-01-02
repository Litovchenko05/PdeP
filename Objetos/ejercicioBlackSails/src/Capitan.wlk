import Objetos.ejercicioBlackSails.src.Tripulante.*
class Capitan inherits Tripulante{
    const armas = []

    override method corajeSegunRango(embarcacion) = 0.05 * embarcacion.poderDeCañones()


}