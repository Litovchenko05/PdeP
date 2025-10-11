class Enfermedad {
    var celulasAmenazadas

    method celulasAmenazadas() = celulasAmenazadas

    method atenuarse(cantidad) {
        celulasAmenazadas = (celulasAmenazadas - cantidad).max(0)
    }

    method afectar(paciente)

    method esAgresivoPara(paciente)
}

