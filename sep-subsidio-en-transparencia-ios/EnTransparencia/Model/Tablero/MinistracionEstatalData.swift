import Foundation

struct MinistracionEstatalData: Decodable {
    var estatal: MesesData
    var totales_adeudos: TotalesAdeudo
    var totales_minstrados : TotalesMinistrados?
}

struct MesesData: Decodable {
    var Enero: Datos?
    var Febrero: Datos?
    var Marzo: Datos?
    var Abril: Datos?
    var Mayo: Datos?
    var Junio: Datos?
    var Julio: Datos?
    var Agosto: Datos?
    var Septiembre: Datos?
    var Octubre: Datos?
    var Noviembre: Datos?
    var Diciembre: Datos?
    var ministracion: [Ministracion]?
}

struct Datos: Decodable {
    var monto: Double
    var montoRecibido: Double
    var estado_universidad : EstadoUniversidad
    var ejecucion_estado : EjecucionEstado?
}

struct EstadoUniversidad: Decodable {
    var cumplimiento : String
    var fecha : String
    var observacion : String
}

struct EjecucionEstado: Decodable {
    var fecha : String
    var observacion : String
}


struct TotalesAdeudo : Decodable {
    var montoTotalSEP : Double?
    var montoTotalEstado : Double?
    var adeudoEstatal : AdeudoEstatal?
    var montoTotal : Double?
}

struct AdeudoEstatal: Decodable {
    var adeudo : Double
    var fecha : String
}

struct AdeudoFederal: Decodable {
    var adeudo : Double
    var fecha : String
}

struct Ministracion: Decodable {
    var monto: Double?
    var sep_estado : Double?
    var fechaEjecucionEstado : String?
    var estado_universidad : Double
    var fechaEjecucionUniversidad : String?
    var observacion: String
}

struct TotalesMinistrados: Decodable {
    var montoTotalSEP: Double
    var montoTotalEstado : Double
    var montoTotal : Double
}


