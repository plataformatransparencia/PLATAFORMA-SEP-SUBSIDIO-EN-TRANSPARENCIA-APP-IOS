import Foundation

struct CompromisosData: Codable{
    var compromisos: [CompromisosDatos]?
    var tablaMontoUniversidad : TablaMontoUniversidad?
    var actividades: [Actividades]?
    var entregas : [Entregas]?
    var referencias : Dictionary<String,String>?
    var nota_global : String?
    
}

struct CompromisosVertiente: Codable{
    let compromisos: CompromisosDatosPresupuesto?
    var referencias : Dictionary<String,String>?
}
struct CompromisosDatosPresupuesto: Codable{
    var vertienteA: [CompromisosDatos]?
    var vertienteB: [CompromisosDatos]?
    var vertienteC: [CompromisosDatos]?
}

struct CompromisosDatos: Codable{
    var compromiso: String
    var fechaEstipulada: String?
    var fechaEjecucion: String?
    var cumplimiento: String?
    var fecha: String?
    var fechaEntrega: String?
    var observacion: String?
    var porcentaje_incremento: Double?
}


struct TablaMontoUniversidad: Codable{
    var monto: Double
    var fechaDepEst: String
    var fechaDepUni: String
    var observaciones: String
}

struct Actividades: Codable{
    var actividad : String
    var cumplimientos: [CumplimientosActividades]
}

struct CumplimientosActividades: Codable{
    var fechaEstipulada : String?
    var fechaEjecucion: String?
    var cumplimiento: String
    var observacion: String
}

struct Entregas: Codable{
    var entrega : String
    var cumplimientos: [CumplimientosEntregas]
}


struct CumplimientosEntregas: Codable{
    var fechaEstipulada : String
    var fechaEjecucion: String
    var cumplimiento: String
    var observacion: String
}


