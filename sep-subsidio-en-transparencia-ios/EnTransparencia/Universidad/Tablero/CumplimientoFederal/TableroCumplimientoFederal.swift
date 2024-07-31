import SwiftUI

struct TableroCumplimientoFederal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selectionAgenda: String?
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
                                    Text("Tablero de cumplimiento de ministraciones, aportación federal: SEP - Estado - Universidad")
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
                                        tableroCumplimientoFederalViewModel.isSelected1.toggle()
                                    }){
                                        Image(systemName: tableroCumplimientoFederalViewModel.isSelected1 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoFederalViewModel.isSelected1 {
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Enero", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoEnero ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoEnero ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoEnero ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoEnero ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoEnero ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoEnero ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Enero", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoEnero ?? "", monto: tableroCumplimientoFederalViewModel.montoEnero ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Febrero", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoFebrero ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoFebrero ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoFebrero ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoFebrero ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoFebrero ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoFebrero ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Febrero", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoFebrero ?? "", monto: tableroCumplimientoFederalViewModel.montoFebrero ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Marzo", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoMarzo ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoMarzo ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoMarzo ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoMarzo ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoMarzo ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoMarzo ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Marzo", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoMarzo ?? "", monto: tableroCumplimientoFederalViewModel.montoMarzo ?? 0.0)
                                        }
                                        NavigationLink(destination: InformeTrimestralSO(cumplimiento: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre1Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre1Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe Trimestral de Subsidio Ordinario").font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                        NavigationLink(destination: InformeTrimestralRC(cumplimiento: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre1Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre1Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe de Rendición de Cuentas")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
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
                                        tableroCumplimientoFederalViewModel.isSelected2.toggle()
                                    }){
                                        Image(systemName: tableroCumplimientoFederalViewModel.isSelected2 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoFederalViewModel.isSelected2 {
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Abril", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoAbril ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoAbril ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoAbril ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoAbril ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoAbril ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoAbril ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Abril", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoAbril ?? "", monto: tableroCumplimientoFederalViewModel.montoAbril ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Mayo", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoMayo ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoMayo ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoMayo ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoMayo ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoMayo ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoMayo ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Mayo", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoMayo ?? "", monto: tableroCumplimientoFederalViewModel.montoMayo ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Junio", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoJunio ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoJunio ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoJunio ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoJunio ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoJunio ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoJunio ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Junio", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoJunio ?? "", monto: tableroCumplimientoFederalViewModel.montoJunio ?? 0.0)
                                        }
                                        NavigationLink(destination: InformeTrimestralSO(cumplimiento: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre2Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre2Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe Trimestral de Subsidio Ordinario")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                        NavigationLink(destination: InformeTrimestralRC(cumplimiento: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre2Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre2Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe de Rendición de Cuentas")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                        NavigationLink(destination: InformeSemestralMA(cumplimiento: tableroCumplimientoFederalViewModel.matriculaSemestre1Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.matriculaSemestre1Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe Semestral de Matrícula Auditada")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
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
                                        tableroCumplimientoFederalViewModel.isSelected3.toggle()
                                    }){
                                        Image(systemName: tableroCumplimientoFederalViewModel.isSelected3 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoFederalViewModel.isSelected3 {
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Julio", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoJulio ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoJulio ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoJulio ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoJulio ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoJulio ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoJulio ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Julio", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoJulio ?? "", monto: tableroCumplimientoFederalViewModel.montoJulio ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Agosto", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoAgosto ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoAgosto ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoAgosto ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoAgosto ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoAgosto ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoAgosto ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Agosto", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoAgosto ?? "", monto: tableroCumplimientoFederalViewModel.montoAgosto ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Septiembre", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoSeptiembre ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoSeptiembre ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoSeptiembre ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoSeptiembre ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoSeptiembre ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoSeptiembre ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Septiembre", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoSeptiembre ?? "", monto: tableroCumplimientoFederalViewModel.montoSeptiembre ?? 0.0)
                                        }
                                        NavigationLink(destination: InformeTrimestralSO(cumplimiento: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre3Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre3Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe Trimestral de Subsidio Ordinario")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                        NavigationLink(destination: InformeTrimestralRC(cumplimiento: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre3Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre3Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe de Rendición de Cuentas ")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
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
                                        tableroCumplimientoFederalViewModel.isSelected4.toggle()
                                    }){
                                        Image(systemName: tableroCumplimientoFederalViewModel.isSelected4 ? "chevron.up" : "chevron.down" )
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                }.padding(.bottom, 5)) {
                                    if tableroCumplimientoFederalViewModel.isSelected4 {
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Octubre", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoOctubre ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoOctubre ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoOctubre ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoOctubre ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoOctubre ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoOctubre ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Octubre", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoOctubre ?? "", monto: tableroCumplimientoFederalViewModel.montoOctubre ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Noviembre", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoNoviembre ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoNoviembre ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoNoviembre ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoNoviembre ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoNoviembre ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoNoviembre ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Noviembre", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoNoviembre ?? "", monto: tableroCumplimientoFederalViewModel.montoNoviembre ?? 0.0)
                                        }
                                        NavigationLink(destination: DetalleTableroCumplimientoFederal(mes: "Diciembre", sepEstadoCumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoDiciembre ?? "", sepEstadoFecha: tableroCumplimientoFederalViewModel.sepEstadoFechaCumplimientoDiciembre ?? "", sepEstadoObservacion: tableroCumplimientoFederalViewModel.sepEstadoObservacionCumplimientoDiciembre ?? "", estadoUniversidadCumplimiento: tableroCumplimientoFederalViewModel.estadoUniversidadCumplimientoDiciembre ?? "", estadoUniversidadFecha: tableroCumplimientoFederalViewModel.estadoUniversidadFechaCumplimientoDiciembre ?? "", estadoUniversidadObservacion: tableroCumplimientoFederalViewModel.estadoUniversidadObservacionCumplimientoDiciembre ?? "", anio: self.anio, tipo: self.tipo)) {
                                            SemaforoTablero(mes: "Diciembre", cumplimiento: tableroCumplimientoFederalViewModel.sepEstadoCumplimientoDiciembre ?? "", monto: tableroCumplimientoFederalViewModel.montoDiciembre ?? 0.0)
                                        }
                                        NavigationLink(destination: InformeTrimestralSO(cumplimiento: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre4Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.subsidioOrdinarioTrimestre4Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe Trimestral de Subsidio Ordinario")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                        NavigationLink(destination: InformeTrimestralRC(cumplimiento: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre4Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.rendicionCuentasTrimestre4Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe de Rendición de Cuentas")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                        NavigationLink(destination: InformeSemestralMA(cumplimiento: tableroCumplimientoFederalViewModel.matriculaSemestre2Cumplimiento ?? "", observacion: tableroCumplimientoFederalViewModel.matriculaSemestre2Observacion ?? "", anio: self.anio, tipo: self.tipo)) {
                                            HStack{
                                                Text("Informe Semestral de Matrícula Auditada")
                                                    .font(.texto1())
                                                    .foregroundColor(Color(.black))
                                                    .padding(.bottom, 3)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                            }.padding(.bottom, 7)
                                            .padding(.leading, 40)
                                            .padding(.top)
                                        }
                                    }
                                }
                            }.padding()
                        }
                        VStack{
                            Text("Cumplimiento Monto Calendarizado Federal")
                                .foregroundColor(Color("gris1"))
                                .font(.titulo())
                                .bold()
                                .padding(.bottom, 5)
                                .multilineTextAlignment(.center)
                            MontosBarChartView(montos: [tableroCumplimientoFederalViewModel.montoEnero ?? 0.0 ,tableroCumplimientoFederalViewModel.montoFebrero ?? 0.0,tableroCumplimientoFederalViewModel.montoMarzo ?? 0.0,tableroCumplimientoFederalViewModel.montoAbril ?? 0.0,tableroCumplimientoFederalViewModel.montoMayo ?? 0.0,tableroCumplimientoFederalViewModel.montoJunio ?? 0.0,tableroCumplimientoFederalViewModel.montoJulio ?? 0.0,tableroCumplimientoFederalViewModel.montoAgosto ?? 0.0,tableroCumplimientoFederalViewModel.montoSeptiembre ?? 0.0,tableroCumplimientoFederalViewModel.montoOctubre ?? 0.0,tableroCumplimientoFederalViewModel.montoNoviembre ?? 0.0,tableroCumplimientoFederalViewModel.montoDiciembre ?? 0.0], montosRecibidos: [tableroCumplimientoFederalViewModel.montoRecibidoEnero ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoFebrero ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoMarzo ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoAbril ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoMayo ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoJunio ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoJulio ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoAgosto ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoSeptiembre ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoOctubre ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoNoviembre ?? 0.0,tableroCumplimientoFederalViewModel.montoRecibidoDiciembre ?? 0.0])
                                .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 700 : 350 , height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 700 : 350)
                        }
                        VStack(alignment: .leading){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Monto total calendarizado por la SEP")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 5)
                                    Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.montoTotalSEP))))")
                                        .foregroundColor(Color("gris1"))
                                        .font(.texto1())
                                }
                                Spacer()
                            }.padding([.bottom, .horizontal])
                            HStack{
                                VStack(alignment: .center){
                                    Rectangle().frame(height:0)
                                    Text("Adeudo de la aportación Federal por parte del Estado con corte al:")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                    Text(tableroCumplimientoFederalViewModel.fechaAdeudo)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 5)
                                    Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoFederalViewModel.adeudoFederal))))")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color.black)
                                        .font(.texto1())
                                }.padding(.bottom, 20).background(Color("dorado"))
                                Spacer()
                            }.padding([.horizontal])
                            VStack(alignment: .leading){
                                Text("Fuente: Elaborado con información de la Dirección de Subsidios a Universidades adscrita a la DGESUI y a través de solicitudes de información a la universidad de acuerdo al anexo de ejecución.")
                                    .foregroundColor(Color("gris1"))
                                    .font(.texto1())
                            }.padding([.horizontal])
                        }.padding(.top)
                    }.onAppear(perform: {
                        tableroCumplimientoFederalViewModel.loadMinistracionFederal(anio: self.anio, id: self.id, tipo: self.tipo)
                    }).edgesIgnoringSafeArea(.all)
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TableroCumplimientoFederal_Previews: PreviewProvider {
    static var previews: some View {
        TableroCumplimientoFederal(anio: 2020, id: "3", tipo: "")
    }
}
