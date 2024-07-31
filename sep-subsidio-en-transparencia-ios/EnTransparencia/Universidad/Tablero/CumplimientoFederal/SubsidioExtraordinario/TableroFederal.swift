import SwiftUI

struct TableroFederal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var tituloTablero : String
    @State var anio: Int
    @State var id: String
    @State var tipo: String
    @StateObject private var tableroCumplimientoFederalViewModel = TableroCumplimientoFederalViewModel()
    var body: some View {
        VStack{
            NavigationView{
                ZStack{
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(showsIndicators: false){
                        HStack{
                            VStack{
                                HStack{
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "chevron.left")
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    })
                                    Spacer()
                                    Text("\(self.tituloTablero)")
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .top])
                        .background(Color.white)
                        VStack(alignment: .leading){
                            if tableroCumplimientoFederalViewModel.vertienteA != nil || tableroCumplimientoFederalViewModel.vertienteB != nil || tableroCumplimientoFederalViewModel.vertienteC != nil{
                                if tableroCumplimientoFederalViewModel.vertienteA == "A"{
                                    VStack(alignment: .center){
                                        Rectangle().frame(height:0)
                                        Text("Vertiente A:")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            
                                            .foregroundColor(Color("rosita"))
                                            .multilineTextAlignment(.center)
                                    }.padding(.bottom, 15)
                                    Text("Monto")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(Color("rosita"))
                                    NavigationLink(
                                        destination: DetalleTableroFederal(monto: tableroCumplimientoFederalViewModel.montoA ?? 0.0, sep_estado: tableroCumplimientoFederalViewModel.sep_estadoA ?? 0.0, fechaEjecucionEstado: tableroCumplimientoFederalViewModel.fechaEjecucionEstadoA ?? "", estado_universidad: tableroCumplimientoFederalViewModel.estado_universidadA ?? 0.0, fechaEjecucionUniversidad: tableroCumplimientoFederalViewModel.fechaEjecucionUniversidadA ?? "", observacion: tableroCumplimientoFederalViewModel.observacionA ?? ""),
                                        label: {
                                            HStack {
                                                Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.montoA ?? 0.0))))")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.top,5)
                                        })
                                    Divider().background(Color("gris1")).padding(.top,15)
                                }
                                if tableroCumplimientoFederalViewModel.vertienteB == "B"{
                                    VStack(alignment: .center){
                                        Rectangle().frame(height:0)
                                        Text("Vertiente B:")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(Color("rosita"))
                                            .multilineTextAlignment(.center)
                                    }.padding(.bottom, 15)
                                    Text("Monto")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(Color("rosita"))
                                    NavigationLink(
                                        destination: DetalleTableroFederal(monto: tableroCumplimientoFederalViewModel.montoB ?? 0.0, sep_estado: tableroCumplimientoFederalViewModel.sep_estadoB ?? 0.0, fechaEjecucionEstado: tableroCumplimientoFederalViewModel.fechaEjecucionEstadoB ?? "", estado_universidad: tableroCumplimientoFederalViewModel.estado_universidadB ?? 0.0, fechaEjecucionUniversidad: tableroCumplimientoFederalViewModel.fechaEjecucionUniversidadB ?? "", observacion: tableroCumplimientoFederalViewModel.observacionB ?? ""),
                                        label: {
                                            HStack {
                                                Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.montoB ?? 0.0))))")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                                
                                            }.padding(.top,5)
                                        })
                                    Divider().background(Color("gris1")).padding(.top,15)
                                }
                                if tableroCumplimientoFederalViewModel.vertienteC == "C"{
                                    VStack(alignment: .center){
                                        Rectangle().frame(height:0)
                                        Text("Vertiente C:")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(Color("rosita"))
                                            .multilineTextAlignment(.center)
                                    }.padding(.bottom, 15)
                                    Text("Monto")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(Color("rosita"))
                                    NavigationLink(
                                        destination: DetalleTableroFederal(monto: tableroCumplimientoFederalViewModel.montoC ?? 0.0, sep_estado: tableroCumplimientoFederalViewModel.sep_estadoC ?? 0.0, fechaEjecucionEstado: tableroCumplimientoFederalViewModel.fechaEjecucionEstadoC ?? "", estado_universidad: tableroCumplimientoFederalViewModel.estado_universidadC ?? 0.0, fechaEjecucionUniversidad: tableroCumplimientoFederalViewModel.fechaEjecucionUniversidadC ?? "", observacion: tableroCumplimientoFederalViewModel.observacionC ?? ""),
                                        label: {
                                            HStack {
                                                Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.montoC ?? 0.0))))")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                                
                                            }.padding(.top,5)
                                        })
                                    Divider().background(Color("gris1")).padding(.top,15)
                                }
                            }else{
                            Text("Monto")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                            NavigationLink(
                                destination: DetalleTableroFederal(monto: tableroCumplimientoFederalViewModel.monto ?? 0.0, sep_estado: tableroCumplimientoFederalViewModel.sep_estado ?? 0.0, fechaEjecucionEstado: tableroCumplimientoFederalViewModel.fechaEjecucionEstado ?? "", estado_universidad: tableroCumplimientoFederalViewModel.estado_universidad ?? 0.0, fechaEjecucionUniversidad: tableroCumplimientoFederalViewModel.fechaEjecucionUniversidad ?? "", observacion: tableroCumplimientoFederalViewModel.observacion ?? ""),
                                label: {
                                    HStack {
                                        Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.monto ?? 0.0))))")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding(.top,5)
                                })
                            Text("Monto Total Ministrado por la Federación")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                                .padding(.top)
                            
                            Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.montoTotalSEP))))")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.top)
                            
                            Text("Adeudo de la aportación Federal por parte del Estado con corte al: \(tableroCumplimientoFederalViewModel.fechaAdeudo)")
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                                .padding(.top)
                            
                            Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.adeudoFederal))))")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.top)
                        }
                        }.padding([.top,.horizontal])
                    }.onAppear(perform: {
                        tableroCumplimientoFederalViewModel.loadMinistracionFederal(anio: self.anio, id: self.id, tipo: self.tipo)
                    })
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct TableroFederal_Previews: PreviewProvider {
    static var previews: some View {
        TableroFederal(tituloTablero: "", anio: 20020, id: "", tipo: "")
    }
}
