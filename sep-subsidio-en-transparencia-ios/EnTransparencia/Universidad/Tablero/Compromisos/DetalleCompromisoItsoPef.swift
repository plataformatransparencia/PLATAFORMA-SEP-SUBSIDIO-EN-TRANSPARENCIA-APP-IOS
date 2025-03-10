import SwiftUI

struct DetalleCompromisoItsoPef: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var compromiso: String
    @State var cumplimiento: String
    @State var fecha: String
    @State var observacion: String
    let tipoInforme:String
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
                                    switch(tipoInforme){
                                    case "itso":
                                        Text(TITULO_INFORMES_ITSO)
                                            .foregroundColor(Color("rosita"))
                                            .font(.titulo())
                                            .bold()
                                    case "pef":
                                        Text(TITULO_INFORMES_PEF)
                                            .foregroundColor(Color("rosita"))
                                            .font(.titulo())
                                            .bold()
                                    case "matricula":
                                        Text(TITULO_INFORMES_MATRICULA)
                                            .foregroundColor(Color("rosita"))
                                            .font(.titulo())
                                            .bold()
                                        
                                    default:
                                        Text("Reporte no seleccionado")
                                            .foregroundColor(Color("rosita"))
                                            .font(.titulo())
                                            .bold()
                                        
                                    }
                                                                        Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .top])
                        HStack{
                            VStack(alignment: .leading){
                                Text("Informe")
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
                            
                        SemaforoTablerosItsoPef(cumplimiento: self.cumplimiento, fecha: self.fecha, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                        //if self.observacion != ""{
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
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

