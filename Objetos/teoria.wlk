// unObjeto.unMensaje()
/*
    Conceptos:
    . Objeto
    . Mensaje
    . Método
    . Atributo
    . Inmutabilidad
    . Identidad
    . Getter
    . Setter
    . Tipado Dinámico
*/
object laika { // Un objeto es una cosa que hace cosas
    var energia = 100 // Podriamos considerar como que asigno 100 a "energia" pero en realidad lo que sucede es que laika referencia a 100 mediante "energia" 
    // Los numeros son inmutables, las variables simplemente los referencian
    const raza = "salchicha"
    // "energia" y "raza" son atributos de laika
    
    method ladrar() { // Un metodo es una accion asociada al objeto, "ladrar" es un metodo con valor
        return "Guau!"
    }

    method salirAPasear() { // "salirAPasear" es un metodo con acción
        energia -= 20
    }
    // Una buena práctica IMPORTANTE es que, un método devuelve un valor, o realiza una accion, pero no ambas
    // Los metodos que devuelvan algo (de valor) tienen que ser sustantivos
    // Los metodos con efecto (de efecto) tienen que estar en infinitivo
    // Hay que usar camelCase
    method raza(){ // Esto es un getter, el getter se tiene que llamar igual que su atributo
        return raza
    }

    method energia() { //getter de "energia"
        return energia
    }

    method energia(nuevaEnergia) { //setter de "energia", los setter tambien se tienen que llamar igual que el atributo
        energia = nuevaEnergia
    }
    // Ambos metodos "energia" son distintos, ya que tienen una aridad distinta
}
// Nunca arrancar a modelar un objeto por sus atributos

object joaco {
    const mascota = laika
    var energia = 100
    
    method salirAPasear() {
        mascota.salirAPasear()
        energia -= 20
    }

    method comer(cantidadComida) {
        energia += cantidadComida
    }

    method hacerRutina() {
        self.comer(100) // Cuando queremos mandar un mensaje desde un objeto al mismo objeto, usamos self
        self.salirAPasear() // self es una referencia implicita que tiene todo objeto hacia si mismo
    }
}

object ciro {
    var energia = 100
    const raza = "salchicha"

    method ladrido() {
        return "guauuu!"
    } 

    method salirAPasear() {
        energia -= 20
    }

    method raza() {
        return raza
    }
}

// no es lo mismo utilizar == y ===, == es semejanza, === es identidad
// wko "well known objects", son objetos que son conocidos, objetos que estan definidos como "object" y son globales
// estado interno: conjunto de atributos de un objeto
// interfaz: conjunto o subconjunto de mensajes que entiende un objeto
// lo unico que puede saber un objeto de otro objeto es su INTERFAZ
// los objetos son inmutables, lo unico que puede cambiar es su estado interno
// Objeto: Representacion computacional de un ente que exhibe comportamiento
// Quiero que un objeto entienda tal mensaje, entonces creo un metodo con el mismo nombre