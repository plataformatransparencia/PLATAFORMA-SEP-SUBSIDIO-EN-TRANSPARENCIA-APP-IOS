import Foundation

final class CompromisosUniversidadViewModel: ObservableObject{
    @Published var compromisos : [CompromisosDatos]? = nil
    @Published var compromisosVA : [CompromisosDatos]? = nil
    @Published var compromisosVB : [CompromisosDatos]? = nil
    @Published var compromisosVC : [CompromisosDatos]? = nil
    @Published var montoAsignado = 0.0
    @Published var fechaDepEst : String? = ""
    @Published var fechaDepUni : String? = ""
    @Published var observaciones : String? = ""
    @Published var referencias : Dictionary<String,String>? = nil
    @Published var actividades: [Actividades]? = nil
    @Published var entregas : [Entregas]? = nil
    
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
                    let _ = print("algo1 entro a descargar datos")
                    let decodedData =  try JSONDecoder().decode(CompromisosVertiente.self, from: data)
                    DispatchQueue.main.async {
                        print("bien")
                        self.compromisosVA = decodedData.compromisos?.vertienteA
                        self.compromisosVB = decodedData.compromisos?.vertienteB
                        self.compromisosVC = decodedData.compromisos?.vertienteC
                        self.referencias = decodedData.referencias
                    }
                }else{
                    let decodedData = try  JSONDecoder().decode(CompromisosData.self, from: data)
                    DispatchQueue.main.async {
                        self.compromisos = decodedData.compromisos
                        self.referencias = decodedData.referencias
                        self.actividades = decodedData.actividades
                        self.entregas = decodedData.entregas
                        if decodedData.tablaMontoUniversidad != nil{
                            self.fechaDepEst =  decodedData.tablaMontoUniversidad!.fechaDepEst
                            self.fechaDepUni =  decodedData.tablaMontoUniversidad!.fechaDepUni
                            self.observaciones =  decodedData.tablaMontoUniversidad!.observaciones
                            self.montoAsignado = decodedData.tablaMontoUniversidad!.monto
                        }
                    }
                }
                
                
                
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
