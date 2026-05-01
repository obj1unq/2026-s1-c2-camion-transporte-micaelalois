import cosas.*

object camion {
	const property cosas = #{}


method sufrirAccidente(){
	cosas().forEach({cosa => cosa.aplicarEfectoDeAccidente()})
}

method pesoDeTodasLasCosas(){
	return self.cosas().map({cosa => cosa.peso()}) //MAP HACE RECORRIDO DE TRANSFORMACIÓN
}
]
method cosaConMayorPeso(){
	return if (cosas().isEmpty()){self.error("La colección está vacía")} // EL MAX NO SE USA SI ESTÁ VACIA LA COLECCION
	else  { self.cosas().max({cosa => cosa.peso()})}
}

method tieneAlgoQuePesaEntre(unNumero, otroNumero){
	return self.cosas().filter{cosa => cosa.peso().between(unNumero, otroNumero)}
}
method puedeCircularEnRutaConNivelMaximo(nivelMaximo){
	return (self.estaExcedidoDePeso().not() && self.hayCosasQueTenganUnPeligroMayorA(nivelMaximo).not())
}

  method cosasMasPeligrosaQue(unaCosa){
	return self.cosas().filter{cosa => cosa.nivelPeligrosidad()> unaCosa.nivelDePeligrosidad()}
}

   method hayCosasQueTenganUnPeligroMayorA(cantidad){
		return (self.cosas().any{cosa =>cosa.nivelPeligrosidad() > cantidad})
}

   method cosasQueTienenUnNivelMayorA(cantidad){
	return self.cosas().filter{cosa => cosa.nivelPeligrosidad() > cantidad}

}
   method cosaCargadaConNivelDePeligrosidad(nivel){
	return self.cosas().filter{cosa => cosa.nivelPeligrosidad() == nivel}
   }

	method estaExcedidoDePeso(){
		return (self.peso() > 2500)
	}

	method peso(){
		return 1000 + self.cosas().sum{cosa => cosa.peso()}
	}
		
	method hayAlgunaCosaQuePesa(cantidad){
		return (self.cosas().any{cosa =>cosa.peso() == cantidad})
	}
	method todasLasCosasTienenPesoPar(){
		return (self.cosas().all { cosa =>
	cosa.peso() % 2 ==0})
	}	
	method cosas(){
		return cosas
	}	

	method cargar(unaCosa) {
		if(!cosas.contains(unaCosa)){
		cosas.add(unaCosa) 
	    }
	}

	method descargar(unaCosa){
		if (cosas.contains(unaCosa)){
		cosas.remove(unaCosa)
		}
	}
}
