import SwiftUI

struct DetalleTableroCumplimientoFederal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var mes : String
    //Transferencia SEP a Estado
    @State var sepEstadoCumplimiento : String
    @State var sepEstadoFecha : String
    @State var sepEstadoObservacion : String
    //Transferencia Estado a Universidad
    @State var estadoUniversidadCumplimiento : String
    @State var estadoUniversidadFecha : String
    @State var estadoUniversidadObservacion : String
    @State var anio: Int
    @State var tipo: String
    
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
                                    Text("\(self.mes)")
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
                        HStack {
                            VStack(alignment: .center){
                                HStack{
                                    Text("Transferencia SEP a Estado")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                        .padding(.bottom)
                                }
                            }.padding(.leading)
                        }
                        if (self.anio == 2020 || self.anio == 2021 || self.anio >= 2022) && (self.tipo == "subsidio_ordinario" || self.tipo == ""){
                            SemaforoTableros(cumplimiento: self.sepEstadoCumplimiento, fecha: self.sepEstadoFecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        }else{
                            SemaforoTablerosEO(cumplimiento: self.sepEstadoCumplimiento, fecha: self.sepEstadoFecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        }
                        
                        if self.sepEstadoObservacion != ""{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.sepEstadoObservacion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto())
                                            .foregroundColor(Color(.black))
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }.padding(.leading)
                        }
                        HStack {
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Transferencia Estado a Universidad")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                        .padding(.bottom)
                                }
                            }.padding(.leading)
                        }
                        if (self.anio == 2020 || self.anio == 2021 || self.anio >= 2022) && (self.tipo == "subsidio_ordinario" || self.tipo == ""){
                            SemaforoTableros(cumplimiento: self.estadoUniversidadCumplimiento, fecha: self.estadoUniversidadFecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        }else{
                            SemaforoTablerosEO(cumplimiento: self.estadoUniversidadCumplimiento, fecha: self.estadoUniversidadFecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        }
                        if self.estadoUniversidadObservacion != ""{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.estadoUniversidadObservacion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto())
                                            .foregroundColor(Color(.black))
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }.padding(.leading)
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct DetalleTableroCumplimientoFederal_Previews: PreviewProvider {
    static var previews: some View {
        DetalleTableroCumplimientoFederal(mes: "Enero", sepEstadoCumplimiento: "Cumplio", sepEstadoFecha: "dd/mm/aaa", sepEstadoObservacion: "Observación", estadoUniversidadCumplimiento: "No cumplio", estadoUniversidadFecha: "dd/mm/aaa", estadoUniversidadObservacion: "", anio: 2020, tipo: "subsidio_extraordinario")
    }
}
