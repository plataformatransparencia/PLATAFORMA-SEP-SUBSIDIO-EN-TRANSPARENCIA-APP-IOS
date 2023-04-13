import SwiftUI

struct ListaEtapas: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var subacciones: [SubActiones]? = nil
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
                        }.padding([.horizontal, .top, .bottom])
                        .background(Color.white)
                        if self.subacciones != nil{
                            ForEach(0..<self.subacciones!.count, id: \.self){item in
                                NavigationLink(
                                    destination: DetalleEtapa(subaccion: self.subacciones![item].subaccion, fechaEstipulada: self.subacciones![item].fechaEstipulada ?? "", fechaEjecucion: self.subacciones![item].fechaEjecucion, cumplimiento: self.subacciones![item].cumplimiento, observacion: self.subacciones![item].observacion),
                                    label: {
                                        HStack {
                                            Text("\(subacciones![item].subaccion)")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                        }.padding([.top,.trailing, .leading])
                                    })
                            }
                        }
                        
                       
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct ListaEtapas_Previews: PreviewProvider {
    static var previews: some View {
        ListaEtapas(titulo: "")
    }
}
