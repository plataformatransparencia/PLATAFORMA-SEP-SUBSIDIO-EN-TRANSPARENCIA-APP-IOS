import SwiftUI
import Charts

struct MontosBarChartView: UIViewRepresentable {
    let months = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
    let montos : [Double]
    let montosRecibidos : [Double]
    func makeUIView(context: Context) -> BarChartView {
        return BarChartView()
    }
    func updateUIView(_ uiView: BarChartView, context: Context) {
        formatLegend(legend: uiView.legend)
        formatXAxis(xAxis: uiView.xAxis)
        formatLeftAxis(leftAxis: uiView.leftAxis)
        uiView.rightAxis.enabled = false
        if uiView.scaleX == 1.0 {
            uiView.zoom(scaleX: 3.8, scaleY: 0.9, x: 0, y: 0)
        }
        uiView.setScaleEnabled(false)
        setChart(uiView: uiView)
        uiView.extraBottomOffset = 10
    }
    func formatXAxis(xAxis: XAxis){
        xAxis.valueFormatter = IndexAxisValueFormatter(values: self.months)
        xAxis.labelFont = UIFont(name: "Arial", size: 15)!
        xAxis.labelTextColor = UIColor(Color("gris1"))
        xAxis.drawGridLinesEnabled = false
        xAxis.labelPosition = .bottom
        xAxis.centerAxisLabelsEnabled = true
        xAxis.granularity = 1
        xAxis.labelRotationAngle = 00.0
        xAxis.yOffset = 5
    }
    func formatLeftAxis(leftAxis: YAxis){
        leftAxis.labelFont = UIFont(name: "Arial", size: 15)!
        leftAxis.labelTextColor = UIColor(Color("gris1"))
        leftAxis.valueFormatter = LargeValueFormatter()
        leftAxis.axisMinimum = 0
        leftAxis.spaceTop = 0.35
        leftAxis.spaceBottom = 0.5
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = false
    }
    func formatLegend(legend: Legend){
        legend.enabled = true
        legend.font = UIFont(name: "Arial", size: 15)!
        legend.formSize = 15
        legend.formToTextSpace = 10
        legend.textColor = UIColor(Color("gris1"))
        legend.drawInside = false
        legend.orientation = .horizontal
        legend.horizontalAlignment = .left
        legend.verticalAlignment = .bottom
        legend.yEntrySpace = 10.0
        legend.xOffset = 0.0
        legend.yOffset = 10.0
    }
    func setChart(uiView: BarChartView){
        uiView.noDataText = "Cargando..."
        var monto: [BarChartDataEntry] = []
        var montoRecibido: [BarChartDataEntry] = []
        for i in 0..<self.months.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: self.montos[i])
            monto.append(dataEntry)
            let dataEntry1 = BarChartDataEntry(x: Double(i), y: self.montosRecibidos[i])
            montoRecibido.append(dataEntry1)
        }
        let chartDataSet = BarChartDataSet(entries: monto, label: "Monto Calendarizado")
        let chartDataSet1 = BarChartDataSet(entries: montoRecibido, label: "Monto Recibido")
        let dataSets : [BarChartDataSet] = [chartDataSet, chartDataSet1]
        uiView.backgroundColor = UIColor(Color(.white))
        uiView.drawValueAboveBarEnabled = true
        chartDataSet.highlightEnabled = false
        chartDataSet.barBorderColor = UIColor(Color("verde3"))
        chartDataSet.drawValuesEnabled = true
        chartDataSet.colors =  [UIColor(Color("verde3"))]
        chartDataSet.valueColors = [UIColor(Color("gris1"))]
        chartDataSet1.highlightEnabled = false
        chartDataSet1.barBorderColor = UIColor(Color("verde1"))
        chartDataSet1.drawValuesEnabled = true
        chartDataSet1.colors =  [UIColor(Color("verde1"))]
        chartDataSet1.valueColors = [UIColor(Color("gris1"))]
        let chartData = BarChartData(dataSets: dataSets)
        chartData.setValueFont( NSUIFont(name: "Arial", size: CGFloat(12.0))!)
        chartData.setValueFormatter(LargeValueFormatter())
        chartData.barWidth = 0.400
        uiView.xAxis.axisMinimum = Double(0)
        uiView.xAxis.axisMaximum = 12
        chartData.groupBars(fromX: 0.0, groupSpace: 0.2, barSpace: 0.0)
        uiView.notifyDataSetChanged()
        uiView.data = chartData
    }
}

class MarkerView1: UIView {
    @IBOutlet var valueLabel : UILabel!
    @IBOutlet var metricLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
}
struct MontosBarChartView_Previews: PreviewProvider {
    static var previews: some View{
        MontosBarChartView(montos: [22252759,12343378,123221,12348878,12343998,121121,1231178,1231178,123211,12335678,12345578,1123221], montosRecibidos: [1123221,12345578, 12335678, 123211, 1231178,12311888, 121121, 12343998,12348878,123221, 12345678,1000 ]).frame(width: 350 , height: 350)
    }
}

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
