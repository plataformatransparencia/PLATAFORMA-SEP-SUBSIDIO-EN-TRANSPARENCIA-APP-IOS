//
//  CompromisoInforme.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 19/02/25.
//

import SwiftUI

struct CompromisoItso: View {
    @StateObject private var CompromisosVM = CompromisosViewModel()
    let anio: Int
    let id: String
    let subsidio: String
    let tipo: String
    
    
    var body: some View {
        NavigationView{
            VStack{
                ListaCompromisosView(CompromisosVM: CompromisosVM)
                
            }
            .navigationTitle("Compromisos ITSO")
            .onAppear{
                CompromisosVM.loadCompromisos(anio: anio, id: id, subsidio: subsidio, tipo: tipo)
            }
        }
        
    }
        
}

struct ListaCompromisosView:View {
    @ObservedObject var CompromisosVM: CompromisosViewModel
    var body: some View {
        List(CompromisosVM.itso){ compromiso in
            VStack(alignment: .leading){
                Text(compromiso.compromiso)
                    .font(.headline)
                Text("Cumlimiento:\(compromiso.cumplimiento)")
                Text("Fecha: \(compromiso.fecha)")
                    .font(.footnote)
                Text("Observación: \(compromiso.observacion)")
                    .font(.footnote)
                    .foregroundColor(.gray)
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
