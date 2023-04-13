import Foundation

struct ProgramasData: Decodable {
    var programa: [Programa]
}
struct Programa: Decodable {
    var titulo: String
    var descripcion: [String]
}
