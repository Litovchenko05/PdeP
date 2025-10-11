import Objetos.ejercicioDrCasa.src.enfermedad.*


class Persona {
    var temperatura = 36
    var celulas
    const enfermedades = #{}

    method celulas() = celulas 

    method contraer(enfermedad) {
        enfermedades.add(enfermedad)
    }

    method aumentarTemperatura(incremento) {
        temperatura = (temperatura + incremento).min(45)
    }

    method vivirUnDia() {
        enfermedades.forEach({enfermedad => enfermedad.afectar(self)})
      
    }

    method vivirDias(dias){
        dias.times({_ => self.vivirUnDia()})
    } 

    method cantidadCelulasAmenazadasPorEnfermedadesAgresivas() {
        return self.cuantasCelulasAmenazadasPor(self.enfermedadesAgresivas())
    }

    method enfermedadesAgresivas(){
        return enfermedades.filter({enfermedad => enfermedad.esAgresivoPara(self)}) 
    }

    method cuantasCelulasAmenazadasPor(coleccionEnfermedades) {
        return coleccionEnfermedades.sum({enfermedad => enfermedad.celulasAmenazadas()})
    }

    method enfermedadQueMasCelulasAfecta() {
        return enfermedades.max({enfermedad => enfermedad.celulasAmenazadas()})
    }

    method destruirCelulas(cantidad) {
        celulas = (celulas - cantidad).max(0)
    }

    method estaEnComa() {
        return temperatura == 45 or celulas < 1000000
    }

    method recibirMedicamento(dosis) {
        enfermedades.forEach({enfermedad => enfermedad.atenuarse(dosis * 15)})
        enfermedades.forEach({enfermedad => if(enfermedad.celulasAmenazadas() === 0){
            self.curarse(enfermedad)
        }})
    }

    method curarse(enfermedad) {
        enfermedades.remove(enfermedad)
    }

    method cantidadDeEnfermedades() = enfermedades.size()
}

