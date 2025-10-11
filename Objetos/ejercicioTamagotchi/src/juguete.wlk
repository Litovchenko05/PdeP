import Objetos.ejercicioTamagotchi.src.tamagotchi.*
object pelota {
    var daño = 0 

    method daño() = daño

    method aumentarDaño(incremento) {
        daño += incremento
    }

    method serJugadoHambriento(tamagotchi) {
        tamagotchi.disminuirFelicidad(4)
    }

    method serJugadoContento(tamagotchi) {
        self.aumentarDaño(1)
        tamagotchi.aumentarFelicidad(5)
    }
}

object piedra {
    var daño = 0

    method daño() = daño

    method aumentarDaño(incremento) {
        daño += incremento
    }
    
    method serJugadoHambriento(tamagotchi) {
        tamagotchi.disminuirFelicidad(4)
    }

    method serJugadoContento(tamagotchi) {
        tamagotchi.ponerseTriste()
    }
}

object ratonDeGoma {
    var daño = 0

    method daño() = daño

    method aumentarDaño(incremento) {
        daño += incremento
    }
    
    method serJugadoHambriento(tamagotchi) {
        tamagotchi.ponerseContento()
    }

    method serJugadoContento(tamagotchi){
        tamagotchi.aumentarFelicidad(3)
        tamagotchi.ponerseHambriento()
    }
}