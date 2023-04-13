import Foundation


final class TableroCumplimientoEstatalViewModel: ObservableObject{
    //Collapsable
    @Published var isSelected1 = true
    @Published var isSelected2 = false
    @Published var isSelected3 = false
    @Published var isSelected4 = false
    //Enero
    @Published var montoEnero : Double? = 0.0
    @Published var montoRecibidoEnero : Double? = 0.0
    @Published var estadoUniversidadCumplimientoEnero : String? = ""
    @Published var estadoUniversidadFechaCumplimientoEnero : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoEnero : String? = ""
    @Published var ejecucionEstadoFechaEnero : String? = ""
    @Published var ejecucionEstadoObservacionEnero : String? = ""
    //Febrero
    @Published var montoFebrero : Double? = 0.0
    @Published var montoRecibidoFebrero : Double? = 0.0
    @Published var estadoUniversidadCumplimientoFebrero : String? = ""
    @Published var estadoUniversidadFechaCumplimientoFebrero : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoFebrero : String? = ""
    @Published var ejecucionEstadoFechaFebrero : String? = ""
    @Published var ejecucionEstadoObservacionFebrero : String? = ""
    //Marzo
    @Published var montoMarzo : Double? = 0.0
    @Published var montoRecibidoMarzo : Double? = 0.0
    @Published var estadoUniversidadCumplimientoMarzo : String? = ""
    @Published var estadoUniversidadFechaCumplimientoMarzo : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoMarzo : String? = ""
    @Published var ejecucionEstadoFechaMarzo : String? = ""
    @Published var ejecucionEstadoObservacionMarzo : String? = ""
    //Abril
    @Published var montoAbril : Double? = 0.0
    @Published var montoRecibidoAbril : Double? = 0.0
    @Published var estadoUniversidadCumplimientoAbril : String? = ""
    @Published var estadoUniversidadFechaCumplimientoAbril : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoAbril : String? = ""
    @Published var ejecucionEstadoFechaAbril : String? = ""
    @Published var ejecucionEstadoObservacionAbril : String? = ""
    
    //Mayo
    @Published var montoMayo : Double? = 0.0
    @Published var montoRecibidoMayo : Double? = 0.0
    @Published var estadoUniversidadCumplimientoMayo : String? = ""
    @Published var estadoUniversidadFechaCumplimientoMayo : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoMayo : String? = ""
    @Published var ejecucionEstadoFechaMayo : String? = ""
    @Published var ejecucionEstadoObservacionMayo : String? = ""
    //Junio
    @Published var montoJunio : Double? = 0.0
    @Published var montoRecibidoJunio : Double? = 0.0
    @Published var estadoUniversidadCumplimientoJunio : String? = ""
    @Published var estadoUniversidadFechaCumplimientoJunio : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoJunio : String? = ""
    @Published var ejecucionEstadoFechaJunio : String? = ""
    @Published var ejecucionEstadoObservacionJunio : String? = ""
    //Julio
    @Published var montoJulio : Double? = 0.0
    @Published var montoRecibidoJulio : Double? = 0.0
    @Published var estadoUniversidadCumplimientoJulio : String? = ""
    @Published var estadoUniversidadFechaCumplimientoJulio : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoJulio : String? = ""
    @Published var ejecucionEstadoFechaJulio : String? = ""
    @Published var ejecucionEstadoObservacionJulio : String? = ""
    //Agosto
    @Published var montoAgosto : Double? = 0.0
    @Published var montoRecibidoAgosto : Double? = 0.0
    @Published var estadoUniversidadCumplimientoAgosto : String? = ""
    @Published var estadoUniversidadFechaCumplimientoAgosto : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoAgosto : String? = ""
    @Published var ejecucionEstadoFechaAgosto : String? = ""
    @Published var ejecucionEstadoObservacionAgosto : String? = ""
    //Septiembre
    @Published var montoSeptiembre : Double? = 0.0
    @Published var montoRecibidoSeptiembre : Double? = 0.0
    @Published var estadoUniversidadCumplimientoSeptiembre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoSeptiembre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoSeptiembre : String? = ""
    @Published var ejecucionEstadoFechaSeptiembre: String? = ""
    @Published var ejecucionEstadoObservacionSeptiembre : String? = ""
    //Octubre
    @Published var montoOctubre : Double? = 0.0
    @Published var montoRecibidoOctubre : Double? = 0.0
    @Published var estadoUniversidadCumplimientoOctubre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoOctubre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoOctubre : String? = ""
    @Published var ejecucionEstadoFechaOctubre: String? = ""
    @Published var ejecucionEstadoObservacionOctubre : String? = ""
    //Noviembre
    @Published var montoNoviembre : Double? = 0.0
    @Published var montoRecibidoNoviembre : Double? = 0.0
    @Published var estadoUniversidadCumplimientoNoviembre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoNoviembre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoNoviembre : String? = ""
    @Published var ejecucionEstadoFechaNoviembre: String? = ""
    @Published var ejecucionEstadoObservacionNoviembre : String? = ""
    //Diciembre
    @Published var montoDiciembre : Double? = 0.0
    @Published var montoRecibidoDiciembre : Double? = 0.0
    @Published var estadoUniversidadCumplimientoDiciembre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoDiciembre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoDiciembre : String? = ""
    @Published var ejecucionEstadoFechaDiciembre: String? = ""
    @Published var ejecucionEstadoObservacionDiciembre : String? = ""
    //Totales
    @Published var montoTotalSEP = 0.0
    @Published var montoTotalEstado = 0.0
    @Published var adeudoEstatal = 0.0
    @Published var fechaAdeudo = ""
    @Published var montoTotal = 0.0
    
