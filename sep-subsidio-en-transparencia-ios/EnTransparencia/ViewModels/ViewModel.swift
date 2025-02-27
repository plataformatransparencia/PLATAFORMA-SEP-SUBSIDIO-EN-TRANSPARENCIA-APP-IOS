import SwiftUI
import GoogleMaps

class ViewModel: ObservableObject {
    @Published var uni = [Universidad]()
    //Año
    @Published var isAnioSelected = false
    @Published var anioActual = ""
    @Published var anioSeleccionado = ""
    //Subsidios
    @Published var subsidioActual = ""
    @Published var subsidioSeleccionado = ""
    @Published var subsidioSeleccionadokey = ""
    @Published var subsidioSeleccionadokeyActual = ""
    @Published var isSubsidioSelect = false
    //Categoria
    @Published var categoriaActual = "0"
    @Published var categoriaSelecionado = "0"
    @Published var categoriaSelecionadokey = "0"
    @Published var categoriaSelecionadokeyActual = "0"
    @Published var isCategoriaSelected = false
    //Estados
    @Published var estadoSeleccionado = "0"
    @Published var estadoActual = "0"
    @Published var isEstadoSelected = false
    @Published var soloEstado = false
    //Extraordinario
    @Published var isExtraordinario = false
    //Filtro
    @Published var deshacerFiltro = false
    @Published var cambiarParametros = false
    //Mapa
    @Published var mapaDefault = false
    @Published var cambiarMapa = false
    
    init(){
        let dateFormater = DateFormatter()
        let date = Date()
        loadDataFilterLastYear()
        dateFormater.setLocalizedDateFormatFromTemplate("y")
        self.anioActual = dateFormater.string(from: date)
        self.anioSeleccionado = self.anioActual
        self.subsidioActual = "Subsidio Ordinario"
        self.subsidioSeleccionado = self.subsidioActual
    }
    
    func loadData(anio: String, categoria: String, estado: String,subsidio: String, unicompletionHandler: @escaping ([Universidad]?, Error?) -> Void){
        let url = URL(string: "\(URL_BASE)/universidades2/\(anio)/\(categoria)/\(estado)/\(subsidio)")!
        let task = URLSession.shared.dataTask(with: url, completionHandler:  {data, response, error in
            guard let data = data else{return}
            do{
                if let httpResponse = response as? HTTPURLResponse{
                    switch httpResponse.statusCode {
                    case 200:
                        let decodedData = try  JSONDecoder().decode(ObjectUniversidades.self, from: data)
                        DispatchQueue.main.sync {
                            unicompletionHandler(decodedData.universidades, nil)
                        }
                    default:
                        print("Ocurrio un error no detectado")
                    }
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
                unicompletionHandler(nil, error)
            }
        })
        task.resume()
    }
    func loadDataFilterLastYear(){
        guard let url = URL(string: "\(URL_BASE)/filtros2")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(Filtros.self, from: data)
                DispatchQueue.main.sync {
                    let anios =  Array(decodedData.subsidios.keys)
                    if self.anioActual != anios.max()!{
                        self.anioActual = anios.max()!
                        self.cambiarMapa = true
                    }
                    
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
    
}





