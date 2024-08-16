import SwiftUI

struct Menu: View {
    let layout = [GridItem(.adaptive(minimum: 650))]
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        HStack{
                            Text(TITULO_MENU)
                                .foregroundColor(.black)
                                .font(.titulo())
                        }.padding([.top, .bottom])
                        GridMenu(layout: layout)
                    }.padding([.leading, .horizontal])
                }.navigationBarHidden(true)
            }
        }.navigationBarHidden(true)
        .padding(.top, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 30 : 0)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct GridMenu: View {
    let layout: [GridItem]
    
    var body: some View {
        LazyVGrid(columns: layout){
            NavigationLink(
                destination: DetalleProgramas(),
                label: {
                    VStack(alignment: .leading){
                        HStack{
                            Text(GRID_MENU_PROGRAMAS)
                                .font(.titulo())
                                .foregroundColor(Color(.black))
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.titulo())
                                .foregroundColor(Color("gris1"))
                        }.edgesIgnoringSafeArea(.all)
                        .padding(.top, 10)
                    }.frame(maxWidth: .infinity, maxHeight: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 120 : 70)
                }).navigationBarHidden(true)
            NavigationLink(
                destination: DetallePoliticas(),
                label: {
                    VStack(alignment: .leading){
                        HStack{
                            Text(GRID_MENU_POLITICAS)
                                .font(.titulo())
                                .foregroundColor(Color(.black))
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.titulo())
                                .foregroundColor(Color("gris1"))
                        }.edgesIgnoringSafeArea(.all)
                        .padding(.top, 30)
                    }.frame(maxWidth: .infinity, maxHeight: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 120 : 70)
                }).navigationBarHidden(true)
        }
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