    //Ministraciones
    @Published var ministracion = [Ministracion]()
    
    
    func loadMinistracionEstatal(anio: Int, id: String, tipo: String){
        guard let url = URL(string: "\(URL_BASE)/ministracionestatal2/\(anio)/\(id)/\(tipo)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(MinistracionEstatalData.self, from: data)
                DispatchQueue.main.async {
                    //Enero
                    self.montoEnero = decodedData.estatal.Enero?.monto
                    self.montoRecibidoEnero = decodedData.estatal.Enero?.montoRecibido
                    self.estadoUniversidadCumplimientoEnero = decodedData.estatal.Enero?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoEnero = decodedData.estatal.Enero?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoEnero = decodedData.estatal.Enero?.estado_universidad.observacion
                    self.ejecucionEstadoFechaEnero = decodedData.estatal.Enero?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionEnero = decodedData.estatal.Enero?.ejecucion_estado?.observacion
                    //Febrero
                    self.montoFebrero = decodedData.estatal.Febrero?.monto
                    self.montoRecibidoFebrero = decodedData.estatal.Febrero?.montoRecibido
                    self.estadoUniversidadCumplimientoFebrero = decodedData.estatal.Febrero?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoFebrero = decodedData.estatal.Febrero?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoFebrero = decodedData.estatal.Febrero?.estado_universidad.observacion
                    self.ejecucionEstadoFechaFebrero = decodedData.estatal.Febrero?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionFebrero = decodedData.estatal.Febrero?.ejecucion_estado?.observacion
                    //Marzo
                    self.montoMarzo = decodedData.estatal.Marzo?.monto
                    self.montoRecibidoMarzo = decodedData.estatal.Marzo?.montoRecibido
                    self.estadoUniversidadCumplimientoMarzo = decodedData.estatal.Marzo?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoMarzo = decodedData.estatal.Marzo?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoMarzo = decodedData.estatal.Marzo?.estado_universidad.observacion
                    self.ejecucionEstadoFechaMarzo = decodedData.estatal.Marzo?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionMarzo = decodedData.estatal.Marzo?.ejecucion_estado?.observacion
                    //Abril
                    self.montoAbril = decodedData.estatal.Abril?.monto
                    self.montoRecibidoAbril = decodedData.estatal.Abril?.montoRecibido
                    self.estadoUniversidadCumplimientoAbril = decodedData.estatal.Abril?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoAbril = decodedData.estatal.Abril?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoAbril = decodedData.estatal.Abril?.estado_universidad.observacion
                    self.ejecucionEstadoFechaAbril = decodedData.estatal.Abril?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionAbril = decodedData.estatal.Abril?.ejecucion_estado?.observacion
                    //Mayo
                    self.montoMayo = decodedData.estatal.Mayo?.monto
                    self.montoRecibidoMayo = decodedData.estatal.Mayo?.montoRecibido
                    self.estadoUniversidadCumplimientoMayo = decodedData.estatal.Mayo?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoMayo = decodedData.estatal.Mayo?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoMayo = decodedData.estatal.Mayo?.estado_universidad.observacion
                    self.ejecucionEstadoFechaMayo = decodedData.estatal.Mayo?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionMayo = decodedData.estatal.Mayo?.ejecucion_estado?.observacion
                    //Junio
                    self.montoJunio = decodedData.estatal.Junio?.monto
                    self.montoRecibidoJunio = decodedData.estatal.Junio?.montoRecibido
                    self.estadoUniversidadCumplimientoJunio = decodedData.estatal.Junio?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoJunio = decodedData.estatal.Junio?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoJunio = decodedData.estatal.Junio?.estado_universidad.observacion
                    self.ejecucionEstadoFechaJunio = decodedData.estatal.Junio?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionJunio = decodedData.estatal.Junio?.ejecucion_estado?.observacion
                    //Julio
                    self.montoJulio = decodedData.estatal.Julio?.monto
                    self.montoRecibidoJulio = decodedData.estatal.Julio?.montoRecibido
                    self.estadoUniversidadCumplimientoJulio = decodedData.estatal.Julio?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoJulio = decodedData.estatal.Julio?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoJulio = decodedData.estatal.Julio?.estado_universidad.observacion
                    self.ejecucionEstadoFechaJulio = decodedData.estatal.Julio?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionJulio = decodedData.estatal.Julio?.ejecucion_estado?.observacion
                    //Agosto
                    self.montoAgosto = decodedData.estatal.Agosto?.monto
                    self.montoRecibidoAgosto = decodedData.estatal.Agosto?.montoRecibido
                    self.estadoUniversidadCumplimientoAgosto = decodedData.estatal.Agosto?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoAgosto = decodedData.estatal.Agosto?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoAgosto = decodedData.estatal.Agosto?.estado_universidad.observacion
                    self.ejecucionEstadoFechaAgosto = decodedData.estatal.Agosto?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionAgosto = decodedData.estatal.Agosto?.ejecucion_estado?.observacion
                    //Septiembre
                    self.montoSeptiembre = decodedData.estatal.Septiembre?.monto
                    self.montoRecibidoSeptiembre = decodedData.estatal.Septiembre?.montoRecibido
                    self.estadoUniversidadCumplimientoSeptiembre = decodedData.estatal.Septiembre?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoSeptiembre = decodedData.estatal.Septiembre?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoSeptiembre = decodedData.estatal.Septiembre?.estado_universidad.observacion
                    self.ejecucionEstadoFechaSeptiembre = decodedData.estatal.Septiembre?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionSeptiembre = decodedData.estatal.Septiembre?.ejecucion_estado?.observacion
                    //Octubre
                    self.montoOctubre = decodedData.estatal.Octubre?.monto
                    self.montoRecibidoOctubre  = decodedData.estatal.Octubre?.montoRecibido
                    self.estadoUniversidadCumplimientoOctubre = decodedData.estatal.Octubre?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoOctubre = decodedData.estatal.Octubre?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoOctubre = decodedData.estatal.Octubre?.estado_universidad.observacion
                    self.ejecucionEstadoFechaOctubre = decodedData.estatal.Octubre?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionOctubre = decodedData.estatal.Octubre?.ejecucion_estado?.observacion
                    //Noviembre
                    self.montoNoviembre = decodedData.estatal.Noviembre?.monto
                    self.montoRecibidoNoviembre  = decodedData.estatal.Noviembre?.montoRecibido
                    self.estadoUniversidadCumplimientoNoviembre = decodedData.estatal.Noviembre?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoNoviembre = decodedData.estatal.Noviembre?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoNoviembre = decodedData.estatal.Noviembre?.estado_universidad.observacion
                    self.ejecucionEstadoFechaNoviembre = decodedData.estatal.Noviembre?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionNoviembre = decodedData.estatal.Noviembre?.ejecucion_estado?.observacion
                    //Diciembre
                    self.montoDiciembre = decodedData.estatal.Diciembre?.monto
                    self.montoRecibidoDiciembre  = decodedData.estatal.Diciembre?.montoRecibido
                    self.estadoUniversidadCumplimientoDiciembre = decodedData.estatal.Diciembre?.estado_universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoDiciembre = decodedData.estatal.Diciembre?.estado_universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoDiciembre = decodedData.estatal.Diciembre?.estado_universidad.observacion
                    self.ejecucionEstadoFechaDiciembre = decodedData.estatal.Diciembre?.ejecucion_estado?.fecha
                    self.ejecucionEstadoObservacionDiciembre = decodedData.estatal.Diciembre?.ejecucion_estado?.observacion
                    
                    //Montos
                    self.montoTotalSEP = decodedData.totales_adeudos.montoTotalSEP!
                    self.montoTotalEstado = decodedData.totales_adeudos.montoTotalEstado!
                    self.adeudoEstatal = decodedData.totales_adeudos.adeudoEstatal!.adeudo
                    self.fechaAdeudo = decodedData.totales_adeudos.adeudoEstatal!.fecha
                    self.montoTotal = decodedData.totales_adeudos.montoTotal!
                    
                    //Ministracion
                    self.ministracion = decodedData.estatal.ministracion ?? [Ministracion(monto: 0.0, fechaEjecucionEstado: "", estado_universidad: 0.0, observacion: "")]
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
