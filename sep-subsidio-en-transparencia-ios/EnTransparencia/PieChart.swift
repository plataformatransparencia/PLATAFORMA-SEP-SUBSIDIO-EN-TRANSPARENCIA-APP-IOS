import SwiftUI
import Charts

struct PieChart: UIViewRepresentable {
    var entries: [PieChartDataEntry]
    let pieChart = PieChartView()
    func makeUIView(context: Context) -> PieChartView {
        return pieChart
    }
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = [UIColor(Color("verde2")),UIColor(Color("verde3")) ]
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData
        configureChart(uiView)
        formatCenter(uiView)
        formatDescription(uiView.chartDescription)
        formatLegend(uiView.legend)
        formatDataSet(dataSet)
        uiView.notifyDataSetChanged()
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
    }
    func configureChart(_ pieChart: PieChartView){
        pieChart.rotationEnabled = false
        pieChart.drawEntryLabelsEnabled = false
        pieChart.usePercentValuesEnabled = true
        pieChart.highlightValue(x: -1, dataSetIndex: 0, callDelegate: false)
    }
    func formatCenter(_ pieChart: PieChartView){
        pieChart.holeColor = UIColor(Color(.white))
        pieChart.centerTextRadiusPercent = 1.00
        pieChart.usePercentValuesEnabled = true
    }
    func formatDescription(_ description: Description) {
        description.font = UIFont.boldSystemFont(ofSize: 17)
        description.textColor = UIColor(Color(.white))
    }
    func formatLegend(_ legend: Legend){
        legend.enabled = false
    }
    func formatDataSet(_ dataSet: ChartDataSet){
        dataSet.drawValuesEnabled = true
    }
}

struct PieChart1: UIViewRepresentable {
    var entries: [PieChartDataEntry]
    let pieChart = PieChartView()
    func makeUIView(context: Context) -> PieChartView {
        return pieChart
    }
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = [UIColor(Color("rosita"))]
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData
        configureChart(uiView)
        formatCenter(uiView)
        formatDescription(uiView.chartDescription)
        formatLegend(uiView.legend)
        formatDataSet(dataSet)
        uiView.notifyDataSetChanged()
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        pieChartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
    }
    func configureChart(_ pieChart: PieChartView){
        pieChart.rotationEnabled = false
        pieChart.drawEntryLabelsEnabled = false
        pieChart.usePercentValuesEnabled = true
        pieChart.highlightValue(x: -1, dataSetIndex: 0, callDelegate: false)
    }
    func formatCenter(_ pieChart: PieChartView){
        pieChart.holeColor = UIColor(Color(.white))
        pieChart.centerTextRadiusPercent = 1.00
        pieChart.usePercentValuesEnabled = true
    }
    func formatDescription(_ description: Description) {
        description.font = UIFont.boldSystemFont(ofSize: 17)
        description.textColor = UIColor(Color(.white))
    }
    func formatLegend(_ legend: Legend){
        legend.enabled = false
    }
    func formatDataSet(_ dataSet: ChartDataSet){
        dataSet.drawValuesEnabled = true
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View{
        PieChart(entries: Grafica.entriesForWines(
                    [
                        Grafica(value: 123456787654.00, label: "Monto Federal", categoria: .graficaPastel),
                        Grafica(value: 231456787654.00, label: "Monto Estatal", categoria: .graficaPastel)
                    ]
                    , categoria: .graficaPastel))
            .frame(height: 250)
            .padding()
    }
}
