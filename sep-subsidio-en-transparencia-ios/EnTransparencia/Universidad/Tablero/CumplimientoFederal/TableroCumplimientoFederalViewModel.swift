import Foundation

final class TableroCumplimientoFederalViewModel: ObservableObject{
    //Collapsable
    @Published var isSelected1 = true
    @Published var isSelected2 = false
    @Published var isSelected3 = false
    @Published var isSelected4 = false
    //Enero
    @Published var montoEnero : Double? = 0.0
    @Published var montoRecibidoEnero : Double? = 0.0
    @Published var sepEstadoCumplimientoEnero : String? = ""
    @Published var sepEstadoFechaCumplimientoEnero : String? = ""
    @Published var sepEstadoObservacionCumplimientoEnero : String? = ""
    @Published var estadoUniversidadCumplimientoEnero : String? = ""
    @Published var estadoUniversidadFechaCumplimientoEnero: String? = ""
    @Published var estadoUniversidadObservacionCumplimientoEnero : String? = ""
    //Febrero
    @Published var montoFebrero : Double? = 0.0
    @Published var montoRecibidoFebrero : Double? = 0.0
    @Published var sepEstadoCumplimientoFebrero: String? = ""
    @Published var sepEstadoFechaCumplimientoFebrero : String? = ""
    @Published var sepEstadoObservacionCumplimientoFebrero : String? = ""
    @Published var estadoUniversidadCumplimientoFebrero : String? = ""
    @Published var estadoUniversidadFechaCumplimientoFebrero : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoFebrero : String? = ""
    //Marzo
    @Published var montoMarzo : Double? = 0.0
    @Published var montoRecibidoMarzo : Double? = 0.0
    @Published var sepEstadoCumplimientoMarzo : String? = ""
    @Published var sepEstadoFechaCumplimientoMarzo: String? = ""
    @Published var sepEstadoObservacionCumplimientoMarzo : String? = ""
    @Published var estadoUniversidadCumplimientoMarzo : String? = ""
    @Published var estadoUniversidadFechaCumplimientoMarzo : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoMarzo: String? = ""
    //Abril
    @Published var montoAbril : Double? = 0.0
    @Published var montoRecibidoAbril : Double? = 0.0
    @Published var sepEstadoCumplimientoAbril : String? = ""
    @Published var sepEstadoFechaCumplimientoAbril: String? = ""
    @Published var sepEstadoObservacionCumplimientoAbril: String? = ""
    @Published var estadoUniversidadCumplimientoAbril : String? = ""
    @Published var estadoUniversidadFechaCumplimientoAbril : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoAbril : String? = ""
    //Mayo
    @Published var montoMayo : Double? = 0.0
    @Published var montoRecibidoMayo : Double? = 0.0
    @Published var sepEstadoCumplimientoMayo : String? = ""
    @Published var sepEstadoFechaCumplimientoMayo : String? = ""
    @Published var sepEstadoObservacionCumplimientoMayo : String? = ""
    @Published var estadoUniversidadCumplimientoMayo : String? = ""
    @Published var estadoUniversidadFechaCumplimientoMayo : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoMayo : String? = ""
    //Junio
    @Published var montoJunio : Double? = 0.0
    @Published var montoRecibidoJunio : Double? = 0.0
    @Published var sepEstadoCumplimientoJunio : String? = ""
    @Published var sepEstadoFechaCumplimientoJunio : String? = ""
    @Published var sepEstadoObservacionCumplimientoJunio : String? = ""
    @Published var estadoUniversidadCumplimientoJunio : String? = ""
    @Published var estadoUniversidadFechaCumplimientoJunio : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoJunio : String? = ""
    //Julio
    @Published var montoJulio : Double? = 0.0
    @Published var montoRecibidoJulio : Double? = 0.0
    @Published var sepEstadoCumplimientoJulio : String? = ""
    @Published var sepEstadoFechaCumplimientoJulio : String? = ""
    @Published var sepEstadoObservacionCumplimientoJulio : String? = ""
    @Published var estadoUniversidadCumplimientoJulio : String? = ""
    @Published var estadoUniversidadFechaCumplimientoJulio : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoJulio : String? = ""
    //Agosto
    @Published var montoAgosto: Double? = 0.0
    @Published var montoRecibidoAgosto: Double? = 0.0
    @Published var sepEstadoCumplimientoAgosto : String? = ""
    @Published var sepEstadoFechaCumplimientoAgosto : String? = ""
    @Published var sepEstadoObservacionCumplimientoAgosto : String? = ""
    @Published var estadoUniversidadCumplimientoAgosto : String? = ""
    @Published var estadoUniversidadFechaCumplimientoAgosto : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoAgosto : String? = ""
    //Septiembre
    @Published var montoSeptiembre : Double? = 0.0
    @Published var montoRecibidoSeptiembre : Double? = 0.0
    @Published var sepEstadoCumplimientoSeptiembre : String? = ""
    @Published var sepEstadoFechaCumplimientoSeptiembre : String? = ""
    @Published var sepEstadoObservacionCumplimientoSeptiembre : String? = ""
    @Published var estadoUniversidadCumplimientoSeptiembre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoSeptiembre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoSeptiembre : String? = ""
    //Octubre
    @Published var montoOctubre : Double? = 0.0
    @Published var montoRecibidoOctubre : Double? = 0.0
    @Published var sepEstadoCumplimientoOctubre : String? = ""
    @Published var sepEstadoFechaCumplimientoOctubre : String? = ""
    @Published var sepEstadoObservacionCumplimientoOctubre: String? = ""
    @Published var estadoUniversidadCumplimientoOctubre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoOctubre: String? = ""
    @Published var estadoUniversidadObservacionCumplimientoOctubre : String? = ""
    //Noviembre
    @Published var montoNoviembre : Double? = 0.0
    @Published var montoRecibidoNoviembre : Double? = 0.0
    @Published var sepEstadoCumplimientoNoviembre : String? = ""
    @Published var sepEstadoFechaCumplimientoNoviembre: String? = ""
    @Published var sepEstadoObservacionCumplimientoNoviembre: String? = ""
    @Published var estadoUniversidadCumplimientoNoviembre: String? = ""
    @Published var estadoUniversidadFechaCumplimientoNoviembre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoNoviembre: String? = ""
    //Diciembre
    @Published var montoDiciembre : Double? = 0.0
    @Published var montoRecibidoDiciembre : Double? = 0.0
    @Published var sepEstadoCumplimientoDiciembre: String? = ""
    @Published var sepEstadoFechaCumplimientoDiciembre : String? = ""
    @Published var sepEstadoObservacionCumplimientoDiciembre: String? = ""
    @Published var estadoUniversidadCumplimientoDiciembre : String? = ""
    @Published var estadoUniversidadFechaCumplimientoDiciembre : String? = ""
    @Published var estadoUniversidadObservacionCumplimientoDiciembre : String? = ""
    //Informes
    //Subsidio Ordinario
    //Trimestre 1
    @Published var subsidioOrdinarioTrimestre1Cumplimiento : String? = ""
    @Published var subsidioOrdinarioTrimestre1Observacion : String? = ""
    //Trimestre 2
    @Published var subsidioOrdinarioTrimestre2Cumplimiento : String? = ""
    @Published var subsidioOrdinarioTrimestre2Observacion : String? = ""
    //Trimestre 3
    @Published var subsidioOrdinarioTrimestre3Cumplimiento : String? = ""
    @Published var subsidioOrdinarioTrimestre3Observacion : String? = ""
    //Trimestre 4
    @Published var subsidioOrdinarioTrimestre4Cumplimiento : String? = ""
    @Published var subsidioOrdinarioTrimestre4Observacion : String? = ""
    //Rendicion de Cuentas
    //Trimestre 1
    @Published var rendicionCuentasTrimestre1Cumplimiento : String? = ""
    @Published var rendicionCuentasTrimestre1Observacion : String? = ""
    //Trimestre 2
    @Published var rendicionCuentasTrimestre2Cumplimiento : String? = ""
    @Published var rendicionCuentasTrimestre2Observacion : String? = ""
    //Trimestre 3
    @Published var rendicionCuentasTrimestre3Cumplimiento : String? = ""
    @Published var rendicionCuentasTrimestre3Observacion : String? = ""
    //Trimestre 4
    @Published var rendicionCuentasTrimestre4Cumplimiento: String? = ""
    @Published var rendicionCuentasTrimestre4Observacion : String? = ""
    //Matricula
    //Semestre 1
    @Published var matriculaSemestre1Cumplimiento : String? = ""
    @Published var matriculaSemestre1Observacion : String? = ""
    //Semestre 2
    @Published var matriculaSemestre2Cumplimiento : String? = ""
    @Published var matriculaSemestre2Observacion : String? = ""
    //Totales
    @Published var montoTotalSEP : Double = 0
    @Published var adeudoFederal : Double = 0
    @Published var fechaAdeudo : String = ""
    
