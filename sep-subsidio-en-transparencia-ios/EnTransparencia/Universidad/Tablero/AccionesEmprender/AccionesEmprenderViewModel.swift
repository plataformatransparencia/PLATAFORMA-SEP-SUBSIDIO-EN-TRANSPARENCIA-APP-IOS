import Foundation

final class AccionesEmprenderViewModel: ObservableObject{
    @Published var acciones = [Action]()
    @Published var Materiales_Suministros_Acciones : [Action]? = nil
    @Published var Servicios_Generales_Acciones : [Action]? = nil
    @Published var Asignaciones_Subsidios_otras_Ayudas : [Action]? = nil
    @Published var Bienes_muebles_inmuebles : [Action]? = nil
    @Published var Obras_remodelaciones : [Action]? = nil
    @Published var referencias : Dictionary<String, String>? = nil
    @Published var fechaEstipulada = ""
    @Published var fechaEjecucion = ""
    @Published var cumplimiento = ""
    @Published var observacion = ""
    
    @Published var busqueda = "http://transparencia.uasnet.mx/?seccion=2&subseccion=168"
    
    func loadAcciones(anio: Int, id: String, tipo: String){
        guard let url = URL(string: "\(URL_BASE)/acciones/\(anio)/\(id)/\(tipo)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(AccionesData.self, from: data)
                DispatchQueue.main.async {
                    self.acciones = decodedData.Acciones.Acciones
                    self.Materiales_Suministros_Acciones = decodedData.Acciones.Materiales_Suministros_Acciones
                    self.Servicios_Generales_Acciones = decodedData.Acciones.Servicios_Generales_Acciones
                    self.Asignaciones_Subsidios_otras_Ayudas = decodedData.Acciones.Asignaciones_Subsidios_otras_Ayudas
                    self.Bienes_muebles_inmuebles = decodedData.Acciones.Bienes_muebles_inmuebles
                    self.Obras_remodelaciones = decodedData.Acciones.Obras_remodelaciones
                    self.referencias = decodedData.referencias
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
