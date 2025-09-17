/* Preguntas para hacerse al resolver un ejercicio:
    1) De quién es la responsabilidad de ...?
    2) Quién tiene la información minima e indispensable para ...?
*/

//Ejercicio 1
object pepita {
    var energia = 100
    var ubicacion = zarate

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

object zarate {
  method km() {
        return 88
  }
  method distanciaDesde(lugar) {
        return (self.km() - lugar.km()).abs()
  }
}

object jesusMaria {
  method km() {
        return 751
  }
  method distanciaDesde(lugar) {
        return (self.km() - lugar.km()).abs()
  }
}


// Ejercicio 3
object pepe {
    const categoria = gerente 
    const bonoPresentismo = bonoPresentismoNulo
    const bonoResultados = bonoResultadosNulo
    const faltas = 0

    method neto(){
        return categoria.sueldo()
    }

    method bonoPresentismo() {
        return bonoPresentismo.sueldo(faltas)    
    }

    method bonoResultados() {
        return bonoResultados.sueldo(self.neto())
    }

    method sueldo() { 
        return self.neto() + self.bonoPresentismo() + self.bonoResultados()
    } 
}

object gerente {
  method sueldo() {
    return 1000
  }
}

object cadete {
    method sueldo() {
        return 1500
    }
}

object bonoPresentismoNulo {
    method sueldo(faltas) {
        return 0
    }
}

object bonoPresentismoPorFalta {
    method sueldo(faltas) {
        if (faltas == 0){
            return 100
        } else if (faltas == 1){
            return 50
        } else {
            return 0
        }
    }
}

object bonoResultadosNulo {
    method sueldo(sueldoBase) {
        return 0
    }
}

object bonoResultadosFijo {
    method sueldo(sueldoBase) {
        return 80
    }
}

object bonoResultadosSobreNeto {
    method sueldo(sueldoBase) {
        return (sueldoBase * 0.1)
    }
}