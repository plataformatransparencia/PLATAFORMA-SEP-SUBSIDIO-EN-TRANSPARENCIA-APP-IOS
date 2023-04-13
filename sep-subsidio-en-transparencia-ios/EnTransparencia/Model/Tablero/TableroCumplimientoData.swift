import Foundation

struct TableroCumplimientoData: Codable{
    var tablero_cumplimiento: TableroCumplimientoInformes
}

struct TableroCumplimientoInformes: Codable{
    var informe_academico: Informe
    var informe_financiero: Informe
    var informe_publicacion: Informe
    var Entrega_del_reporte: TrimestreInformes
    var Comprobacion_de_recurso: TrimestreInformes
    var Finiquito: TrimestreInformes
    var Resultado_general: ResultadoGeneral
    
}

struct Informe: Codable {
    var primer_trimestre: TrimestreInformes
    var segundo_trimestre: TrimestreInformes
    var tercero_trimestre: TrimestreInformes
    var cuarto_trimestre: TrimestreInformes
}

struct TrimestreInformes: Codable {
    var fechaLimite: String
    var fechaEntrega: String
    var cumplimiento: String
    var observacion: String
}

struct ResultadoGeneral: Codable {
    var fechaEntrega: String
    var aprobacion: String
    var observacion: String
}

// subsidio presupuesto
struct TableroCumplimientoPresupuestoData: Codable{
    var tablero_cumplimiento: Presupuesto
}
struct Presupuesto: Codable{
    var Informes: [InformesData]
    var Seguimiento_de_entrega: [Seguimiento]
    var Reintegro_TESOFE: [Reintegro]
    var Cierre_productiva: Cierre
}


struct InformesData: Codable {
    var descripcion: String
    var fechaLimite: String
    var fechaEntrega: String
    var cumplimiento: String
    var observacion: String
    
}

struct Seguimiento: Codable{
    var mes: String
    var fechaLimite: String
    var fechaEntrega: String
    var cumplimiento: String
    var observacion: String
}

struct Reintegro: Codable{
    var descripcion: String
    var fechaLimite: String
    var fechaReintegro: String
    var cumplimiento: String
    var observacion: String
}

struct Cierre:Codable{
    var accion: String
    var fechaLimite: String
    var fechaComprobacion: String
    var cumplimiento: String
    var observacion: String
}
