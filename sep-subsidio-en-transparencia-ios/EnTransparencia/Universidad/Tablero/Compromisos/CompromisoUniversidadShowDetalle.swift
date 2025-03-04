//
//  CompromisoUniversidadShowDetalle.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 21/02/25.
//

import SwiftUI

struct CompromisoUniversidadShowDetalle :View {
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
                            compromisosUniversidadViewModel.loadComprmisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
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
                                   
                                        HStack {
                                            let texto = "\(compromisosUniversidadViewModel.compromisos![item].compromiso.reemplazo())"
                                            HTMLText(htmlString: texto, alignment: .leading)
                                            
                                            /*HTML2Text(htmlString: texto){ text in
                                            AnyView( //Se asegura que el retorno sea de tipo concreto
                                                text
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto())
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(.black)
                                                .padding()
                                                )
                                            }*/
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
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
