import Foundation

struct MinistracionFederalData: Decodable {
    var federal: MesesFederalData
    var totales_adeudos: TotalesFederalAdeudo
}

struct MesesFederalData: Decodable {
    var Enero: DatosFederal?
    var Febrero: DatosFederal?
    var Marzo: DatosFederal?
    var Abril: DatosFederal?
    var Mayo: DatosFederal?
    var Junio: DatosFederal?
    var Julio: DatosFederal?
    var Agosto: DatosFederal?
    var Septiembre: DatosFederal?
    var Octubre: DatosFederal?
    var Noviembre: DatosFederal?
    var Diciembre: DatosFederal?
    var informes : Informes?
    var ministracion : Ministracion?
    
}
struct MinistracionFederalDataPresupuesto: Decodable {
    var federal: CumplimientoPresupuesto
}

struct CumplimientoPresupuesto:Decodable{
    var ministracionA : Ministracion?
    var ministracionB : Ministracion?
    var ministracionC : Ministracion?
}

struct DatosFederal: Decodable {
    var monto: Double
    var montoRecibido: Double
    var sep_estado : SepEstadoFederal
    var ejecucion_estado : EjecucionEstadoFederal?
    var estado_Universidad : EstadoUniversidadFederal
}

struct SepEstadoFederal: Decodable {
    var cumplimiento : String
    var fecha : String
    var observacion : String
}

struct EjecucionEstadoFederal: Decodable {
    var cumplimiento : String
    var fecha : String
    var observacion : String
}

struct EstadoUniversidadFederal: Decodable {
    var cumplimiento : String
    var fecha : String
    var observacion : String
}

struct Informes: Decodable {
    var subsidio_ordinario : SubsidioOrdinario
    var rendicion_cuentas : RendicionCuentas
    var matricula : Matricula
}

struct SubsidioOrdinario: Decodable {
    var trimestre1 : Trimestre
    var trimestre2 : Trimestre
    var trimestre3 : Trimestre
    var trimestre4 : Trimestre
}

struct RendicionCuentas: Decodable {
    var trimestre1 : Trimestre
    var trimestre2 : Trimestre
    var trimestre3 : Trimestre
    var trimestre4 : Trimestre
}

struct Matricula: Decodable {
    var semestre1 : Semestre
    var semestre2 : Semestre
}

struct Trimestre: Decodable {
    var cumplimiento : String
    var observacion : String
}

struct Semestre: Decodable {
    var cumplimiento : String
    var observacion : String
}

struct TotalesFederalAdeudo : Decodable {
    var montoTotalSEP : Double
    var adeudoFederal : FederalAdeudoFederal
}

struct FederalAdeudoFederal: Decodable {
    var adeudo : Double
    var fecha : String
}
