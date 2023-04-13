import Foundation

struct Filtros: Codable {
    var subsidios: Dictionary<String,Dictionary<String,String>>
    var clasificacion: Dictionary<String,Dictionary<String,String>>
    var categoria_estado: Dictionary<String,Dictionary<String,Dictionary<String,Dictionary<String,String>>>>
}



