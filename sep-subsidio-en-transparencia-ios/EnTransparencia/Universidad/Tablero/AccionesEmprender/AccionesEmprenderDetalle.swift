import SwiftUI

struct AccionesEmprenderDetalle: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var accion: String
    @State var fechaEstipulada: String
    @State var fechaEjecucion: String
    @State var cumplimiento: String
    @State var observacion: String
    @State var accionDe: String
    @State var anio: Int
    @State var imagen: String = ""
    @State var subacciones: [SubActiones]? = nil
    @State var id: String = ""
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
                                    Text("\(self.accionDe)")
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
                        VStack{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Acción")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.accion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                    
                                }
                            }
                            HStack{
                                VStack(alignment: .center){
                                    if self.imagen != ""{
                                        AsyncImageAcciones(
                                            url: URL(string: "https:/"+self.imagen)!,
                                            placeholder: {Text("").font(.texto())
                                                .foregroundColor(.black)}
                                        ).frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 640 : 320, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 640 : 320)
                                    }
                                }
                            }
                        }.padding()
                        if subacciones != nil{
                            VStack{
                                NavigationLink(
                                    destination: ListaEtapas(titulo: "Etapas", subacciones: self.subacciones),
                                    label: {
                                        HStack {
                                            Text("Etapas")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }.padding(.leading)
                        }
                        
                        if self.id == "14" && self.anio == 2019 {
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Fecha compromiso para la conclusión de la ACCIÓN/ETAPA\u{2075}" )
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
                        }else{
                            if self.anio == 2020 {
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Fecha estipulada")
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
                            }else{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(self.anio == 2019 && self.accionDe != "Acción" ? "Fecha compromiso para la conclusión de la ACCIÓN/ETAPA": self.accionDe == "Acción Emprendida" ? "" : self.anio == 2018 ? "Fecha estipulada\u{2077}" : "Fecha estipulada\u{2075}" )
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
                            }
                        }
                        
                        
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

struct AccionesEmprenderDetalle_Previews: PreviewProvider {
    static var previews: some View {
        AccionesEmprenderDetalle(accion: "", fechaEstipulada: "", fechaEjecucion: "", cumplimiento: "", observacion: "", accionDe: "", anio: 2020, imagen: "")
    }
}