    //Ministraciones
    @Published var monto: Double?
    @Published var sep_estado : Double?
    @Published var fechaEjecucionEstado : String?
    @Published var estado_universidad : Double?
    @Published var fechaEjecucionUniversidad : String?
    @Published var observacion: String?
    
    //Ministraciones vertientes A
    @Published var montoA: Double?
    @Published var sep_estadoA : Double?
    @Published var fechaEjecucionEstadoA : String?
    @Published var estado_universidadA : Double?
    @Published var fechaEjecucionUniversidadA : String?
    @Published var observacionA: String?
    //Ministraciones vertientes B
    @Published var montoB: Double?
    @Published var sep_estadoB : Double?
    @Published var fechaEjecucionEstadoB : String?
    @Published var estado_universidadB : Double?
    @Published var fechaEjecucionUniversidadB : String?
    @Published var observacionB: String?
    //Ministraciones vertientes C
    @Published var montoC: Double?
    @Published var sep_estadoC : Double?
    @Published var fechaEjecucionEstadoC : String?
    @Published var estado_universidadC : Double?
    @Published var fechaEjecucionUniversidadC : String?
    @Published var observacionC: String?
    @Published var vertienteA: String?
    @Published var vertienteB: String?
    @Published var vertienteC: String?
    
    
    
