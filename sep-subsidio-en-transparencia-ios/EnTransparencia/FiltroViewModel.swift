import Foundation


final class FiltroViewModel: ObservableObject{
    
    @Published var categoria_estado = Dictionary<String,Dictionary<String,Dictionary<String,Dictionary<String,String>>>>()
    @Published var subsidios = Dictionary<String,Dictionary<String,String>>()
    @Published var clasificacion = Dictionary<String,Dictionary<String,String>>()
    
    func loadDataFilter(){
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
                    self.subsidios = decodedData.subsidios
                    self.clasificacion = decodedData.clasificacion
                    self.categoria_estado = decodedData.categoria_estado
                    //print("\(decodedData)")
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
