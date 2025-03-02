//
//  CompromisoInforme.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 19/02/25.
//

import SwiftUI

struct CompromisoMatricula: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
    var body: some View {
        NavigationLink(
            destination: {
                CompromisoUniversidadShowDetalleITSO(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo,tipoInforme: "matricula")
            },
            label: {
                HStack{
                    Text("Informes Matrícula Auditada")
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






