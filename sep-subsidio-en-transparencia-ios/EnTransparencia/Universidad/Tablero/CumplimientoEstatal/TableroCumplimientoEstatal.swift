import SwiftUI

struct TableroCumplimientoEstatal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selectionAgenda: String?
    @State var anio: Int
    @State var id: String
    @State var tipo: String
    
    @StateObject private var tableroCumplimientoEstatalViewModel = TableroCumplimientoEstatalViewModel()
    
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
                                    Text("Tablero de cumplimiento de ministraciones, aportación estatal: Estado - Universidad")
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .bottom, .top])
                        VStack(alignment: .leading){
                            VStack{
                                Section(header: HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                    Text("Trimestre 1")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        tableroCumplimientoEstatalViewModel.isSelected1.toggle()
                                        
                                    }){
                                        Image(systemName: tableroCumplimientoEstatalViewModel.isSelected1 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoEstatalViewModel.isSelected1 {
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Enero", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoEnero ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoEnero ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoEnero ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaEnero, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionEnero, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Enero", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoEnero ?? "", monto: tableroCumplimientoEstatalViewModel.montoEnero ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Febrero", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoFebrero ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoFebrero ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoFebrero ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaFebrero, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionFebrero, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Febrero", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoFebrero ?? "", monto: tableroCumplimientoEstatalViewModel.montoFebrero ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Marzo", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoMarzo ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoMarzo ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoMarzo ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaMarzo, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionMarzo, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Marzo", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoMarzo ?? "", monto: tableroCumplimientoEstatalViewModel.montoMarzo ?? 0.0)
                                        }
                                    }
                                }
                            }.padding()
                            VStack{
                                Section(header: HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                    Text("Trimestre 2")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        tableroCumplimientoEstatalViewModel.isSelected2.toggle()
                                    }){
                                        Image(systemName: tableroCumplimientoEstatalViewModel.isSelected2 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoEstatalViewModel.isSelected2 {
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Abril", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoAbril ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoAbril ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoAbril ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaAbril, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionAbril, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Abril", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoAbril ?? "", monto: tableroCumplimientoEstatalViewModel.montoAbril ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Mayo", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoMayo ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoMayo ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoMayo ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaMayo, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionMayo, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Mayo", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoMayo ?? "", monto: tableroCumplimientoEstatalViewModel.montoMayo ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Junio", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoJunio ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoJunio ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoJunio ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaJunio, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionJunio, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Junio", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoJunio ?? "", monto: tableroCumplimientoEstatalViewModel.montoJunio ?? 0.0)
                                        }
                                    }
                                }
                            }.padding()
                            VStack{
                                Section(header: HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                    Text("Trimestre 3")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        tableroCumplimientoEstatalViewModel.isSelected3.toggle()
                                        
                                    }){
                                        Image(systemName: tableroCumplimientoEstatalViewModel.isSelected3 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoEstatalViewModel.isSelected3 {
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Julio", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoJulio ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoJulio ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoJulio ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaJulio, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionJulio, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Julio", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoJulio ?? "", monto: tableroCumplimientoEstatalViewModel.montoJulio ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Agosto", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoAgosto ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoAgosto ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoAgosto ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaAgosto, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionAgosto, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Agosto", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoAgosto ?? "", monto: tableroCumplimientoEstatalViewModel.montoAgosto ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Septiembre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoSeptiembre ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoSeptiembre ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoSeptiembre ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaSeptiembre, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionSeptiembre, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Septiembre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoSeptiembre ?? "", monto: tableroCumplimientoEstatalViewModel.montoSeptiembre ?? 0.0)
                                        }
                                    }
                                }
                            }.padding()
                            VStack{
                                Section(header: HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                    Text("Trimestre 4")
                                        .foregroundColor(Color(.black))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        tableroCumplimientoEstatalViewModel.isSelected4.toggle()
                                        
                                    }){
                                        Image(systemName: tableroCumplimientoEstatalViewModel.isSelected4 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoEstatalViewModel.isSelected4 {
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Octubre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoOctubre ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoOctubre ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoOctubre ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaOctubre, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionOctubre, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Octubre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoOctubre ?? "", monto: tableroCumplimientoEstatalViewModel.montoOctubre ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Noviembre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoNoviembre ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoNoviembre ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoNoviembre ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaNoviembre, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionNoviembre, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Noviembre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoNoviembre ?? "", monto: tableroCumplimientoEstatalViewModel.montoNoviembre ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoEstatal(mes: "Diciembre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoDiciembre ?? "", fecha: tableroCumplimientoEstatalViewModel.estadoUniversidadFechaCumplimientoDiciembre ?? "", observacion: tableroCumplimientoEstatalViewModel.estadoUniversidadObservacionCumplimientoDiciembre ?? "", fechaEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoFechaDiciembre, observacionEjecucionEstado: tableroCumplimientoEstatalViewModel.ejecucionEstadoObservacionDiciembre, anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Diciembre", cumplimiento: tableroCumplimientoEstatalViewModel.estadoUniversidadCumplimientoDiciembre ?? "", monto: tableroCumplimientoEstatalViewModel.montoDiciembre ?? 0.0)
                                        }
                                    }
                                }
                            }.padding()
                        }
                        VStack{
                            Text("Cumplimiento Monto Calendarizado Estatal")
                                .foregroundColor(Color("gris1"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom, 5)
                            
                            MontosBarChartView(montos: [tableroCumplimientoEstatalViewModel.montoEnero ?? 0.0,tableroCumplimientoEstatalViewModel.montoFebrero ?? 0.0,tableroCumplimientoEstatalViewModel.montoMarzo ?? 0.0,tableroCumplimientoEstatalViewModel.montoAbril ?? 0.0 ,tableroCumplimientoEstatalViewModel.montoMayo ?? 0.0,tableroCumplimientoEstatalViewModel.montoJunio ?? 0.0,tableroCumplimientoEstatalViewModel.montoJulio ?? 0.0,tableroCumplimientoEstatalViewModel.montoAgosto ?? 0.0,tableroCumplimientoEstatalViewModel.montoSeptiembre ?? 0.0,tableroCumplimientoEstatalViewModel.montoOctubre ?? 0.0,tableroCumplimientoEstatalViewModel.montoNoviembre ?? 0.0,tableroCumplimientoEstatalViewModel.montoDiciembre ?? 0.0], montosRecibidos: [tableroCumplimientoEstatalViewModel.montoRecibidoEnero ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoFebrero ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoMarzo ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoAbril ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoMayo ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoJunio ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoJulio ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoAgosto ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoSeptiembre ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoOctubre ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoNoviembre ?? 0.0,tableroCumplimientoEstatalViewModel.montoRecibidoDiciembre ?? 0.0])                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 700 : 350 , height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 700 : 350)
                        }
                        VStack(alignment: .leading){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Monto total calendarizado por el Estado")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 5)
                                    Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoEstatalViewModel.montoTotalEstado))))")
                                        .foregroundColor(Color("gris1"))
                                        .font(.texto1())
                                }
                                Spacer()
                            }.padding([.bottom, .horizontal])
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Monto total calendarizado")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 5)
                                    Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoEstatalViewModel.montoTotal))))")
                                        .foregroundColor(Color("gris1"))
                                        .font(.texto1())
                                }
                                Spacer()
                            }.padding([.bottom, .horizontal])
                            HStack{
                                VStack(alignment: .center){
                                    Rectangle().frame(height:0)
                                    Text("Adeudo total estatal con corte al:")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                    Text(tableroCumplimientoEstatalViewModel.fechaAdeudo)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 5)
                                    Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoEstatalViewModel.adeudoEstatal))))")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color.black)
                                        .font(.texto())
                                }.padding(.bottom, 20).background(Color("dorado"))
                                Spacer()
                            }.padding([.horizontal])
                            
                            VStack(alignment: .leading){
                                switch self.anio{
                                case 2019,2020:
                                    Text("Fuente: Elaborado a partir de la información proporcionada por la Institución como respuesta al oficio 511/\(String(self.anio)).- 0603 de acuerdo al anexo de ejecución; \"LAS PARTES\" se obligan a proporcionarse en cualquier tiempo la información que para la instrumentación y aplicación se requiera.")
                                        .foregroundColor(Color("gris1"))
                                        .font(.texto1())
                                        .padding([.bottom])
                                case 2021,2022:
                                    Text("Fuente: Elaborado a partir de la información proporcionada por la Institución.")
                                        .foregroundColor(Color("gris1"))
                                        .font(.texto1())
                                        .padding([.bottom])
                                default:
                                    Text("No se selecciono año")
                                }
                                Text("*Nota: Los datos son proporcionados por la institución. En caso de requerir mayor información será necesario contactar a la Universidad.")
                                    .foregroundColor(Color("gris1"))
                                    .font(.texto1())
                         
                            }.padding([.horizontal])
                        }.padding(.top)
                    }.onAppear(perform: {
                        tableroCumplimientoEstatalViewModel.loadMinistracionEstatal(anio: self.anio, id: self.id, tipo: self.tipo)
                    })
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct TableroCumplimientoEstatal_Previews: PreviewProvider {
    static var previews: some View {
        TableroCumplimientoEstatal(anio: 2021, id: "3", tipo: "")
    }
}
