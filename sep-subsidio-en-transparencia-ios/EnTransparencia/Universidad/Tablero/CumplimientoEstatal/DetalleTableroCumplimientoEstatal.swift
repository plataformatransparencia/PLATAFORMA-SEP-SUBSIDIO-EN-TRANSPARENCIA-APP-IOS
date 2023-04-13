import SwiftUI

struct DetalleTableroCumplimientoEstatal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var mes : String
    @State var cumplimiento : String
    @State var fecha : String
    @State var observacion : String
    @State var fechaEjecucionEstado : String?
    @State var observacionEjecucionEstado : String?
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
                        VStack(alignment: .center){
                            HStack{
                                Text("Transferencia Estado a Univesidad")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                    .padding(.bottom)
                            }
                        }
                        if (self.anio == 2020 || self.anio == 2021 || self.anio >= 2022) && (self.tipo == "subsidio_ordinario" || self.tipo == ""){
                            SemaforoTableros(cumplimiento: self.cumplimiento, fecha: self.fecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        }else{
                            SemaforoTablerosEO(cumplimiento: self.cumplimiento, fecha: self.fecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        }
                        
                        if self.observacion != ""{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.observacion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }.padding(.leading)
                        }
                        if self.fechaEjecucionEstado != nil || self.observacionEjecucionEstado != nil{
                            HStack {
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Ejecución Estado")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                            .padding(.bottom)
                                        Spacer()
                                    }.padding(.leading)
                                    HStack{
                                        Text("Fecha de ejecución estado")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                    }.padding(.leading)
                                    HStack{
                                        Text("\(self.fechaEjecucionEstado ?? "")")
                                            .font(.texto())
                                            .foregroundColor(Color(.black))
                                            .padding(.trailing, 80)
                                        Spacer()
                                    }.padding([.top, .bottom, .leading])
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("Observaciones")
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                                .bold()
                                            HStack{
                                                Text("\(self.observacionEjecucionEstado ?? "")")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto())
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }.padding(.bottom, 8)
                                            .padding(.top)
                                        }
                                    }.padding(.leading)
                                }.padding(.leading)
                            }.padding(.top)
                        }
                    }
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct DetalleTableroCumplimientoEstatal_Previews: PreviewProvider {
    static var previews: some View {
        DetalleTableroCumplimientoEstatal(mes: "Enero", cumplimiento: "Cumplió", fecha: "10 y 24 de enero 2020", observacion: "esta es una observacion", fechaEjecucionEstado: "10 de enero", observacionEjecucionEstado: "",  anio: 2020, tipo: "subsidio_ordinario")
    }
}
