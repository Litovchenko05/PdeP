import Objetos.ejercicioBlackSails.src.Tripulante.*
class Oficial inherits Tripulante{
    const armas = []

    override method corajeSegunRango(embarcacion) = self.dañoTotalDeArmas()

    method dañoTotalDeArmas() = armas.sum({arma => arma.daño()}) 
}