// 1

object galvan {
    var sueldo = 15000 // o 0 ?
    var deuda = 0
    var dinero = 0

    // getters
    method sueldo() = sueldo

    method dinero() = dinero

    method deuda() = deuda

    // setter - permite un cambio de sueldo de Galván 
    method sueldoNuevo(_sueldoNuevo){
        sueldo = _sueldoNuevo
    }

    // Cuando cobra un sueldo, Galván paga sus deudas. Si sobra algo, se suma al dinero que tiene.
    method cobrarSueldo() {
        if ( ( self.sueldo() - deuda ) > 0) {
            dinero = self.sueldo() - deuda + dinero
            deuda = 0 // lo reinicio en 0
        } else {
            deuda = deuda - self.sueldo()
        }
    }

    // finanzas galvan
    // Cuando Galván gasta, se descuenta de su dinero, si no le alcanza aumenta la deuda. 
    method gastar(monto) {
        if ( self.dinero() >= monto){
            dinero = dinero - monto
        } else {
            deuda = deuda + (monto - dinero)
            dinero = 0 // lo reinicio en 0
        }
    }
}

object baigorria {
    var empanadasVendidas = 0 //cant.
    const precioEmpanadas = 15
    var totalSueldoCobrado = 0

    //getters
    method empanadasVendidas() = empanadasVendidas

    method totalSueldoCobrado() = totalSueldoCobrado

    method venderEmpanadas(cantidad) {
        empanadasVendidas = empanadasVendidas + cantidad
    }

    method sueldo() = empanadasVendidas * precioEmpanadas

    method cobrarSueldo() {
        totalSueldoCobrado = totalSueldoCobrado + self.sueldo()
        empanadasVendidas = 0 // actualizo contador de empanadas vendidas x mes
    }
}


object gimenez {
    var fondoParaSueldos = 300000

    // getter
    method fondoParaSueldos() = fondoParaSueldos

    method pagarSueldo(empleado) {
        fondoParaSueldos = fondoParaSueldos - empleado.sueldo()
        empleado.cobrarSueldo() // corresponde a este objeto ?
    }

}