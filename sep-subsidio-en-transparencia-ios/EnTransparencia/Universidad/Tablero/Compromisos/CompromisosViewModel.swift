//
//  CompromisosViewModel.swift
//  EnTransparencia
//
//  Created by Invitado on 26/02/25.
//

import Foundation

final class CompromisosViewModel: ObservableObject{
    @Published var compromisos:[CompromisoM] = []
    @Published var itso: [CompromisoM] = []
    @Published var pef: [CompromisoM] = []
    @Published var matricula: [CompromisoM] = []
    
    
    func loadCompromisos(anio:Int,id:String,  subsidio: String, tipo:String?){
        
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
                let decodedData = try  JSONDecoder().decode(DatosCompromisos.self, from: data)
                DispatchQueue.main.async {
                    self.compromisos = decodedData.compromisos
                    self.itso = decodedData.itso
                    self.pef = decodedData.pef
                    self.matricula = decodedData.matricula
                }
            }catch{
                print("No se pudo completar la petición. Error: \(error)")
            }
        }.resume()
    }
    
    
}
    

