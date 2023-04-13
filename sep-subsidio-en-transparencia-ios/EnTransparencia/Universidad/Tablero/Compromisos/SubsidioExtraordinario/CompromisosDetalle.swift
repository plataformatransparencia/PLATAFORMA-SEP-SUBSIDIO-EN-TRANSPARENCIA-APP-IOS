import SwiftUI

struct CompromisosDetalle: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var compromiso: String
    @State var fechaEntrega: String
    @State var observacion: String
    @State var compromisoDe: String
    @State var fechaEjecucion: String? = ""
    @State var cumplimiento: String? = ""
    @State var fechaEstipulada: String?  = ""
    @State var anio: Int
    @State var incremento: Double? = 0
    @State var entrega: Int? = 1
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
                                    Text("\(self.compromisoDe)")
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
                        if self.incremento != nil{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Incremento")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text(String(self.incremento ?? 0) + " %")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }
                            }.padding()
                        }else{
                            if self.entrega != 0{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(self.anio == 2018 ? "Fecha estipulada en el convenio" : "Fecha de entrega")
                                            .foregroundColor(Color("rosita"))
                                            .font(.texto1())
                                            .bold()
                                        HStack{
                                            Text("\(self.anio == 2018 ? self.fechaEstipulada ?? "": self.fechaEntrega)")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                        }.padding(.bottom, 8)
                                        .padding(.top)
                                    }
                                }.padding()
                            }
                            if self.cumplimiento != "" && self.fechaEjecucion != ""{
                                SemaforoTablerosEO(cumplimiento: self.cumplimiento!, fecha: self.fechaEjecucion!, textoColumna1: "Cumplimiento", textoColumna2: "Fecha de ejecución")
                            }
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
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct CompromisosDetalle_Previews: PreviewProvider {
    static var previews: some View {
        CompromisosDetalle(compromiso: "", fechaEntrega: "", observacion: "", compromisoDe: "", anio: 2018)
    }
}
