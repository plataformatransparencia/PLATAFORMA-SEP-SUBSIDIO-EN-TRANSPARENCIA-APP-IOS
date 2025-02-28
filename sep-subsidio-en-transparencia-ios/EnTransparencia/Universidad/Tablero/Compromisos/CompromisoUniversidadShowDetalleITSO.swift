//
//  CompromisoUniversidadShowDetalle.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 21/02/25.
//

import SwiftUI

struct CompromisoUniversidadShowDetalleITSO :View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var CompromisoItsoVM = CompromisosViewModel()
    let anio: Int
    let id: String
    let subsidio: String
    let tipo: String
    
    var body: some View{
        VStack{
            NavigationView{
                ZStack{
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(showsIndicators: false){
                        HStack{
                            VStack{
                                HStack{
                                    Button(
                                        action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        },
                                        label:{
                                            Image(systemName: "chevron.left")
                                                .font(.titulo())
                                                .foregroundColor(Color("gris1"))
                                        })
                                    Spacer()
                                    Text(TITULO_INFORMES_ITSO)
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }.onAppear(){
                                   
                                    CompromisoItsoVM.loadCompromisos(anio: self.anio,
                                                                         id: self.id,
                                                                         subsidio: self.subsidio,
                                                                         tipo: self.tipo)
                                   
                                }
                                .padding([.horizontal,.top])
                                .background(Color.white)
                                //Selección de informes
                                if (CompromisoItsoVM.itso.isEmpty) {
                                    ProgressView("Cargando ... ")
                                }else{
                                    ForEach(0..<CompromisoItsoVM.itso.count,
                                            id:\.self){ item in
                                        NavigationLink(
                                            destination: DetalleCompromiso(
                                                CompromisoItsoVM
                                                    .compromisos[item]
                                                    .compromiso.reemplazo(),
                                                cumplimiento:
                                                    CompromisoItsoVM
                                                    .itso[item]
                                                    .cumplimiento,
                                                fecha:
                                                    CompromisoItsoVM
                                                    .itso[item]
                                                    .fecha,
                                                observacion:
                                                    CompromisoItsoVM
                                                    .itso[item]
                                                    .observacion
                                                
                                            )
                                            
                                        )
                                    }
                                    
                                }
                                
                                
                            }
                        }
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
                
        }
    }
}


