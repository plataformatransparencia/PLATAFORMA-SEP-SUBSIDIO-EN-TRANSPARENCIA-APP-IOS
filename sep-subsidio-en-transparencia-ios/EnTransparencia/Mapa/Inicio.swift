import SwiftUI

struct Inicio: View {
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.vertical)
                VStack{
                    TopBand(width: geometry.size.width, height: geometry.size.height)
                    Filter()
                    if self.viewModel.cambiarMapa{
                        MapaReload(anio: self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual, categoria: self.viewModel.cambiarParametros ? self.viewModel.categoriaSelecionadokey : self.viewModel.categoriaSelecionadokeyActual, estado: self.viewModel.cambiarParametros ?  self.viewModel.estadoSeleccionado : self.viewModel.estadoActual,soloEstado: self.viewModel.soloEstado, isExtraordinario: self.viewModel.isExtraordinario, subsidio: self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionadokey : self.viewModel.subsidioSeleccionadokeyActual)
                    }else{
                        Mapa(anio: self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual, categoria: self.viewModel.cambiarParametros ? self.viewModel.categoriaSelecionadokey : self.viewModel.categoriaSelecionadokeyActual, estado: self.viewModel.cambiarParametros ?  self.viewModel.estadoSeleccionado : self.viewModel.estadoActual,soloEstado: self.viewModel.soloEstado, isExtraordinario: self.viewModel.isExtraordinario, subsidio: self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionadokey : self.viewModel.subsidioSeleccionadokeyActual)
                    }
                }
            }
        }
    }
}




