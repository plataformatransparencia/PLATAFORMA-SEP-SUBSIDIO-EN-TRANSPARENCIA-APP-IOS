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
            NavigationView{
                VStack{
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
                                
                            }.padding([.horizontal,.top])
                                .background(Color.white)
                            //Selección de informes
                            //Invocando contenido de la lista
                            if (CompromisoItsoVM.itso.isEmpty) {
                                ProgressView("Cargando ... ")
                                    .onAppear(){
                                        CompromisoItsoVM.loadCompromisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
                                    }
                            }else{
                                
                                List(CompromisoItsoVM.itso){ compromiso in
                                
                                    NavigationLink(
                                        destination: DetalleCompromiso(
                                            compromiso: compromiso.compromiso,
                                            cumplimiento: compromiso.cumplimiento,
                                            fecha: compromiso.fecha,
                                            observacion: compromiso.observacion
                                            ),
                                        label: {
                                            HStack{
                                            Text(compromiso.compromiso )
                                            .fixedSize(horizontal: false, vertical: true)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                            
                                            }.padding([.top,.trailing, .bottom])
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                        })
                                
                                //        Text(compromiso.compromiso)
                                //      .listRowSeparator(.hidden)
                                    
                                    
                                }.listStyle(PlainListStyle())
                                    .padding()
                                
                                /* List(CompromisoItsoVM.itso ){ compromisoM in
                                 NavigationLink(
                                 destination: DetalleCompromiso(
                                 compromiso: compromisoM.compromiso,
                                 cumplimiento: compromisoM.cumplimiento,
                                 fecha: compromisoM.fecha,
                                 observacion: compromisoM.observacion
                                 ),
                                 label:{
                                 HStack{
                                 Text(compromisoM.compromiso )
                                 .fixedSize(horizontal: false, vertical: true)
                                 .font(.texto1())
                                 .foregroundColor(.black)
                                 Spacer()
                                 Image(systemName: "chevron.right")
                                 .font(.texto1())
                                 .foregroundColor(Color("gris1"))
                                 
                                 }.padding([.top,.trailing, .bottom])
                                 .frame(maxWidth: .infinity, maxHeight: 150)
                                 })
                                 
                                 }*/
                                
                            }
                            
                            
                        }
                    }
                }
                
            }.navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
            
        
    }
}


