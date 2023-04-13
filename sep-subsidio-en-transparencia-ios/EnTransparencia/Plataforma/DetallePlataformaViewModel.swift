import Foundation

final class DetallePlataformaViewModel: ObservableObject{
    @Published var tituloPlataforma = ""
    @Published var videoPlataforma = ""
    @Published var descripcionPlataforma = ["",""]
    @Published var tituloLeyUniversitaria = ""
    @Published var tituloArticulo62 = ""
    @Published var descripcionArticulo62 = ""
    @Published var tituloArticulo67 = ""
    @Published var descripcionArticulo67 = ""
    @Published var nume = [numerales]()
    @Published var complemento = ["",""]
    //UPE
    @Published var upeTitulo = ""
    @Published var upeDescripcion = ""
    //UPEAS
    @Published var upeasTitulo = ""
    @Published var upeasDescripcion = ""
    //UI
    @Published var uiTitulo = ""
    @Published var uiDescripcion = ""
    
    func loadDataPlataforma(){
        guard let url = URL(string: "\(URL_BASE)/plataforma")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(ConocePlataformaData.self, from: data)
                DispatchQueue.main.sync {
                    //Conoce la Plataforma en Transparencia
                    self.tituloPlataforma = decodedData.Informacion_plataforma.titulo
                    self.videoPlataforma = decodedData.Informacion_plataforma.video
                    self.descripcionPlataforma = decodedData.Informacion_plataforma.descripcion
                    //Ley universitaria
                    self.tituloLeyUniversitaria = decodedData.Informacion_plataforma.ley_universitaria.titulo
                    // articulo 62
                    self.tituloArticulo62 = decodedData.Informacion_plataforma.ley_universitaria.articulo62.titulo
                    self.descripcionArticulo62 = decodedData.Informacion_plataforma.ley_universitaria.articulo62.descripcion
                    // articulo 67
                    self.tituloArticulo67 = decodedData.Informacion_plataforma.ley_universitaria.articulo67.titulo
                    self.descripcionArticulo67 = decodedData.Informacion_plataforma.ley_universitaria.articulo67.descripcion
                    //numerales
                    self.nume = decodedData.Informacion_plataforma.ley_universitaria.articulo67.numerales
                    //complemento
                    self.complemento = decodedData.Informacion_plataforma.complemento
                    //UPE
                    self.upeTitulo = decodedData.Informacion_plataforma.UPE.titulo
                    self.upeDescripcion = decodedData.Informacion_plataforma.UPE.descripcion
                    //UPEAS
                    self.upeasTitulo = decodedData.Informacion_plataforma.UPEAS.titulo
                    self.upeasDescripcion = decodedData.Informacion_plataforma.UPEAS.descripcion
                    //UI
                    self.uiTitulo = decodedData.Informacion_plataforma.UI.titulo
                    self.uiDescripcion = decodedData.Informacion_plataforma.UI.descripcion
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
