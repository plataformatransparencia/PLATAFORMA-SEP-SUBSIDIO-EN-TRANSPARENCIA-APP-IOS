//
//  CompromisoInforme.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 19/02/25.
//

import SwiftUI

struct CompromisoItso: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
    @ObservedObject var compromisosVM: CompromisosViewModel
    
    
    var body: some View {
        List(compromisosVM.loadCompromisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo).itso){ compromiso in
            VStack(alignment: .leading){
                Text(compromiso.compromiso)
                    .font(.headline)
                Text("Cumplimiento:  \(compromiso.cumplimiento)")
                    .font(.subheadline)
                if !compromiso.fecha.isEmpty {
                    Text("Fercha: \(compromiso.fecha)")
                        .font(.footnote)
                }
                if !compromiso.observacion.isEmpty{
                    Text("Observación: \(compromiso.observacion)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical,5)
        }
        
    }
        
}





struct TestListView: View {
    let items = ["Elemento 1", "Elemento 2", "Elemento 3", "Elemento 4", "Elemento 5"]
    var body: some View {
        List(items,id: \.self){item in
            Text(item)
            
        }.navigationTitle(Text("Lista de Pruebas"))
    }
    
}
