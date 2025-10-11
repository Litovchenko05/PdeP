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