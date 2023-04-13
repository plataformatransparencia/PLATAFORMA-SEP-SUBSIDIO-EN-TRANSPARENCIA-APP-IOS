import SwiftUI

struct DetalleEtapa: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var subaccion: String
    @State var fechaEstipulada: String
    @State var fechaEjecucion: String
    @State var cumplimiento: String
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
                                    Text("Etapa")
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
                                Text("Etapa")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(self.subaccion)")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                                
                            }
                        }.padding()
                        HStack{
                            VStack(alignment: .leading){
                                Text("Fecha estipulada\u{2077}")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(self.fechaEstipulada)")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                            }
                        }.padding()
                        SemaforoTablerosEO(cumplimiento: self.cumplimiento, fecha: self.fechaEjecucion, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
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
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct DetalleEtapa_Previews: PreviewProvider {
    static var previews: some View {
        DetalleEtapa(subaccion: "", fechaEstipulada: "", fechaEjecucion: "", cumplimiento: "", observacion: "")
    }
}
