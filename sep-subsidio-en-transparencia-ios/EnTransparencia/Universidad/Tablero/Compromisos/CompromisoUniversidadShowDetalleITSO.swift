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
                        .ignoresSafeArea(edges: .all)
                    ScrollView(showsIndicators:false){
                        HStack{
                            VStack{
                                HStack{
                                    Button {
                                        self.presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Image(systemName: "chevron.left")
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    }
                                    Spacer()
                                    Text(TITULO_INFORMES_ITSO)
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                        if (CompromisoItsoVM.itso.isEmpty){
                            ProgressView("Cargando ...")
                                .onAppear {
                                    CompromisoItsoVM.loadCompromisos(anio:self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
                                }
                        }else{
                            ForEach(CompromisoItsoVM.itso){ compromiso in
                                NavigationLink(
                                    destination: DetalleCompromisoItsoPef(
                                        compromiso: compromiso.compromiso,
                                        cumplimiento: compromiso.cumplimiento,
                                        fecha: compromiso.fecha,
                                        observacion: compromiso.observacion
                                    ),
                                    label:{
                                        HStack{
                                            Text(compromiso.compromiso )
                                                .fixedSize(horizontal: false, vertical: true)
                                                .font(.texto())
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                        }.padding([.top,.trailing,.bottom])
                                            .frame(maxWidth: .infinity,maxHeight: 150)
                                            .onAppear(){
                                                print("Fecha \(compromiso.fecha)")
                                            }
                                    }
                                )
                                
                            }
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
        }
    }
}


