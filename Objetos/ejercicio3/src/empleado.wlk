import Objetos.ejercicio3.src.categoria.*
import Objetos.ejercicio3.src.bonoPresentismo.*
import Objetos.ejercicio3.src.bonoResultados.*

object pepe {
    var categoria = gerente 
    var bonoPresentismo = bonoPresentismoNulo
    var bonoResultados = bonoResultadosNulo
    var faltas = 0

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

    //setters
    method categoria(nuevaCategoria) {
        categoria = nuevaCategoria
    }

    method bonoPresentismo(nuevoBono) {
        bonoPresentismo = nuevoBono
    }

    method bonoResultados(nuevoBono) {
        bonoResultados = nuevoBono
    }

    method faltas(nuevasFaltas) {
        faltas = nuevasFaltas
    }
}