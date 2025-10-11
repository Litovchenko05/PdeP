object zarate {
  method km() {
        return 88
  }
  method distanciaDesde(lugar) {
        return (self.km() - lugar.km()).abs()
  }
}

object jesusMaria {
  method km() {
        return 751
  }
  method distanciaDesde(lugar) {
        return (self.km() - lugar.km()).abs()
  }
}