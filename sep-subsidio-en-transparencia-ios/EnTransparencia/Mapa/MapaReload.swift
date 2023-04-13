import SwiftUI
import UIKit
import GoogleMaps

struct MapaReload: UIViewControllerRepresentable {
    var anio : String, categoria : String, estado : String, soloEstado: Bool = false, isExtraordinario: Bool, subsidio: String
    
    func makeUIViewController(context: Context) -> GoogleMapsController {
        let vc = GoogleMapsController()
        vc.anio = self.anio
        vc.categoria = self.categoria
        vc.estado = self.estado
        vc.soloEstado = self.soloEstado
        vc.isExtraordinario = self.isExtraordinario
        vc.subsidio = subsidio
        return vc
    }
    func updateUIViewController(_ uiViewController: GoogleMapsController, context: Context) { 
    }
}

struct MapaReload_Previews: PreviewProvider {
    static var previews: some View {
        MapaReload(anio: "", categoria: "", estado: "", isExtraordinario: true, subsidio: "")
    }
    
}
