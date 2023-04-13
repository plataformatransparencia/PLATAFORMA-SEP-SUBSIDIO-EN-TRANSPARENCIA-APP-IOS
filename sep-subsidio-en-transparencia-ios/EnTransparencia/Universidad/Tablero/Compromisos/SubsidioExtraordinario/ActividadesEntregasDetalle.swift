import SwiftUI

struct ActividadesEntregasDetalle: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var texto : String
    @State var cumplimientosEntregas : [CumplimientosEntregas]?  = nil
    @State var cumplimientosActividades : [CumplimientosActividades]? = nil
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
                        HStack{
                            VStack(alignment: .leading){
                                Text(self.titulo)
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(texto)")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                            }
                        }.padding()
                        if cumplimientosActividades != nil{
                            ForEach(0..<cumplimientosActividades!.count, id: \.self){item in
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Fecha estipulada en el convenio")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                        HStack{
                                            Text("\(cumplimientosActividades![item].fechaEstipulada ?? "")")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                        }.padding(.bottom, 8)
                                        .padding(.top)
                                    }
                                }.padding()
                                SemaforoTablerosEO(cumplimiento: cumplimientosActividades![item].cumplimiento, fecha: cumplimientosActividades![item].fechaEjecucion ?? "", textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Observaciones")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                        
                                        if cumplimientosActividades![item].observacion.containsSubString(theSubString: "https://www", isCaseSensitive: false) || cumplimientosActividades![item].observacion.containsSubString(theSubString: "http://www", isCaseSensitive: false) || cumplimientosActividades![item].observacion.containsSubString(theSubString: "http://", isCaseSensitive: false){
                                            HStack{
                                                Link("Ver", destination: URL(string: "\(cumplimientosActividades![item].observacion)")!)
                                                    .font(.texto1())
                                                Spacer()
                                            }.foregroundColor(Color("rosita"))
                                            .padding(.bottom, 8)
                                            .padding(.top)
                                            
                                            
                                        }else {
                                            HStack{
                                                Text("\(cumplimientosActividades![item].observacion)")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }.padding(.bottom, 8)
                                            .padding(.top)
                                        }
                                    }.padding(.leading)
                                }
                            }
                        }
                        if cumplimientosEntregas != nil{
                            ForEach(0..<cumplimientosEntregas!.count, id: \.self){item in
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Fecha estipulada")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                        HStack{
                                            Text("\(cumplimientosEntregas![item].fechaEstipulada)")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                        }.padding(.bottom, 8)
                                        .padding(.top)
                                    }
                                }.padding()
                                SemaforoTablerosEO(cumplimiento: cumplimientosEntregas![item].cumplimiento, fecha: cumplimientosEntregas![item].fechaEjecucion, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de reunión")
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Observaciones")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                        if cumplimientosEntregas![item].observacion.containsSubString(theSubString: "https://", isCaseSensitive: false) || cumplimientosEntregas![item].observacion.containsSubString(theSubString: "http://", isCaseSensitive: false){
                                            HStack{
                                                Link("Ver", destination: URL(string: "\(cumplimientosEntregas![item].observacion)")!)
                                                    .font(.texto1())
                                                Spacer()
                                            }.foregroundColor(Color("rosita"))
                                            .padding(.bottom, 8)
                                            .padding(.top)
                                            
                                            
                                        }else {
                                            HStack{
                                                Text("\(cumplimientosEntregas![item].observacion)")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }.padding(.bottom, 8)
                                            .padding(.top)
                                        }
                                    }.padding(.leading)
                                }
                            }
                        }
                        
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct ActividadesEntregasDetalle_Previews: PreviewProvider {
    static var previews: some View {
        ActividadesEntregasDetalle(titulo: "", texto: "")
    }
}
