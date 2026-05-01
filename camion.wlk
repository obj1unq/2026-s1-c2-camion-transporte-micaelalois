import cosas.*

object camion {
	var property cosas = #{} //LO CAMBIÉ A VAR PARA QUE PUEDA CAMBIAR LA COLECCION A UNA VACÍA


method transportar(destino, camino){

	if (camino.soportaViajesDe(self)){
	destino.agregarCosasDe(self.cosas())
    cosas = #{}
	} else { self.error("No es posible realizar el viaje por este camino")
	}

}

method sufrirAccidente(){
	cosas().forEach({cosa => cosa.aplicarEfectoDeAccidente()})
}


method totalDeBultosTransportado(){
	return self.cosas().sum({cosa => cosa.bultosNecesariosParaSerTransportado()})
}
method pesoDeTodasLasCosas(){
	return self.cosas().map({cosa => cosa.peso()}) //MAP HACE RECORRIDO DE TRANSFORMACIÓN
}

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


object almacen{
   var cosas= [] ///Lo dejo en lista por si en algún momento pregunta en que orden llegaron las cosas


method agregarCosas(_cosa){
	cosas = cosas.add(_cosa)
}

method cosas(){
	return cosas
}

method agregarCosasDe(listaDeOtroObjeto){
	cosas = listaDeOtroObjeto. addall() //YA QUE SI USO COPY LO REEMPLAZA SIEMPRE Y NO AGREGA LO NUEVO
}

}

object ruta9{

method soportaViajesDe(unVehiculo){
    return 	unVehiculo.puedeCircularEnRutaConNivelMaximo(20)
}

}

object caminosVecinales{
	var pesoMaximoPermitido = 0

	method pesoMaximoPermitido(){
		return pesoMaximoPermitido
	}

	method cambiarPesoMaximoPermitido(_peso){
		pesoMaximoPermitido = _peso
	}

	method soportaViajesDe(unVehiculo){
		return (unVehiculo.peso() < self.pesoMaximoPermitido())

	}

}