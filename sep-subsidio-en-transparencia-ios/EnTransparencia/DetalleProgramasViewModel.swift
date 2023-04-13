import Foundation

final class DetalleProgramasViewModel: ObservableObject{
    //Acerca de los programas
    @Published var programa = [Programa]()
    
    func loadDataProgramas(){
        guard let url = URL(string: "\(URL_BASE)/programas")
        else{
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(ProgramasData.self, from: data)
                DispatchQueue.main.sync {
                    //Acerca de los programas
                    self.programa = decodedData.programa
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
