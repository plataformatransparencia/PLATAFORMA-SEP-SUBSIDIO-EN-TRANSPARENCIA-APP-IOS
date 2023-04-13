import SwiftUI
import GoogleMaps

struct GridView: View {
    @Binding var filterBySearch: String
    let layout: [GridItem]
    @State var uni = [Universidad]()
    @State var anio: String = ""
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        LazyVGrid(columns: layout){
            if !filterBySearch.isEmpty {
                ForEach(viewModel.uni.sorted{$0.siglas < $1.siglas}.filter{$0.siglas.lowercased().contains(filterBySearch.lowercased()) || $0.nombre.lowercased().contains(filterBySearch.lowercased())}, id: \.id){ item in
                    NavigationLink(
                        destination: UniversidadDetail(logo: item.logo, isExtraordinario: self.viewModel.isExtraordinario, subsidioSeleccionadokey: self.viewModel.subsidioSeleccionadokey, anio: Int(self.viewModel.cambiarParametros ? self.viewModel.anioSeleccionado : self.viewModel.anioActual)!, id: String(item.id), bandera: true),
                        label: {
                            VStack(alignment: .leading){
                                GridCellView(nombre: item.nombre, siglas: item.siglas, logo: item.logo)
                            }
                        })
                }
            } else {
                ForEach(self.viewModel.uni.sorted{$0.siglas < $1.siglas}, id: \.id){ item in
                    NavigationLink(
                        destination: UniversidadDetail(logo: item.logo, isExtraordinario: self.viewModel.isExtraordinario, subsidioSeleccionadokey: self.viewModel.subsidioSeleccionadokey, anio: Int(self.viewModel.cambiarParametros ? self.viewModel.anioSeleccionado : self.viewModel.anioActual)!, id: String(item.id), bandera: true),
                        label: {
                            VStack(alignment: .leading){
                                GridCellView(nombre: item.nombre, siglas: item.siglas, logo: item.logo)
                            }
                        })
                }
            }
        }
        .padding(.bottom, 65)
        .onAppear{
            self.viewModel.loadData(anio: self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual, categoria: self.viewModel.cambiarParametros ? self.viewModel.categoriaSelecionadokey : self.viewModel.categoriaSelecionadokeyActual, estado: self.viewModel.cambiarParametros ?  self.viewModel.estadoSeleccionado : self.viewModel.estadoActual,subsidio: self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionadokey : self.viewModel.subsidioSeleccionadokeyActual, unicompletionHandler: {uni, error in
                if let uni = uni {
                    DispatchQueue.main.async {
                        viewModel.uni = uni
                    }
                }
            })
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(filterBySearch: Binding.constant(""),layout: [
            GridItem(.adaptive(minimum: 250))
        ])
    }
}
