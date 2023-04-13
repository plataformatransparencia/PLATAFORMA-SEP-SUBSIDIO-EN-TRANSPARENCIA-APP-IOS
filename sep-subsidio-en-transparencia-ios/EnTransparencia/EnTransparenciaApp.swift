//
//  EnTransparenciaApp.swift
//  EnTransparencia
//
//  Created by Beatriz de la Rosa on 24/02/21.
//

import SwiftUI

@main
struct EnTransparenciaApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
