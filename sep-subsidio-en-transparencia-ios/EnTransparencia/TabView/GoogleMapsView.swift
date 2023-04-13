//
//  SwiftUIView.swift
//  EnTransparencia
//
//  Created by Beatriz de la Rosa on 29/03/21.
//

import SwiftUI
import GoogleMaps
struct GoogleMapsView: UIViewRepresentable{
    
    @State var uni = [Universidad]()
    @EnvironmentObject var viewModel : ViewModel
    
    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GMSCameraPosition.camera(withLatitude: 23.634501, longitude: -102.552784, zoom: 5.1))
        self.viewModel.loadData(mapView: mapView, anio: self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual, categoria: self.viewModel.cambiarParametros ? self.viewModel.categoriaSelecionado : self.viewModel.categoriaActual, estado: self.viewModel.cambiarParametros ?  self.viewModel.estadoSeleccionado : self.viewModel.estadoActual)
        mapView.isMyLocationEnabled = false
        mapView.settings.myLocationButton = false
        mapView.mapStyle(whitFilename: "SilverTheme", andType: "json")
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
    }
}



extension GMSMapView{
    
    func mapStyle(whitFilename name: String, andType type: String){
        do{
            if let styleURL = Bundle.main.url(forResource: name, withExtension: type){
                self.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            }else{
                NSLog("No se pudo cargar el SlverTheme")
            }
        }
        catch{
            NSLog("Fallo la carga.\(error)")
        }
        
    }
}




struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
        
    }
    
}
