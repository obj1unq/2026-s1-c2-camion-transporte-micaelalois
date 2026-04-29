object knightRider {
	method peso() {
		 return 500 
		 }
	method nivelPeligrosidad() { 
		return 10 
		}
}

object arenaAGranel{
	var peso = 0
	 method peso(){
		return peso
	 }
	 method cambiarPeso(_cantidad){
		peso = _cantidad
	 }
	 method nivelPeligrosidad(){
		return 1
	 }


}
object bumblebee{
	var modo =  auto

	method modo(){
		return modo
	}

	method cambiarModo(_modo){
		modo = _modo
	}
	method peso(){
		return 800
	}
	method nivelPeligrosidad(){
		return (self.modo().nivelDePeligrosidad())
	}
}
 
 //MODOS DE BUMBLEBEE//
object auto{
	method nivelPeligrosidad (){
		return 15
	}
}

object robot{
	method nivelPeligrosidad(){
		return 30
	}
}


object paqueteDeLadrillos{
	var cantidadDeLadrillosDelPaquete = 0

	method cantidadDeLadrillosDelPaquete(){
		return cantidadDeLadrillosDelPaquete
	}

	method cambiarCantidadDeLadrillosDelPaquete(_cantidad){
		cantidadDeLadrillosDelPaquete= _cantidad 

	}
	method peso(){
		return (cantidadDeLadrillosDelPaquete *2)

	}
	method nivelPeligrosidad(){
		return 2
	}
}

object bateriaAntiaerea{
	var contieneMisiles = true
	method contieneMisiles(){
		return contieneMisiles
	}

	method ponerMisiles(){
		contieneMisiles = true
	}

	method sacarMisiles(){
		contieneMisiles = false 
	}

	
	method peso(){
		return (if (contieneMisiles) 300 else 200)
       
	}
}

object residuosRadioactivos{
	var peso = 0

method peso(){
	return peso

}

method cambiarPeso(_peso){
	peso = _peso
}

method nivelPeligrosidad(){
	return 200
}

}


