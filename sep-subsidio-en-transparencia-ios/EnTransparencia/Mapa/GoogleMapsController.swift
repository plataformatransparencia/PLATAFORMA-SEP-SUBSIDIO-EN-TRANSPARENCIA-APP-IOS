import UIKit
import GoogleMaps
import SwiftUI

class GoogleMapsController: UIViewController, GMSMapViewDelegate{
    
    @IBOutlet weak var mapView: GMSMapView!
    var anio : String = "", categoria : String = "", estado : String = "", soloEstado: Bool = false, viewModel = ViewModel(), id : Int = 0, logo : String =  "", isExtraordinario: Bool = false, subsidio: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var camera = GMSCameraPosition.camera(withLatitude: LATITUD_MAPA, longitude: LONGITUD_MAPA, zoom: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 6.1 : 5.1)
        let options = GMSMapViewOptions()
        options.camera = camera
        options.frame = view.frame
        let mapView = GMSMapView(options:options)
        view.addSubview(mapView)
        self.viewModel.loadData(anio: self.anio, categoria: self.categoria, estado: self.estado, subsidio: self.subsidio, unicompletionHandler: {uni, error in
            if let uni = uni {
                DispatchQueue.main.async {
                    for i in uni{
                        if uni.capacity <= 8 && self.soloEstado{
                            camera = GMSCameraPosition.camera(withLatitude: i.latitud, longitude: i.longitud, zoom: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 6.1 : 5.1)
                            mapView.camera = camera
                        }
                        let location = CLLocationCoordinate2D(latitude: i.latitud, longitude: i.longitud)
                        let marker = GMSMarker(position: location)
                        marker.title = i.nombre
                        marker.snippet = i.siglas
                        marker.accessibilityLabel = i.logo
                        marker.accessibilityHint = String(i.id)
                        mapView.isMyLocationEnabled = false
                        mapView.settings.myLocationButton = false
                        self.id = i.id
                        self.logo = i.logo
                        switch self.subsidio {
                        case "subsidio_ordinario":
                            switch i.clasificacion {
                            case 1:
                                marker.icon = imageWithImage(image: UIImage(named: "UPE")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                            case 2:
                                marker.icon = imageWithImage(image: UIImage(named: "UPEAS")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                            case 3:
                                marker.icon = imageWithImage(image: UIImage(named: "UI")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                            default:
                                break
                            }
                        case "":
                            switch i.clasificacion {
                            case 1:
                                marker.icon = imageWithImage(image: UIImage(named: "UPE")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                            case 2:
                                marker.icon = imageWithImage(image: UIImage(named: "UPEAS")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                            case 3:
                                marker.icon = imageWithImage(image: UIImage(named: "UI")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                            default:
                                break
                            }
                        case "subsidio_extraordinario":
                            marker.icon = imageWithImage(image: UIImage(named: "Extraordinario")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                        case "subsidio_presupuesto":
                            marker.icon = imageWithImage(image: UIImage(named: "Extraordinario")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                        case "subsidio_profexce":
                        marker.icon = imageWithImage(image: UIImage(named: "Extraordinario")!, scaledToSize: CGSize(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50))
                        default:
                            break
                        }
                        marker.map = mapView
                    }
                }
            }
        })
        mapView.mapStyle(whitFilename: "SilverTheme", andType: "json")
        mapView.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    class func instanceFromNib() -> MarkerWindow{
        return UINib(nibName: "MarkerWindow", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MarkerWindow
    }
    var tappedMarker = GMSMarker()
    var infoWindow = MarkerWindow()
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let location = CLLocationCoordinate2D(latitude: marker.position.latitude, longitude: marker.position.longitude)
        tappedMarker = marker
        infoWindow.removeFromSuperview()
        infoWindow = GoogleMapsController.instanceFromNib()
        infoWindow.siglasUniversidad.text = marker.snippet
        infoWindow.nombreUniversidad.text = marker.title
        infoWindow.center = mapView.projection.point(for: location)
        infoWindow.center.y = infoWindow.center.y - 107
        infoWindow.logoUniversidad.layer.frame = CGRect(x: 10, y: 10, width: 300, height: 150)
        downloadImage(urlstr: marker.accessibilityLabel!, imageView: infoWindow.logoUniversidad)
        let action = UIAction{ action in
            let universidadDetil = UniversidadDetail(logo: marker.accessibilityLabel!, isExtraordinario: self.isExtraordinario, subsidioSeleccionadokey: self.subsidio, anio: Int(self.anio)!, id: marker.accessibilityHint!, bandera: false)
            let childView = UIHostingController(rootView: universidadDetil)
            self.present(childView, animated: true, completion: nil)
        }
        
        infoWindow.btnInformacion.addAction(action, for: .touchUpInside)
        infoWindow.btnCerrar.addTarget(self, action: #selector(closeInfoWindow), for: .touchUpInside)
        infoWindow.backgroundColor = UIColor(white: 1, alpha: 0.8)
        infoWindow.btnCerrar.backgroundColor = UIColor(white: 1, alpha: 0.1)
        self.view.addSubview(infoWindow)
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let location = CLLocationCoordinate2D(latitude: tappedMarker.position.latitude, longitude: tappedMarker.position.longitude)
        infoWindow.center = mapView.projection.point(for: location)
        infoWindow.center.y = infoWindow.center.y - 107
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    @IBAction func closeInfoWindow(_: UIButton) {
        infoWindow.removeFromSuperview()
    }
    
}

extension UIButton {
    private func actionHandleBlock(action:(() -> Void)? = nil) {
        struct __ {
            static var action :(() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    @objc private func triggerActionHandleBlock() {
        self.actionHandleBlock()
    }
    func actionHandle(controlEvents control : UIControl.Event, ForAction action:@escaping () -> Void) {
        self.actionHandleBlock(action: action)
        self.addTarget(self, action: #selector(self.triggerActionHandleBlock), for: control)
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
