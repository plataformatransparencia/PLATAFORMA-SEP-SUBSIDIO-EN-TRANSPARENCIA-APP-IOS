import SwiftUI

struct DetalleCompromiso: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var compromiso: String
    @State var cumplimiento: String
    @State var fecha: String
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
                                    Text("Compromiso")
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .top])
                        HStack{
                            VStack(alignment: .leading){
                                Text("Compromiso")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(self.compromiso)")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                            }
                        }.padding()
                        SemaforoTablerosOrdinarios(cumplimiento: self.cumplimiento, fecha: self.fecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
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
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }
                        }
                    }
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct DetalleCompromiso_Previews: PreviewProvider {
    static var previews: some View {
        DetalleCompromiso(compromiso: "sksssjsj", cumplimiento: "kskskssk", fecha: "jajajaj", observacion: "jajajaj")
    }
}
