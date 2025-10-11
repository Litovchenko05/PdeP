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