    func loadMinistracionFederal(anio: Int, id: String, tipo: String){
        guard let url = URL(string: "\(URL_BASE)/ministracionfederal2/\(anio)/\(id)/\(tipo)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                if tipo == "subsidio_presupuesto"{
                    let decodedData = try  JSONDecoder().decode(MinistracionFederalDataPresupuesto.self, from: data)
                    DispatchQueue.main.async {
                        if decodedData.federal.ministracionA != nil{
                            self.montoA = decodedData.federal.ministracionA?.monto
                            self.sep_estadoA = decodedData.federal.ministracionA?.sep_estado
                            self.fechaEjecucionEstadoA = decodedData.federal.ministracionA?.fechaEjecucionEstado
                            self.estado_universidadA = decodedData.federal.ministracionA?.estado_universidad
                            self.fechaEjecucionUniversidadA = decodedData.federal.ministracionA?.fechaEjecucionUniversidad
                            self.observacionA = decodedData.federal.ministracionA?.observacion
                            self.vertienteA = "A"
                        }
                        if decodedData.federal.ministracionB != nil{
                            self.montoB = decodedData.federal.ministracionB?.monto
                            self.sep_estadoB = decodedData.federal.ministracionB?.sep_estado
                            self.fechaEjecucionEstadoB = decodedData.federal.ministracionB?.fechaEjecucionEstado
                            self.estado_universidadB = decodedData.federal.ministracionB?.estado_universidad
                            self.fechaEjecucionUniversidadB = decodedData.federal.ministracionB?.fechaEjecucionUniversidad
                            self.observacionB = decodedData.federal.ministracionB?.observacion
                            self.vertienteB = "B"
                        }
                        if decodedData.federal.ministracionC != nil{
                            self.montoC = decodedData.federal.ministracionC?.monto
                            self.sep_estadoC = decodedData.federal.ministracionC?.sep_estado
                            self.fechaEjecucionEstadoC = decodedData.federal.ministracionC?.fechaEjecucionEstado
                            self.estado_universidadC = decodedData.federal.ministracionC?.estado_universidad
                            self.fechaEjecucionUniversidadC = decodedData.federal.ministracionC?.fechaEjecucionUniversidad
                            self.observacionC = decodedData.federal.ministracionC?.observacion
                            self.vertienteC = "C"
                        }
                    }
                }
                let decodedData = try  JSONDecoder().decode(MinistracionFederalData.self, from: data)
                DispatchQueue.main.async {
                    
                    //Enero
                    self.montoEnero = decodedData.federal.Enero?.monto
                    self.montoRecibidoEnero = decodedData.federal.Enero?.montoRecibido
                    self.sepEstadoCumplimientoEnero = decodedData.federal.Enero?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoEnero = decodedData.federal.Enero?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoEnero = decodedData.federal.Enero?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoEnero = decodedData.federal.Enero?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoEnero = decodedData.federal.Enero?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoEnero = decodedData.federal.Enero?.estado_Universidad.observacion
                    //Febrero
                    self.montoFebrero = decodedData.federal.Febrero?.monto
                    self.montoRecibidoFebrero = decodedData.federal.Febrero?.montoRecibido
                    self.sepEstadoCumplimientoFebrero = decodedData.federal.Febrero?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoFebrero = decodedData.federal.Febrero?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoFebrero = decodedData.federal.Febrero?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoFebrero = decodedData.federal.Febrero?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoFebrero = decodedData.federal.Febrero?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoFebrero = decodedData.federal.Febrero?.estado_Universidad.observacion
                    //Marzo
                    self.montoMarzo = decodedData.federal.Marzo?.monto
                    self.montoRecibidoMarzo = decodedData.federal.Marzo?.montoRecibido
                    self.sepEstadoCumplimientoMarzo = decodedData.federal.Marzo?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoMarzo = decodedData.federal.Marzo?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoMarzo = decodedData.federal.Marzo?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoMarzo = decodedData.federal.Marzo?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoMarzo = decodedData.federal.Marzo?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoMarzo = decodedData.federal.Marzo?.estado_Universidad.observacion
                    //Abril
                    self.montoAbril = decodedData.federal.Abril?.monto
                    self.montoRecibidoAbril = decodedData.federal.Abril?.montoRecibido
                    self.sepEstadoCumplimientoAbril = decodedData.federal.Abril?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoAbril = decodedData.federal.Abril?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoAbril = decodedData.federal.Abril?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoAbril = decodedData.federal.Abril?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoAbril = decodedData.federal.Abril?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoAbril = decodedData.federal.Abril?.estado_Universidad.observacion
                    //Mayo
                    self.montoMayo = decodedData.federal.Mayo?.monto
                    self.montoRecibidoMayo = decodedData.federal.Mayo?.montoRecibido
                    self.sepEstadoCumplimientoMayo = decodedData.federal.Mayo?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoMayo = decodedData.federal.Mayo?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoMayo = decodedData.federal.Mayo?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoMayo = decodedData.federal.Mayo?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoMayo = decodedData.federal.Mayo?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoMayo = decodedData.federal.Mayo?.estado_Universidad.observacion
                    //Junio
                    self.montoJunio = decodedData.federal.Junio?.monto
                    self.montoRecibidoJunio = decodedData.federal.Junio?.montoRecibido
                    self.sepEstadoCumplimientoJunio = decodedData.federal.Junio?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoJunio = decodedData.federal.Junio?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoJunio = decodedData.federal.Junio?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoJunio = decodedData.federal.Junio?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoJunio = decodedData.federal.Junio?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoJunio = decodedData.federal.Junio?.estado_Universidad.observacion
                    //Julio
                    self.montoJulio = decodedData.federal.Julio?.monto
                    self.montoRecibidoJulio = decodedData.federal.Julio?.montoRecibido
                    self.sepEstadoCumplimientoJulio = decodedData.federal.Julio?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoJulio = decodedData.federal.Julio?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoJulio = decodedData.federal.Julio?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoJulio = decodedData.federal.Julio?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoJulio = decodedData.federal.Julio?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoJulio = decodedData.federal.Julio?.estado_Universidad.observacion
                    //Agosto
                    self.montoAgosto = decodedData.federal.Agosto?.monto
                    self.montoRecibidoAgosto = decodedData.federal.Agosto?.montoRecibido
                    self.sepEstadoCumplimientoAgosto = decodedData.federal.Agosto?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoAgosto = decodedData.federal.Agosto?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoAgosto = decodedData.federal.Agosto?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoAgosto = decodedData.federal.Agosto?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoAgosto = decodedData.federal.Agosto?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoAgosto = decodedData.federal.Agosto?.estado_Universidad.observacion
                    //Septiembre
                    self.montoSeptiembre = decodedData.federal.Septiembre?.monto
                    self.montoRecibidoSeptiembre = decodedData.federal.Septiembre?.montoRecibido
                    self.sepEstadoCumplimientoSeptiembre = decodedData.federal.Septiembre?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoSeptiembre = decodedData.federal.Septiembre?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoSeptiembre = decodedData.federal.Septiembre?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoSeptiembre = decodedData.federal.Septiembre?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoSeptiembre = decodedData.federal.Septiembre?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoSeptiembre = decodedData.federal.Septiembre?.estado_Universidad.observacion
                    //Octubre
                    self.montoOctubre = decodedData.federal.Octubre?.monto
                    self.montoRecibidoOctubre = decodedData.federal.Octubre?.montoRecibido
                    self.sepEstadoCumplimientoOctubre = decodedData.federal.Octubre?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoOctubre = decodedData.federal.Octubre?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoOctubre = decodedData.federal.Octubre?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoOctubre = decodedData.federal.Octubre?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoOctubre = decodedData.federal.Octubre?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoOctubre = decodedData.federal.Octubre?.estado_Universidad.observacion
                    //Noviembre
                    self.montoNoviembre = decodedData.federal.Noviembre?.monto
                    self.montoRecibidoNoviembre = decodedData.federal.Noviembre?.montoRecibido
                    self.sepEstadoCumplimientoNoviembre = decodedData.federal.Noviembre?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoNoviembre = decodedData.federal.Noviembre?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoNoviembre = decodedData.federal.Noviembre?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoNoviembre = decodedData.federal.Noviembre?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoNoviembre = decodedData.federal.Noviembre?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoNoviembre = decodedData.federal.Noviembre?.estado_Universidad.observacion
                    //Diciembre
                    self.montoDiciembre = decodedData.federal.Diciembre?.monto
                    self.montoRecibidoDiciembre = decodedData.federal.Diciembre?.montoRecibido
                    self.sepEstadoCumplimientoDiciembre = decodedData.federal.Diciembre?.sep_estado.cumplimiento
                    self.sepEstadoFechaCumplimientoDiciembre = decodedData.federal.Diciembre?.sep_estado.fecha
                    self.sepEstadoObservacionCumplimientoDiciembre = decodedData.federal.Diciembre?.sep_estado.observacion
                    self.estadoUniversidadCumplimientoDiciembre = decodedData.federal.Diciembre?.estado_Universidad.cumplimiento
                    self.estadoUniversidadFechaCumplimientoDiciembre = decodedData.federal.Diciembre?.estado_Universidad.fecha
                    self.estadoUniversidadObservacionCumplimientoDiciembre = decodedData.federal.Diciembre?.estado_Universidad.observacion
                    //Informes
                    //Subsidio Ordinario
                    //Trimestre 1
                    self.subsidioOrdinarioTrimestre1Cumplimiento = decodedData.federal.informes?.subsidio_ordinario.trimestre1.cumplimiento
                    self.subsidioOrdinarioTrimestre1Observacion = decodedData.federal.informes?.subsidio_ordinario.trimestre1.observacion
                    //Trimestre 2
                    self.subsidioOrdinarioTrimestre2Cumplimiento = decodedData.federal.informes?.subsidio_ordinario.trimestre2.cumplimiento
                    self.subsidioOrdinarioTrimestre2Observacion = decodedData.federal.informes?.subsidio_ordinario.trimestre2.observacion
                    //Trimestre 3
                    self.subsidioOrdinarioTrimestre3Cumplimiento = decodedData.federal.informes?.subsidio_ordinario.trimestre3.cumplimiento
                    self.subsidioOrdinarioTrimestre3Observacion = decodedData.federal.informes?.subsidio_ordinario.trimestre3.observacion
                    //Trimestre 4
                    self.subsidioOrdinarioTrimestre4Cumplimiento = decodedData.federal.informes?.subsidio_ordinario.trimestre4.cumplimiento
                    self.subsidioOrdinarioTrimestre4Observacion = decodedData.federal.informes?.subsidio_ordinario.trimestre4.observacion
                    //Rendicion de Cuentas
                    //Trimestre 1
                    self.rendicionCuentasTrimestre1Cumplimiento = decodedData.federal.informes?.rendicion_cuentas.trimestre1.cumplimiento
                    self.rendicionCuentasTrimestre1Observacion = decodedData.federal.informes?.rendicion_cuentas.trimestre1.observacion
                    //Trimestre 2
                    self.rendicionCuentasTrimestre2Cumplimiento = decodedData.federal.informes?.rendicion_cuentas.trimestre2.cumplimiento
                    self.rendicionCuentasTrimestre2Observacion = decodedData.federal.informes?.rendicion_cuentas.trimestre2.observacion
                    //Trimestre 3
                    self.rendicionCuentasTrimestre3Cumplimiento = decodedData.federal.informes?.rendicion_cuentas.trimestre3.cumplimiento
                    self.rendicionCuentasTrimestre3Observacion = decodedData.federal.informes?.rendicion_cuentas.trimestre3.observacion
                    //Trimestre 4
                    self.rendicionCuentasTrimestre4Cumplimiento = decodedData.federal.informes?.rendicion_cuentas.trimestre4.cumplimiento
                    self.rendicionCuentasTrimestre4Observacion = decodedData.federal.informes?.rendicion_cuentas.trimestre4.observacion
                    //Matricula
                    //Semestre 1
                    self.matriculaSemestre1Cumplimiento = decodedData.federal.informes?.matricula.semestre1.cumplimiento
                    self.matriculaSemestre1Observacion = decodedData.federal.informes?.matricula.semestre1.observacion
                    //Semestre 2
                    self.matriculaSemestre2Cumplimiento = decodedData.federal.informes?.matricula.semestre2.cumplimiento
                    self.matriculaSemestre2Observacion = decodedData.federal.informes?.matricula.semestre2.observacion
                    //Montos
                    self.montoTotalSEP = decodedData.totales_adeudos.montoTotalSEP
                    self.adeudoFederal = decodedData.totales_adeudos.adeudoFederal.adeudo
                    self.fechaAdeudo = decodedData.totales_adeudos.adeudoFederal.fecha
                    
                    //Ministracion
                    self.monto = decodedData.federal.ministracion?.monto
                    self.sep_estado = decodedData.federal.ministracion?.sep_estado
                    self.fechaEjecucionEstado = decodedData.federal.ministracion?.fechaEjecucionEstado
                    self.estado_universidad = decodedData.federal.ministracion?.estado_universidad
                    self.fechaEjecucionUniversidad = decodedData.federal.ministracion?.fechaEjecucionUniversidad
                    self.observacion = decodedData.federal.ministracion?.observacion
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
