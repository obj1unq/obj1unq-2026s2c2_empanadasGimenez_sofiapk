// 1

object galvan {
    var sueldo = 15000

    // getter
    method sueldo() = sueldo

    // setter - permite un cambio de sueldo de Galván ?
    method sueldoNuevo(_sueldoNuevo){
        sueldo = _sueldoNuevo
    }

    method cobrarSueldo() {
      
    }
}

object baigorria {
    var empanadasVendidas = 0 //cant.
    var precioEmpanadas = 15

    //getter
    method empanadasVendidas() = empanadasVendidas

    method venderEmpanadas(cantidad) {
        empanadasVendidas = empanadasVendidas + cantidad
    }

    method sueldo() = empanadasVendidas * precioEmpanadas

    method cobrarSueldo() {
      
    }
}


object gimenez {
    var fondoParaSueldos = 300000

    // getter
    method fondoParaSueldos() = fondoParaSueldos

    method pagarSueldo(empleado) {
        fondoParaSueldos = fondoParaSueldos - empleado.sueldo()
    }

}