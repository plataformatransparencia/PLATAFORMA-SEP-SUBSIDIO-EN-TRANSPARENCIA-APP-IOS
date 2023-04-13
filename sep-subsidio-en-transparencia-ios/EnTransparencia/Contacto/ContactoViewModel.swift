

import Foundation

final class ContactoViewModel: ObservableObject{
    @Published var encabezado = ""
    @Published var departamento = ""
    @Published var direccion = ""
    @Published var telefono = ""
    @Published var extensiones = ""
    @Published var correo = ""
    @Published var isLoading = false
    
    func loadContactos(){
        guard let url = URL(string: "\(URL_BASE)/contacto")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                if let httpResponse = response as? HTTPURLResponse{
                    switch httpResponse.statusCode {
                    case 200:
                        let decodedData = try  JSONDecoder().decode(ContactoData.self, from: data)
                        DispatchQueue.main.sync {
                            self.encabezado = decodedData.encabezado
                            self.departamento = decodedData.departamento
                            self.direccion = decodedData.direccion
                            self.telefono = decodedData.telefono
                            self.extensiones = decodedData.extensiones
                            self.correo = decodedData.correo
                        }
                    default:
                        print("Ocurrio un error no detectado")
                    }
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
