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
    let tipoInforme: String
    
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
                                        Text("Informe no seleccionado")
                                            .foregroundColor(Color("rosita"))
                                            .font(.titulo())
                                            .bold()
                                        
                                    }
                                    
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
                            switch(tipoInforme){
                            case "itso":
                                ForEach(CompromisoItsoVM.itso){ compromiso in
                                    NavigationLink(
                                        destination: DetalleCompromisoItsoPef(
                                            compromiso: compromiso.compromiso,
                                            cumplimiento: compromiso.cumplimiento,
                                            fecha: compromiso.fecha,
                                            observacion: compromiso.observacion,
                                            tipoInforme: "itso"
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
                                            }.padding([.top, .trailing])
                                                .frame(maxWidth: .infinity,maxHeight: 70)
                                                .onAppear(){
                                                    print("Fecha \(compromiso.fecha)")
                                                }
                                        }
                                    )
                                    
                                }

                            case "pef":
                                ForEach(CompromisoItsoVM.pef){ compromiso in
                                    NavigationLink(
                                        destination: DetalleCompromisoItsoPef(
                                            compromiso: compromiso.compromiso,
                                            cumplimiento: compromiso.cumplimiento,
                                            fecha: compromiso.fecha,
                                            observacion: compromiso.observacion,
                                            tipoInforme: "pef"
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
                                                .frame(maxWidth: .infinity,maxHeight: 70)
                                                .onAppear(){
                                                    print("Fecha \(compromiso.fecha)")
                                                }
                                        }
                                    )
                                    
                                }
                                
                                
                            case "matricula":
                                ForEach(CompromisoItsoVM.matricula){ compromiso in
                                    NavigationLink(
                                        destination: DetalleCompromisoItsoPef(
                                            compromiso: compromiso.compromiso,
                                            cumplimiento: compromiso.cumplimiento,
                                            fecha: compromiso.fecha,
                                            observacion: compromiso.observacion,
                                            tipoInforme: "matricula"
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
                                                .frame(maxWidth: .infinity,maxHeight: 70)
                                                .onAppear(){
                                                    print("Fecha \(compromiso.fecha)")
                                                }
                                        }
                                    )
                                    
                                }
                            default:
                                HStack{
                                    Text("Sin informe a mostrar")
                                }
                                
                            }
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
        }
    }
}


