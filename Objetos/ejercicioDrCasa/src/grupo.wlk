object grupoA {
    method puedeDonarleA(otroGrupo) = #{self, grupoAB}.contains(otroGrupo) 
}

object grupoB {
    method puedeDonarleA(otroGrupo) = #{self, grupoAB}.contains(otroGrupo)
}

object grupoO {
    method puedeDonarleA(otroGrupo) = #{self, grupoA, grupoB, grupoAB}.contains(otroGrupo) 
}

object grupoAB {
    method puedeDonarleA(otroGrupo) = false
}