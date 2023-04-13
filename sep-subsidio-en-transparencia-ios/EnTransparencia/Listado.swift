import SwiftUI

struct Listado: View {
    @State private var filterBySearch = ""
    let layout = [GridItem(.adaptive(minimum: 650))]
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    TopBand(width: geometry.size.width, height: geometry.size.height)
                    NavigationView{
                        ScrollView(showsIndicators: false){
                            Filter()
                            SearchTextFieldView(text: $filterBySearch)
                            GridView(filterBySearch: $filterBySearch, layout: layout)
                        }.navigationBarHidden(true)
                        .background(Color.white)
                    }.padding(.top, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 0 : 0)
                    .navigationViewStyle(StackNavigationViewStyle())
                }
            }
        }
    }
}

struct Listado_Previews: PreviewProvider {
    static var previews: some View {
        Listado()
    }
}
