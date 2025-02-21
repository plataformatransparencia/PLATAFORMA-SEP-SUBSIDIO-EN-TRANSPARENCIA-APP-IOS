//
//  CompromisoInforme.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 19/02/25.
//

import SwiftUI

struct CompromisoInforme: View {
    var body: some View {
        NavigationLink(
            destination: {
                TestListView()
            },
            label: {
                HStack{
                    Text(TITULO_COMPROMISO_GENERALES)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.texto1())
                        .foregroundColor(.black)
                        .padding(.horizontal,8)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.texto1())
                        .foregroundColor(Color("gris1"))
                }.padding([.top,.trailing,.bottom])
                    .frame(maxWidth: .infinity, maxHeight: 150)
            }
        )
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





#Preview {
    CompromisoInforme()
}
