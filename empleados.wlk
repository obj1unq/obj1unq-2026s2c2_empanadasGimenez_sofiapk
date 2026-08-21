// 1

object galvan {
    var sueldo = 15000 
    //var deuda = 0
    //var dinero = 0
    var saldo = 0

    // getters
    method sueldo() = sueldo

    method saldo() = saldo

    // setter - permite un cambio de sueldo de Galván 
    method sueldoNuevo(_sueldoNuevo){
        sueldo = _sueldoNuevo
    }

    method cobrarSueldo() {
        //if ( ( self.sueldo() - deuda ) > 0) {
        //    dinero = self.sueldo() - deuda + dinero
        //   deuda = 0 // lo reinicio en 0
        //} else {
        //    deuda = deuda - self.sueldo()
        //}
        saldo += self.sueldo()
    }

    method deuda() = saldo.min(0).abs()

    method gastar(monto) {
        //if ( self.dinero() >= monto){
        //    dinero = dinero - monto
        //} else {
        //    deuda = deuda + (monto - dinero)
        //    dinero = 0 // lo reinicio en 0
        //}
        saldo -= monto
    }
}

object baigorria {
    var empanadasVendidas = 0 //cant.
    const precioPorEmpanada = 15
    var totalSueldoCobrado = 0

    //getters
    //method empanadasVendidas() = empanadasVendidas

    method totalSueldoCobrado() = totalSueldoCobrado

    method venderEmpanadas(cantidad) {
        empanadasVendidas += cantidad
    }

    method sueldo() = empanadasVendidas * precioPorEmpanada

    method cobrarSueldo() {
        totalSueldoCobrado += self.sueldo()
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

/*
Para pensar: ¿qué mensajes entiende cada uno? 
    Galvan: sueldo(), sueldoNuevo(_sueldoNuevo), cobrarSueldo(), gastar(monto), deuda()
    Bigorria: sueldo(), totalSueldoCobrado(), venderEmpanadas(cantidad), cobrarSueldo()

Polimorfismo entre Baigorria y Galván: ambos entienden los mensajes sueldo() y cobrarSueldo() 
y esto permite que Gimenez pueda interactuar con ellos (sin importar o saber cuál de ellos es) a través  
de empleado.sueldo() y empleado.cobrarSueldo() en el método pagarSueldo(empleado). 


¿qué efecto produce al utilizar ambos objetos en el REPL?
    Podemos ver cómo va cambiando el estado interno de cada uno de los objetos
*/