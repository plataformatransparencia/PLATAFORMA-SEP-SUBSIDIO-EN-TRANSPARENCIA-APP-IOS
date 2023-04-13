import SwiftUI

struct Compromisos: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var compromisoDe: String
    //Universidad
    @State var isCompromisoUniversidad: Bool
    
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
    @State var vertiente: String? = ""
    @StateObject private var compromisosUniversidadViewModel = CompromisosUniversidadViewModel()
    
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
                                    Text("\(self.titulo)")
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
                        if compromisosUniversidadViewModel.compromisos != nil{
                            ForEach(0..<compromisosUniversidadViewModel.compromisos!.count, id: \.self){item in
                                NavigationLink(
                                    destination: CompromisosDetalle(compromiso: compromisosUniversidadViewModel.compromisos![item].compromiso.reemplazo(), fechaEntrega: compromisosUniversidadViewModel.compromisos![item].fechaEntrega ?? "", observacion: compromisosUniversidadViewModel.compromisos![item].observacion ?? "", compromisoDe: self.compromisoDe, fechaEjecucion: compromisosUniversidadViewModel.compromisos![item].fechaEjecucion ?? "", cumplimiento: compromisosUniversidadViewModel.compromisos![item].cumplimiento ?? "", fechaEstipulada: compromisosUniversidadViewModel.compromisos![item].fechaEstipulada ?? "", anio: self.anio, incremento: compromisosUniversidadViewModel.compromisos![item].porcentaje_incremento ?? nil),
                                    label: {
                                        HStack {
                                            Text("\(compromisosUniversidadViewModel.compromisos![item].compromiso.reemplazo())")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom, .leading])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                        }
                        //compromisos subsidio presupuesto
                        if self.subsidio == "subsidio_presupuesto"{
                            if compromisosUniversidadViewModel.compromisosVA != nil && vertiente == "A"{
                                ForEach(0..<compromisosUniversidadViewModel.compromisosVA!.count, id: \.self){item in
                                    NavigationLink(
                                        destination: CompromisosDetalle(compromiso: compromisosUniversidadViewModel.compromisosVA![item].compromiso.reemplazo(), fechaEntrega: compromisosUniversidadViewModel.compromisosVA![item].fechaEntrega ?? "", observacion: compromisosUniversidadViewModel.compromisosVA![item].observacion ?? "", compromisoDe: self.compromisoDe, fechaEjecucion: compromisosUniversidadViewModel.compromisosVA![item].fechaEjecucion ?? "", cumplimiento: compromisosUniversidadViewModel.compromisosVA![item].cumplimiento ?? "", fechaEstipulada: compromisosUniversidadViewModel.compromisosVA![item].fechaEstipulada ?? "", anio: self.anio, incremento: compromisosUniversidadViewModel.compromisosVA![item].porcentaje_incremento ?? nil, entrega: 0),
                                        label: {
                                            HStack {
                                                Text("\(compromisosUniversidadViewModel.compromisosVA![item].compromiso.reemplazo())")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                                
                                            }.padding([.top,.trailing,.bottom, .leading])
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                        })
                                }
                            }
                            if compromisosUniversidadViewModel.compromisosVB != nil && vertiente == "B"{
                                ForEach(0..<compromisosUniversidadViewModel.compromisosVB!.count, id: \.self){item in
                                    NavigationLink(
                                        destination: CompromisosDetalle(compromiso: compromisosUniversidadViewModel.compromisosVB![item].compromiso.reemplazo(), fechaEntrega: compromisosUniversidadViewModel.compromisosVB![item].fechaEntrega ?? "", observacion: compromisosUniversidadViewModel.compromisosVB![item].observacion ?? "", compromisoDe: self.compromisoDe, fechaEjecucion: compromisosUniversidadViewModel.compromisosVB![item].fechaEjecucion ?? "", cumplimiento: compromisosUniversidadViewModel.compromisosVB![item].cumplimiento ?? "", fechaEstipulada: compromisosUniversidadViewModel.compromisosVB![item].fechaEstipulada ?? "", anio: self.anio, incremento: compromisosUniversidadViewModel.compromisosVB![item].porcentaje_incremento ?? nil, entrega: 0),
                                        label: {
                                            HStack {
                                                Text("\(compromisosUniversidadViewModel.compromisosVB![item].compromiso.reemplazo())")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                                
                                            }.padding([.top,.trailing,.bottom, .leading])
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                        })
                                }
                            }
                            if compromisosUniversidadViewModel.compromisosVC != nil && vertiente == "C"{
                                ForEach(0..<compromisosUniversidadViewModel.compromisosVC!.count, id: \.self){item in
                                    NavigationLink(
                                        destination: CompromisosDetalle(compromiso: compromisosUniversidadViewModel.compromisosVC![item].compromiso.reemplazo(), fechaEntrega: compromisosUniversidadViewModel.compromisosVC![item].fechaEntrega ?? "", observacion: compromisosUniversidadViewModel.compromisosVC![item].observacion ?? "", compromisoDe: self.compromisoDe, fechaEjecucion: compromisosUniversidadViewModel.compromisosVC![item].fechaEjecucion ?? "", cumplimiento: compromisosUniversidadViewModel.compromisosVC![item].cumplimiento ?? "", fechaEstipulada: compromisosUniversidadViewModel.compromisosVC![item].fechaEstipulada ?? "", anio: self.anio, incremento: compromisosUniversidadViewModel.compromisosVC![item].porcentaje_incremento ?? nil, entrega: 0),
                                        label: {
                                            HStack {
                                                Text("\(compromisosUniversidadViewModel.compromisosVC![item].compromiso.reemplazo())")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                                
                                            }.padding([.top,.trailing,.bottom, .leading])
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                        })
                                }
                            }
                        }
                        if self.compromisosUniversidadViewModel.actividades != nil{
                            ForEach(0..<compromisosUniversidadViewModel.actividades!.count, id: \.self){item in
                                NavigationLink(
                                    destination: ActividadesEntregasDetalle(titulo: "Compromiso", texto: "\(compromisosUniversidadViewModel.actividades![item].actividad.reemplazo())", cumplimientosActividades: compromisosUniversidadViewModel.actividades![item].cumplimientos),
                                    label: {
                                        HStack {
                                            Text("\(compromisosUniversidadViewModel.actividades![item].actividad.reemplazo())")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                        }.padding([.top,.trailing, .leading])
                                    })
                            }
                        }
                        
                        if self.compromisosUniversidadViewModel.entregas != nil{
                            ForEach(0..<compromisosUniversidadViewModel.entregas!.count, id: \.self){item in
                                NavigationLink(
                                    destination: ActividadesEntregasDetalle(titulo: "Compromiso", texto: "\(compromisosUniversidadViewModel.entregas![item].entrega)", cumplimientosEntregas: compromisosUniversidadViewModel.entregas![item].cumplimientos),
                                    label: {
                                        HStack {
                                            Text("\(compromisosUniversidadViewModel.entregas![item].entrega)")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom, .leading])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                        }
                        if self.isCompromisoUniversidad{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Monto Asignado")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("$" + String(formatResultForRegion(basedOn: String(compromisosUniversidadViewModel.montoAsignado))))
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }
                            HStack{
                                VStack(alignment: .center){
                                    Text("Fecha de ministración")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                }.padding(.leading)
                            }.padding(.bottom)
                            VStack(alignment: .leading){
                                Text("Depósito al estado")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(compromisosUniversidadViewModel.fechaDepEst ?? "")")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                            }.padding(.leading)
                            VStack(alignment: .leading){
                                Text("Depósito a la universidad")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(compromisosUniversidadViewModel.fechaDepUni ?? "")")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                            }.padding(.leading)
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(compromisosUniversidadViewModel.observaciones ?? "")")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }
                        }
                        if compromisosUniversidadViewModel.referencias != nil{
                            VStack{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Referencias")
                                            .foregroundColor(.black)
                                            .font(.titulo())
                                            .bold()
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.bottom,8)
                                    .padding(.top, 8)
                                    .padding(.leading)
                                }
                                VStack(alignment: .leading){
                                    ForEach(compromisosUniversidadViewModel.referencias!.sorted(by: >).reversed(), id: \.key){key, value in
                                        HStack{
                                            Text("\(key)")
                                            Text("\(value)")
                                        }.foregroundColor(.black)
                                        .font(.texto())
                                        .padding(.horizontal)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    }
                                }
                            }
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }.padding(.bottom)
        .onAppear{
            compromisosUniversidadViewModel.loadComprmisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
        }
    }
}

struct Compromisos_Previews: PreviewProvider {
    static var previews: some View {
        Compromisos(titulo: "Compromisos del estado", compromisoDe: "Compromiso del estado", isCompromisoUniversidad: true, anio: 2021 , id: "" ,subsidio: "", tipo: "", vertiente: "")
    }
}
