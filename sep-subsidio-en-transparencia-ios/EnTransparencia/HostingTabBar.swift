//
//  HostingTabBar.swift
//  EnTransparencia
//
//  Created by Beatriz de la Rosa on 24/02/21.
//

import SwiftUI

struct HostingTabBar: View {
    
    private enum Tab:Hashable{
        case inicio
        case listado
        case contacto
        case menu
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HostingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBar()
    }
}
