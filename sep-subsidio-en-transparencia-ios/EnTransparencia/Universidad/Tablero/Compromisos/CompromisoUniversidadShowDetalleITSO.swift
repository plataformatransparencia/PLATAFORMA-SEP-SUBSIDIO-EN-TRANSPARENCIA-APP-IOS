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
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Informes ITSO")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                if( CompromisoItsoVM.itso.isEmpty ){
                    ProgressView("Cargando ...")
                }else{
                    List(CompromisoItsoVM.itso){ compromiso in
                        CompromisoRow(compromiso: compromiso)
                        
                    }.listStyle(PlainListStyle())
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action:{
                
            }){
                Image(systemName:"chevron.left")
                    .foregroundColor(.black)
            })
            .onAppear(){
                CompromisoItsoVM.loadCompromisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
            }
        }
    }
}


struct CompromisoRow: View {
    let compromiso: CompromisoM
    var body: some View {
        HStack{
            Text(compromiso.compromiso)
                .font(.body)
                .foregroundColor(.black)
                .padding(.vertical,5)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }
}
