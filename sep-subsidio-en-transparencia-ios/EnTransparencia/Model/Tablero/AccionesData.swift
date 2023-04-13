import Foundation

struct AccionesData: Codable{
    var Acciones: Acciones
    var referencias: Dictionary<String, String>?
}

struct Acciones: Codable{
    var Acciones: [Action]
    var Materiales_Suministros_Acciones : [Action]?
    var Servicios_Generales_Acciones : [Action]?
    var Asignaciones_Subsidios_otras_Ayudas : [Action]?
    var Bienes_muebles_inmuebles : [Action]?
    var Obras_remodelaciones : [Action]?
}


struct Action: Codable{
    var accion: String
    var imagen: String?
    var fechaEstipulada: String?
    var fechaEjecucion: String
    var cumplimiento: String
    var observacion: String
    var subacciones: [SubActiones]?
}

struct SubActiones: Codable{
    var subaccion: String
    var fechaEstipulada: String?
    var fechaEjecucion: String
    var cumplimiento: String
    var observacion: String
}
