import Objetos.ejercicioTamagotchi.src.tamagotchi.*
import Objetos.ejercicioTamagotchi.src.juguete.*
object hambriento {

    method comer(tamagotchi) {
        tamagotchi.ponerseContento()
    }

    method jugar(juguete, tamagotchi) {
        juguete.serJugadoHambriento(tamagotchi)
    }
}

object contento {

    method comer(tamagotchi) {
        tamagotchi.aumentarFelicidad(1)
    }

    method jugar(juguete, tamagotchi) {
        juguete.serJugadoContento(tamagotchi)
        if (tamagotchi.cantidadDeJuegos() === 3){
            tamagotchi.ponerseHambriento()
            tamagotchi.reiniciarCantidadDeJuegos()
        } else {
            tamagotchi.aumentarCantidadDeJuegos(1)
        }
    }
}

object triste {

    method comer(tamagotchi) {
        if(tamagotchi.vecesAlimentado() === 3){
            tamagotchi.ponerseContento()
            tamagotchi.reiniciarVecesAlimentado()
        } else {
            tamagotchi.aumentarVecesAlimentado(1)
        }
    }

    method jugar(juguete, tamagotchi) {
        tamagotchi.ponerseContento()
        juguete.aumentarDaño(tamagotchi.felicidad())
    }
}