//
//  LoadingView.swift
//  EnTransparencia
//
//  Created by Beatriz de la Rosa on 10/12/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color("grisClaro1")
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("gris1")))
                    .scaleEffect(2)
                    .padding(.bottom)
                Text("Cargando")
                    .foregroundColor(Color("gris1"))
                    .font(.texto())
            }
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
