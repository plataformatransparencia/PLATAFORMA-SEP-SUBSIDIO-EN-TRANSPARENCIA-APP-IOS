import SwiftUI

struct ListaMontos: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var listaMontos : [Ministracion]? = nil
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
                                    Text("Montos")
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
                        VStack(alignment: .leading){
                            ForEach(0..<listaMontos!.count, id: \.self){item in
                                NavigationLink(
                                    destination: MontoDetalle(monto: listaMontos![item].estado_universidad, fechaEjecucion: listaMontos![item].fechaEjecucionEstado ?? "", observaciones: listaMontos![item].observacion),
                                    label: {
                                        HStack {
                                            Text("$ \(String(formatResultForRegion(basedOn: String(listaMontos![item].estado_universidad))))")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding(.top)
                                    })
                            }
                        }.padding([.top,.horizontal])
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct ListaMontos_Previews: PreviewProvider {
    static var previews: some View {
        ListaMontos(listaMontos: [Ministracion(monto: 0.0, fechaEjecucionEstado: "", estado_universidad: 0.0, observacion: "")])
    }
}
