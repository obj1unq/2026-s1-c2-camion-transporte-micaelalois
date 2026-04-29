import cosas.*

object camion {
	const property cosas = #{}

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
