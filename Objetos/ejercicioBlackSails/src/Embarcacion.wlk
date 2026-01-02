import Objetos.ejercicioBlackSails.src.Canion.*
import Objetos.ejercicioBlackSails.src.Tripulante.*

class Embarcacion {
    var capitan
    var contramaestre
    const tripulacion
    const cantidadDeCañones
    var ubicacion
    var botin

    method poderDeDaño() = self.corajeTotalDeTripulantes() + self.poderTotalDeCañones()

    method poderTotalDeCañones() = cantidadDeCañones * Canion.daño()

    method corajeTotalDeTripulantes() = self.todaLaTripulacion().sum({tripulante => tripulante.corajeTotal(self)})

    method todaLaTripulacion() = [capitan, contramaestre] + tripulacion

    method tripulanteBajoRangoMasCorajudo() = tripulacion.max({tripulante => tripulante.corajeTotal(self)})

    method motin() {
        if(capitan.corajeTotal(self) >= contramaestre.corajeTotal(self)){
            self.motinFallido()
        } else {
            self.motinExitoso()
        }
    }

    method motinExitoso() {
        self.capitan(contramaestre)
        self.contramaestre(self.tripulanteBajoRangoMasCorajudo())
    }

    method capitan(tripulante) {
        tripulante.capitanizarse()
        capitan = tripulante
    }

    method contramaestre(tripulante) {
        tripulante.contramaestrizarse()
        contramaestre = tripulante
    }
}   