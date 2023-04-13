import Foundation

struct ObjectUniversidades: Codable {
    var universidades: [Universidad]
}

struct Universidad: Codable {
    var id: Int
    var clasificacion: Int
    var estado: String
    var nombre: String
    var siglas: String
    var latitud: Double
    var longitud: Double
    var logo: String
}
