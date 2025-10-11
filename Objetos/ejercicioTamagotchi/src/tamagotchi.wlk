import Objetos.ejercicioTamagotchi.src.estado.*

object tamagotchi {
    var property estado = contento
    var nivelFelicidad = 0
    var vecesAlimentado = 0
    var cantidadDeJuegos = 0

    method comer() {
        estado.comer(self)
    }

    method jugar(juguete) {
        estado.jugar(juguete, self)
    }

    method ponerseContento(){
        self.estado(contento)  
    }

    method ponerseTriste() {
        self.estado(triste) 
    }

    method ponerseHambriento() {
        self.estado(hambriento) 
    }

    method felicidad() {
        return nivelFelicidad
    }

    method aumentarFelicidad(incremento){
        nivelFelicidad += incremento
    }

    method disminuirFelicidad(decremento) {
        nivelFelicidad -= decremento
    }

    method vecesAlimentado(){
        return vecesAlimentado
    }

    method aumentarVecesAlimentado(incremento) {
        vecesAlimentado += incremento
    }

    method reiniciarVecesAlimentado() {
        vecesAlimentado = 0
    }

    method cantidadDeJuegos() {
        return cantidadDeJuegos
    }

    method aumentarCantidadDeJuegos(incremento) {
        cantidadDeJuegos += incremento
    }

    method reiniciarCantidadDeJuegos() {
        cantidadDeJuegos = 0
    }

}