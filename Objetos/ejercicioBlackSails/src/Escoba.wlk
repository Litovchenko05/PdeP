class Escoba {
    const longitud
    const cerdas

    method dañoBase() = 2 * longitud
    method daño() = cerdas.dañoModificado(self.dañoBase())
}

object cerdasDePaja {
    method dañoModificado(dañoBase) = dañoBase * 2
}

object cerdasDePlastico {
    method dañoModificado(dañoBase) = dañoBase * 0.33
}

object cerdasDeAlambre {
    method dañoModificado(dañoBase) = dañoBase * 10
}