import SwiftUI
import GoogleMaps

struct Filter: View {
    @EnvironmentObject var viewModel : ViewModel
    @StateObject private var filtroViewModel = FiltroViewModel()
    @State var isPresented = false
    @State var isSelected = false
    
    var body: some View{
        VStack{
            HStack{
                Text(TITULO_FILTRO)
                    .font(.titulo())
                    .foregroundColor(.black)
                Spacer()
                if self.viewModel.cambiarParametros {
                    Button(action: {
                        self.viewModel.deshacerFiltro = true
                        self.viewModel.cambiarParametros = false
                        self.viewModel.loadData(anio: self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual, categoria: self.viewModel.cambiarParametros ? self.viewModel.categoriaSelecionadokey : self.viewModel.categoriaSelecionadokeyActual, estado: self.viewModel.cambiarParametros ?  self.viewModel.estadoSeleccionado : self.viewModel.estadoActual, subsidio: self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionadokey : self.viewModel.subsidioSeleccionadokeyActual, unicompletionHandler: {uni, error in
                            if let uni = uni {
                                DispatchQueue.main.async {
                                    viewModel.uni = uni
                                }
                            }
                        })
                        self.viewModel.anioSeleccionado = self.viewModel.anioActual
                        self.viewModel.subsidioSeleccionado = self.viewModel.subsidioActual
                        self.viewModel.categoriaSelecionado = "0"
                        self.viewModel.estadoSeleccionado = "0"
                        self.viewModel.cambiarMapa = false
                        self.viewModel.soloEstado = false
                        self.viewModel.subsidioSeleccionadokey = ""
                        self.viewModel.isSubsidioSelect = false
                        self.viewModel.isExtraordinario = false
                        self.viewModel.isCategoriaSelected = false
                        self.viewModel.categoriaSelecionado = self.viewModel.categoriaActual
                        self.viewModel.categoriaSelecionadokey = self.viewModel.categoriaSelecionadokeyActual
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 50 : 30, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25)
                    })
                }
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(self.viewModel.cambiarParametros ? Color("gris1") : Color("negro"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 50 : 30, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25)
                }).disabled(self.viewModel.cambiarParametros == true)
            }
        }.padding([.top, .horizontal, .bottom])
        .sheet(isPresented: $isPresented, content: {
            VStack{
                HStack{
                    Button(action: {
                        self.isPresented.toggle()
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 50 : 30, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 25)
                            .padding(.trailing, -25)
                    })
                    Spacer()
                    Text(TITULO_FILTRO_MODAL)
                        .font(.titulo())
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.horizontal)
                .padding(.top, 15)
                Divider()
                    .background(Color("gris1"))
                ScrollView(showsIndicators: true){
                    Text(SUBTITULO_FILTRO_MODAL)
                        .font(.titulo())
                        .foregroundColor(.black)
                        .bold()
                    VStack{
                        VStack(alignment: .leading){
                            DropDownAnios(subsidios: filtroViewModel.subsidios)
                            DropDownSubsidioExtraordinario(subsidios: filtroViewModel.subsidios, anio: self.viewModel.anioSeleccionado)
                            DropDownCategorias(clasificacion: filtroViewModel.clasificacion, subsidioSeleccionadokey: self.viewModel.subsidioSeleccionadokey, categoria_estado: filtroViewModel.categoria_estado)
                        }.padding(.top, 30)
                    }.onAppear(perform: filtroViewModel.loadDataFilter)
                    .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 5)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(25)
                    .edgesIgnoringSafeArea(.bottom)
                }
                Button(action: {
                    self.isPresented.toggle()
                    if(self.viewModel.subsidioSeleccionadokey == ""){
                        if self.viewModel.anioSeleccionado == "2018"{
                            self.viewModel.subsidioSeleccionadokey = "subsidio_extraordinario"
                        }else{
                            self.viewModel.subsidioSeleccionadokey = "subsidio_ordinario"
                        }
                        
                    }
                    if (self.viewModel.subsidioSeleccionadokey != self.viewModel.subsidioSeleccionadokeyActual || self.viewModel.categoriaSelecionado != self.viewModel.categoriaActual || self.viewModel.estadoSeleccionado != self.viewModel.estadoActual) || self.viewModel.anioSeleccionado == "2021" && self.viewModel.subsidioSeleccionadokey == "subsidio_ordinario" {
                        self.viewModel.cambiarParametros = true
                        
                        switch self.viewModel.subsidioSeleccionadokey{
                        case "subsidio_extraordinario":
                            self.viewModel.isExtraordinario = true
                            self.viewModel.isSubsidioSelect = true
                        case "subsidio_profexce":
                            self.viewModel.isExtraordinario = true
                            self.viewModel.isSubsidioSelect = true
                        case "subsidio_presupuesto":
                            self.viewModel.isExtraordinario = true
                            self.viewModel.isSubsidioSelect = true
                        case "subsidio_ordinario":
                            self.viewModel.isSubsidioSelect = true
                            self.viewModel.isExtraordinario = false
                        default:
                            self.viewModel.isExtraordinario = false
                            self.viewModel.isSubsidioSelect = false
                        }
                        
                        self.viewModel.loadData(anio: self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual, categoria: self.viewModel.cambiarParametros ? self.viewModel.categoriaSelecionadokey : self.viewModel.categoriaSelecionadokeyActual, estado: self.viewModel.cambiarParametros ?  self.viewModel.estadoSeleccionado : self.viewModel.estadoActual, subsidio: self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionadokey : self.viewModel.subsidioSeleccionadokeyActual, unicompletionHandler: {uni, error in
                            if let uni = uni {
                                DispatchQueue.main.async {
                                    viewModel.uni = uni
                                }
                            }
                        })
                        
                        self.viewModel.isAnioSelected = false
                        self.viewModel.cambiarMapa = true
                        self.viewModel.isSubsidioSelect = false
                        self.viewModel.isCategoriaSelected = false
                    }
                    
                    if (self.viewModel.anioSeleccionado == "2019" || self.viewModel.anioSeleccionado == "2020" || self.viewModel.anioSeleccionado == "2021" || self.viewModel.anioSeleccionado == "2018") && (self.viewModel.categoriaSelecionado != "0" || self.viewModel.estadoSeleccionado != "0") {
                     self.viewModel.soloEstado = true
                     }
                }, label: {
                    Text(TEXTO_BOTON_FILTRO)
                        .font(.titulo())
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 500 : 350, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50, alignment: .center)
                        .background(Color("verde1"))
                        .foregroundColor(.white)
                        .padding()
                })
            }.background(Color.white)
        })
        .background(Color.white)
    }
    
    
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter()
    }
}
