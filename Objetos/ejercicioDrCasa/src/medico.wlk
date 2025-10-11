import Objetos.ejercicioDrCasa.src.persona.*
class Medico inherits Persona{
    const dosis

    method atender(paciente) {
        paciente.recibirMedicamento(dosis)
    }

    override method contraer(enfermedad) {
        super(enfermedad) //Aca vemos el uso de `super` en la redefinicion de metodo
        self.atender(self) //contraen la enfermedad como Persona y después intenta curarse, algo propio de la clase Medico
    }

}

