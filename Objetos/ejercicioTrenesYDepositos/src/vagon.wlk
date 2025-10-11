class VagonPasajero {
    const largo
    const anchoUtil

    method pasajerosQuePuedeTransportar(){
        if(anchoUtil>2.5){
            return largo * 8
        } else {
            return largo * 10
        }
        
    }

    method pesoMaximo() = self.pasajerosQuePuedeTransportar() * 80 
}


class VagonCarga {
    const cargaMaxima

    method pesoMaximo() = cargaMaxima + 160
}