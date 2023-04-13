import Foundation

struct Referencias: Codable {
    var numeralia: [String:String]
    var subsidio_ordinario: SubsiOr?
    var subsidio_extraordinario: [String:String]?
    var subsidio_profexce: SubsiProfexce?
    var subsidio_presupuesto: SubsiPresupuesto?
}


struct SubsiOr: Codable {
    var anexo : [Int:String]
    var otras : [Int:String]
}

struct SubsiProfexce: Codable {
    var anexo : [Int:String]
}

struct SubsiPresupuesto: Codable{
    var titulo : String?
    var anexo : [Int:String]
}

struct Notas: Codable {
    var nota_especial: String?
    var nota_global: String?
}
