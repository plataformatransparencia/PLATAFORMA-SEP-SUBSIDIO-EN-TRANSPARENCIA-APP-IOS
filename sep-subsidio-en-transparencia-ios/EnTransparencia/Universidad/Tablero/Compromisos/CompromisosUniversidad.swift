import SwiftUI

struct CompromisosUniversidad: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
    @StateObject private var compromisosUniversidadViewModel = CompromisosUniversidadViewModel()
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
                                    Text(TITULO_COMPROMISOS_UNI)
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }
                            }
                            Spacer()
                            
                        }.onAppear{
                            print("Año: \(self.anio) Id: \(self.id) tipo: \(self.tipo)   subsidio: \(self.subsidio)")
                            
                            if (self.anio < 2025 )
                            {
                             compromisosUniversidadViewModel.loadComprmisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
                            }
                        }
                        .padding([.horizontal, .top])
                        .background(Color.white)
               
                        if compromisosUniversidadViewModel.compromisos != nil {
                            ForEach(0..<compromisosUniversidadViewModel.compromisos!.count, id: \.self){item in
                                NavigationLink(
                                    destination: DetalleCompromiso(compromiso: compromisosUniversidadViewModel.compromisos![item].compromiso.reemplazo(),
                                        cumplimiento: compromisosUniversidadViewModel.compromisos![item].cumplimiento!,
                                         fecha: compromisosUniversidadViewModel.compromisos![item].fecha!,
                                        observacion: compromisosUniversidadViewModel.compromisos![item].observacion!),
                                    label: {
                                        Text("\(toRoman(numero: item+1))")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 8)
                                        HStack {
                                            Text("\(compromisosUniversidadViewModel.compromisos![item].compromiso.reemplazo())")
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
                            }
                        }
                        
                        if(self.anio >= 2025  )
                        {
                            
                            CompromisoInforme(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
                            CompromisoItso(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
                            CompromisoPef()
                            CompromisoMatricula()
                        }
                        

                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct CompromisosUniversidad_Previews: PreviewProvider {
    static var previews: some View {
        CompromisosUniversidad(anio: 2021, id: "6", subsidio: "", tipo: "")
    }
}
