import SwiftUI

struct SearchTextFieldView: View {
    @Binding var text: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .trailing){
            Color.white
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 10)
                .frame(height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50)
                .foregroundColor(Color("grisClaro1"))
                .padding()
            TextField(TEXTO_SEARCH_TEXT_FIELD, text: $text)
                .font(.texto())
                .foregroundColor(Color(.black))
                .padding(.leading)
                .offset(x: 12)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50)
                .foregroundColor(Color("gris1"))
                .overlay(Image(systemName: "magnifyingglass")
                            .font(.texto())
                            .foregroundColor(.white))
                .padding(.trailing)
        }.environment(\.colorScheme, .light) 
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchTextFieldView(text: Binding.constant(""))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            SearchTextFieldView(text: Binding.constant(""))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
