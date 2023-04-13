import Foundation

final class TableroCumplimientoViewModel: ObservableObject{
    //Collapsable
    @Published var isSelected1: Bool = true
    @Published var isSelected2: Bool = false
    @Published var isSelected3: Bool = false
    @Published var isSelected4: Bool = false
    @Published var textosPrimerTrimestre = ["Entrega del primer informe trimestral de avance académico de la Universidad a DGESUI\u{00B2}","Entrega del primer informe trimestral de avance financiero de la Universidad a DGESUI\u{00B2}", "Publicación del primer informe trimestral en su página de transparencia de la Institución\u{00B3}"]
    @Published var textosSegundoTrimestre = ["Entrega del segundo informe trimestral de avance académico de la Universidad a DGESUI\u{00B2}","Entrega del segundo informe trimestral de avance financiero de la Universidad a DGESUI\u{00B2}", "Publicación del segundo informe trimestral en su página de transparencia de la Institución\u{00B3}"]
    @Published var textosTercerTrimestre = ["Entrega del tercer informe trimestral de avance académico de la Universidad a DGESUI\u{00B2}","Entrega del tercer informe trimestral de avance financiero de la Universidad a DGESUI\u{00B2}", "Publicación del tercer informe trimestral en su página de transparencia de la Institución\u{00B3}"]
    @Published var textosCuartoTrimestre = ["Entrega del cuarto informe trimestral de avance académico de la Universidad a DGESUI\u{00B2}","Entrega del cuarto informe trimestral de avance financiero de la Universidad a DGESUI\u{00B2}", "Publicación del cuarto informe trimestral en su página de transparencia de la Institución\u{00B3}"]
    @Published var trimestre1 = "Trimestre 1"
    @Published var trimestre2 = "Trimestre 2"
    @Published var trimestre3 = "Trimestre 3"
    @Published var trimestre4 = "Trimestre 4"
    
    // Primer trimestre
    @Published var fechaLimitePT = ["","",""]
    @Published var fechaEntregaPT = ["","",""]
    @Published var cumplimientoPT = ["","",""]
    @Published var observacionPT = ["","",""]
    // Segundo trimestre
    @Published var fechaLimiteST = ["","",""]
    @Published var fechaEntregaST = ["","",""]
    @Published var cumplimientoST = ["","",""]
    @Published var observacionST = ["","",""]
    // Tercer trimestre
    @Published var fechaLimiteTT = ["","",""]
    @Published var fechaEntregaTT = ["","",""]
    @Published var cumplimientoTT = ["","",""]
    @Published var observacionTT = ["","",""]
    // Cuarto trimestre
    @Published var fechaLimiteCT = ["","",""]
    @Published var fechaEntregaCT = ["","",""]
    @Published var cumplimientoCT = ["","",""]
    @Published var observacionCT = ["","",""]
    // Entrega del reporte
    @Published var fechaLimiteER = ""
    @Published var fechaEntregaER = ""
    @Published var cumplimientoER = ""
    @Published var observacionER = ""
    // Comprobación de recurso
    @Published var fechaLimiteCR = ""
    @Published var fechaEntregaCR = ""
    @Published var cumplimientoCR = ""
    @Published var observacionCR = ""
    // Finiquito
    @Published var fechaLimiteF = ""
    @Published var fechaEntregaF = ""
    @Published var cumplimientoF = ""
    @Published var observacionF = ""
    // Resultado General
    @Published var fechaEntregaRG = ""
    @Published var aprobacionRG = ""
    @Published var observacionRG = ""
    @Published var dataPresupuesto : Presupuesto?
    
