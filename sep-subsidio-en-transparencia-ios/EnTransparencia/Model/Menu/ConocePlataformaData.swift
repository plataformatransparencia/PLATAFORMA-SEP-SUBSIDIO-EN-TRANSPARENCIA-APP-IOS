import Foundation

struct ConocePlataformaData: Decodable {
    var Informacion_plataforma: Informacion
}
struct Informacion: Decodable {
    var titulo: String
    var video: String
    var descripcion: [String]
    var ley_universitaria: ley_universitaria
    var complemento: [String]
    var UPE: UPE
    var UPEAS: UPEAS
    var UI: UI
}

struct ley_universitaria: Decodable {
    var titulo: String
    var articulo62: articulo62
    var articulo67: articulo67
}

struct articulo62: Decodable {
    var titulo: String
    var descripcion: String
}

struct articulo67: Decodable {
    var titulo: String
    var descripcion: String
    var numerales: [numerales]
}

struct numerales: Decodable {
    var indice: String
    var descripcion: String
}

struct UPE: Decodable {
    var titulo: String
    var descripcion: String
}
struct UPEAS: Decodable {
    var titulo: String
    var descripcion: String
}
struct UI: Decodable {
    var titulo: String
    var descripcion: String
}

