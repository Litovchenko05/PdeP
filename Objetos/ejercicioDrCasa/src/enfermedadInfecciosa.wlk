import Objetos.ejercicioDrCasa.src.enfermedad.*

class EnfermedadInfecciosa inherits Enfermedad {

    override method esAgresivoPara(paciente) = self.celulasAmenazadas() > paciente.celulas() * 0.1

    override method afectar(paciente) {
        paciente.aumentarTemperatura(celulasAmenazadas/1000)
    }

    method reproducirse() {
        celulasAmenazadas *= 2
    }
}