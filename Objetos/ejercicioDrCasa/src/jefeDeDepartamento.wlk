import Objetos.ejercicioDrCasa.src.medico.*
class JefeDeDepartamento inherits Medico{
    const subordinados

    override method atender(alguien) {
      subordinados.anyOne().atender(alguien)
    }
}