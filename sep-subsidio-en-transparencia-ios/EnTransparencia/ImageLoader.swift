import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    deinit {
        cancel()
    }
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] in self?.image = $0 }
    }
    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    var body: some View{
        content
            .onAppear(perform: loader.load)
    }
    private var content: some View{
        Group{
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .background(Circle().foregroundColor(Color.white))
                    .overlay(Circle().stroke(Color("gris1"),lineWidth: 1))
            }else{
                placeholder
            }
        }
    }
}

struct AsyncImageAcciones<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    var body: some View{
        content
            .onAppear(perform: loader.load)
    }
    private var content: some View{
        Group{
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }else{
                placeholder
            }
        }
    }
}

struct Contenido: View {
    let url = URL(string:  "https://sep.subsidioentransparencia.mx/images/universidades/escudos/UABC-thumb.jpg")!
    var body: some View {
        
        AsyncImage(
            url: url,
            placeholder: {Text("Loading...")}
        )
    }
}
struct Contenido_Previews: PreviewProvider {
    static var previews: some View {
        Contenido()
    }
}
