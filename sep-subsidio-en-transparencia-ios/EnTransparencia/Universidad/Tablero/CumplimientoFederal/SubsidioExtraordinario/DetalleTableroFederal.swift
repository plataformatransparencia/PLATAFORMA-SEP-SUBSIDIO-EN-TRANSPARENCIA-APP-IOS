import SwiftUI

struct DetalleTableroFederal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var monto: Double
    @State var sep_estado : Double
    @State var fechaEjecucionEstado : String
    @State var estado_universidad : Double
    @State var fechaEjecucionUniversidad : String
    @State var observacion: String
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
                                    Text("$ \(String(formatResultForRegion(basedOn: String(monto))))")
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
                        VStack{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Transferencia SEP a Estado")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("$ \(String(formatResultForRegion(basedOn: String(sep_estado))))")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.top, 5)
                                }
                            }.padding([.bottom,.top])
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Fecha de ejecución")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.fechaEjecucionEstado)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.top, 5)
                                }
                            }.padding([.bottom,.top])
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Transferencia Estado a Universidad")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("$ \(String(formatResultForRegion(basedOn: String(estado_universidad))))")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.top, 5)
                                }
                            }.padding([.bottom,.top])
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Fecha de ejecución")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.fechaEjecucionUniversidad)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.top, 5)
                                }
                            }.padding([.bottom,.top])
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.observacion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.top, 5)
                                }
                            }.padding([.bottom,.top])
                        }.padding(.horizontal)
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct DetalleTableroFederal_Previews: PreviewProvider {
    static var previews: some View {
        DetalleTableroFederal(monto: 0.0, sep_estado: 0.0, fechaEjecucionEstado: "", estado_universidad: 0.0, fechaEjecucionUniversidad: "", observacion: "")
    }
}