    func loadComprmisos(anio: Int, id: String, subsidio: String, tipo: String?){
        guard let url = URL(string: "\(URL_BASE)/compromisos2/\(anio)/\(id)/\(subsidio)/\(tipo!)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                if subsidio == "subsidio_presupuesto"{
                    let decodedData = try  JSONDecoder().decode(TableroCumplimientoPresupuestoData.self, from: data)
                    DispatchQueue.main.async {
                        self.dataPresupuesto = decodedData.tablero_cumplimiento
                        
                    }
                }else{
                let decodedData = try  JSONDecoder().decode(TableroCumplimientoData.self, from: data)
                DispatchQueue.main.async {
                    // Primer Trimestre
                    // Fecha Limite
                    self.fechaLimitePT[0] = decodedData.tablero_cumplimiento.informe_academico.primer_trimestre.fechaLimite
                    self.fechaLimitePT[1] = decodedData.tablero_cumplimiento.informe_financiero.primer_trimestre.fechaLimite
                    self.fechaLimitePT[2] = decodedData.tablero_cumplimiento.informe_publicacion.primer_trimestre.fechaLimite
                    // Fecha Entrega
                    self.fechaEntregaPT[0] = decodedData.tablero_cumplimiento.informe_academico.primer_trimestre.fechaEntrega
                    self.fechaEntregaPT[1] = decodedData.tablero_cumplimiento.informe_financiero.primer_trimestre.fechaEntrega
                    self.fechaEntregaPT[2] = decodedData.tablero_cumplimiento.informe_publicacion.primer_trimestre.fechaEntrega
                    // Cumplimiento
                    self.cumplimientoPT[0] = decodedData.tablero_cumplimiento.informe_academico.primer_trimestre.cumplimiento
                    self.cumplimientoPT[1] = decodedData.tablero_cumplimiento.informe_financiero.primer_trimestre.cumplimiento
                    self.cumplimientoPT[2] = decodedData.tablero_cumplimiento.informe_publicacion.primer_trimestre.cumplimiento
                    // Observacion
                    self.observacionPT[0] = decodedData.tablero_cumplimiento.informe_academico.primer_trimestre.observacion
                    self.observacionPT[1] = decodedData.tablero_cumplimiento.informe_financiero.primer_trimestre.observacion
                    self.observacionPT[2] = decodedData.tablero_cumplimiento.informe_publicacion.primer_trimestre.observacion
                    // Segundo Trimestre
                    // Fecha Limite
                    self.fechaLimiteST[0] = decodedData.tablero_cumplimiento.informe_academico.segundo_trimestre.fechaLimite
                    self.fechaLimiteST[1] = decodedData.tablero_cumplimiento.informe_financiero.segundo_trimestre.fechaLimite
                    self.fechaLimiteST[2] = decodedData.tablero_cumplimiento.informe_publicacion.segundo_trimestre.fechaLimite
                    // Fecha Entrega
                    self.fechaEntregaST[0] = decodedData.tablero_cumplimiento.informe_academico.segundo_trimestre.fechaEntrega
                    self.fechaEntregaST[1] = decodedData.tablero_cumplimiento.informe_financiero.segundo_trimestre.fechaEntrega
                    self.fechaEntregaST[2] = decodedData.tablero_cumplimiento.informe_publicacion.segundo_trimestre.fechaEntrega
                    // Cumplimiento
                    self.cumplimientoST[0] = decodedData.tablero_cumplimiento.informe_academico.segundo_trimestre.cumplimiento
                    self.cumplimientoST[1] = decodedData.tablero_cumplimiento.informe_financiero.segundo_trimestre.cumplimiento
                    self.cumplimientoST[2] = decodedData.tablero_cumplimiento.informe_publicacion.segundo_trimestre.cumplimiento
                    // Observacion
                    self.observacionST[0] = decodedData.tablero_cumplimiento.informe_academico.segundo_trimestre.observacion
                    self.observacionST[1] = decodedData.tablero_cumplimiento.informe_financiero.segundo_trimestre.observacion
                    self.observacionST[2] = decodedData.tablero_cumplimiento.informe_publicacion.segundo_trimestre.observacion
                    // Tercer Trimestre
                    // Fecha Limite
                    self.fechaLimiteTT[0] = decodedData.tablero_cumplimiento.informe_academico.tercero_trimestre.fechaLimite
                    self.fechaLimiteTT[1] = decodedData.tablero_cumplimiento.informe_financiero.tercero_trimestre.fechaLimite
                    self.fechaLimiteTT[2] = decodedData.tablero_cumplimiento.informe_publicacion.tercero_trimestre.fechaLimite
                    // Fecha Entrega
                    self.fechaEntregaTT[0] = decodedData.tablero_cumplimiento.informe_academico.tercero_trimestre.fechaEntrega
                    self.fechaEntregaTT[1] = decodedData.tablero_cumplimiento.informe_financiero.tercero_trimestre.fechaEntrega
                    self.fechaEntregaTT[2] = decodedData.tablero_cumplimiento.informe_publicacion.tercero_trimestre.fechaEntrega
                    // Cumplimiento
                    self.cumplimientoTT[0] = decodedData.tablero_cumplimiento.informe_academico.tercero_trimestre.cumplimiento
                    self.cumplimientoTT[1] = decodedData.tablero_cumplimiento.informe_financiero.tercero_trimestre.cumplimiento
                    self.cumplimientoTT[2] = decodedData.tablero_cumplimiento.informe_publicacion.tercero_trimestre.cumplimiento
                    // Observacion
                    self.observacionTT[0] = decodedData.tablero_cumplimiento.informe_academico.tercero_trimestre.observacion
                    self.observacionTT[1] = decodedData.tablero_cumplimiento.informe_financiero.tercero_trimestre.observacion
                    self.observacionTT[2] = decodedData.tablero_cumplimiento.informe_publicacion.tercero_trimestre.observacion
                    // Cuarto Trimestre
                    // Fecha Limite
                    self.fechaLimiteCT[0] = decodedData.tablero_cumplimiento.informe_academico.cuarto_trimestre.fechaLimite
                    self.fechaLimiteCT[1] = decodedData.tablero_cumplimiento.informe_financiero.cuarto_trimestre.fechaLimite
                    self.fechaLimiteCT[2] = decodedData.tablero_cumplimiento.informe_publicacion.cuarto_trimestre.fechaLimite
                    // Fecha Entrega
                    self.fechaEntregaCT[0] = decodedData.tablero_cumplimiento.informe_academico.cuarto_trimestre.fechaEntrega
                    self.fechaEntregaCT[1] = decodedData.tablero_cumplimiento.informe_financiero.cuarto_trimestre.fechaEntrega
                    self.fechaEntregaCT[2] = decodedData.tablero_cumplimiento.informe_publicacion.cuarto_trimestre.fechaEntrega
                    // Cumplimiento
                    self.cumplimientoCT[0] = decodedData.tablero_cumplimiento.informe_academico.cuarto_trimestre.cumplimiento
                    self.cumplimientoCT[1] = decodedData.tablero_cumplimiento.informe_financiero.cuarto_trimestre.cumplimiento
                    self.cumplimientoCT[2] = decodedData.tablero_cumplimiento.informe_publicacion.cuarto_trimestre.cumplimiento
                    // Observacion
                    self.observacionCT[0] = decodedData.tablero_cumplimiento.informe_academico.cuarto_trimestre.observacion
                    self.observacionCT[1] = decodedData.tablero_cumplimiento.informe_financiero.cuarto_trimestre.observacion
                    self.observacionCT[2] = decodedData.tablero_cumplimiento.informe_publicacion.cuarto_trimestre.observacion
                    // Entrega del reporte
                    self.fechaLimiteER = decodedData.tablero_cumplimiento.Entrega_del_reporte.fechaLimite
                    self.fechaEntregaER = decodedData.tablero_cumplimiento.Entrega_del_reporte.fechaEntrega
                    self.cumplimientoER = decodedData.tablero_cumplimiento.Entrega_del_reporte.cumplimiento
                    self.observacionER = decodedData.tablero_cumplimiento.Entrega_del_reporte.observacion
                    // Comprobación de recurso
                    self.fechaLimiteCR = decodedData.tablero_cumplimiento.Comprobacion_de_recurso.fechaLimite
                    self.fechaEntregaCR = decodedData.tablero_cumplimiento.Comprobacion_de_recurso.fechaEntrega
                    self.cumplimientoCR = decodedData.tablero_cumplimiento.Comprobacion_de_recurso.cumplimiento
                    self.observacionCR = decodedData.tablero_cumplimiento.Comprobacion_de_recurso.observacion
                    // Finiquito
                    self.fechaLimiteF = decodedData.tablero_cumplimiento.Finiquito.fechaLimite
                    self.fechaEntregaF = decodedData.tablero_cumplimiento.Finiquito.fechaEntrega
                    self.cumplimientoF = decodedData.tablero_cumplimiento.Finiquito.cumplimiento
                    self.observacionF = decodedData.tablero_cumplimiento.Finiquito.observacion
                    // Resultado General
                    self.fechaEntregaRG = decodedData.tablero_cumplimiento.Resultado_general.fechaEntrega
                    self.aprobacionRG = decodedData.tablero_cumplimiento.Resultado_general.aprobacion
                    self.observacionRG =  decodedData.tablero_cumplimiento.Resultado_general.observacion
                }
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
