import Objetos.ejercicio1.src.lugar.*

object pepita {
    var energia = 100
    var ubicacion = jesusMaria

    method volar(kilometros) {
        energia -= (kilometros + 10)
    }

    method comer(gramos) {
        energia += (gramos * 4)
    }

    method ubicacion() { //getter
        return ubicacion
    }

    method ubicacion(nuevaUbicacion) { //setter
        ubicacion = nuevaUbicacion
    }

    method volarA(lugar) {
        const km = lugar.distanciaDesde(self.ubicacion())
        self.volar(km)        
        self.ubicacion(lugar) 
    }

    method puedeVolarA(lugar) {
        const energiaNecesaria = lugar.distanciaDesde(ubicacion) + 10
        return energiaNecesaria <= energia
    }
}