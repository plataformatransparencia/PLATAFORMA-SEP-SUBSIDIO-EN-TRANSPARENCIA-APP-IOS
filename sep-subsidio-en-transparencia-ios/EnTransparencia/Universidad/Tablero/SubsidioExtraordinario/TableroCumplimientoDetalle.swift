import SwiftUI

struct TableroCumplimientoDetalle: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var texto: String
    @State var fechaLimite: String
    @State var fechaEntrega: String
    @State var cumplimiento: String
    @State var observaciones: String
    @State var subtituloView: String
    @State var tipo : String? = "entrega"
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
                                    Text("\(self.subtituloView)")
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
                                HStack{
                                    Text("\(self.texto)")
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
                                Text("Fecha limite")
                                    .foregroundColor(Color("rosita"))
                                    .font(.texto1())
                                    .bold()
                                HStack{
                                    Text("\(self.fechaLimite)")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top)
                            }
                        }.padding()
                        if self.tipo == "entrega"{
                            SemaforoTablerosu079(cumplimiento: self.cumplimiento, fecha: self.fechaEntrega, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de entrega")
                        }else if self.tipo == "reintegro"{
                            SemaforoTablerosu079(cumplimiento: self.cumplimiento, fecha: self.fechaEntrega, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de reintegro")
                        }else if self.tipo == "cierre"{
                            SemaforoTablerosu079(cumplimiento: self.cumplimiento, fecha: self.fechaEntrega, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de comprobación")
                        }
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

struct TableroCumplimientoDetalle_Previews: PreviewProvider {
    static var previews: some View {
        TableroCumplimientoDetalle(texto: "Este es el texto del tablero de cumplimiento", fechaLimite: "20/01/2021", fechaEntrega: "20/01/2021", cumplimiento: "Cumplió", observaciones: "Esta es una observación", subtituloView: "Titulo de la subView")
    }
}
