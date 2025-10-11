import Objetos.ejercicioDrCasa.src.enfermedad.*
class EnfermedadAutoinmune inherits Enfermedad {
    var diasAfectados = 0
    

    override method esAgresivoPara(paciente) = diasAfectados > 30

    override method afectar(paciente) {
        paciente.destruirCelulas(celulasAmenazadas)
        diasAfectados += 1
    }
}