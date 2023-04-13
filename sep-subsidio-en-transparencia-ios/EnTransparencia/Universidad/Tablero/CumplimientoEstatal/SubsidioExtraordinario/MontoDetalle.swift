import SwiftUI

struct MontoDetalle: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var monto: Double
    @State var fechaEjecucion: String
    @State var observaciones: String
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
                                    Text("Transferencia Estado a Universidad")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("$ \(String(formatResultForRegion(basedOn: String(monto))))")
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
                                        Text("\(self.fechaEjecucion)")
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
                                        Text("\(self.observaciones)")
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

struct MontoDetalle_Previews: PreviewProvider {
    static var previews: some View {
        MontoDetalle(monto: 2132312, fechaEjecucion: "20/01/2020", observaciones: "")
    }
}
