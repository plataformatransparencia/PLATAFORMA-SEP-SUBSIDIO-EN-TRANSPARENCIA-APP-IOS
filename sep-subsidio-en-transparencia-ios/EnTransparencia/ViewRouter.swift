import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .inicio
}

enum Page{
    case inicio
    case listado
    case contacto
    case menu
}
