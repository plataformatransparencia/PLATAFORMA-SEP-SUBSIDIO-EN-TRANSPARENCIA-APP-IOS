import Charts
import Foundation

struct Grafica{
    enum Categoria: String {
        case graficaPastel, graficaBarras
    }
    var categoria: Categoria
    var value:Double
    var label:String
    
    init(value: Double, label: String, categoria: Categoria) {
        self.value = value
        self.label = label
        self.categoria = categoria
    }
    
    static func entriesForWines(_ grafica: [Grafica], categoria: Categoria) -> [PieChartDataEntry]{
        let request = grafica.filter{$0.categoria == categoria}
        return request.map{PieChartDataEntry(value: $0.value, label: $0.label)}
    }
}

