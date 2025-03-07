import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                TopBar()
                VStack{
                    switch viewRouter.currentPage{
                    case .inicio:
                        Inicio()
                            .position(x: geometry.size.width/2.0, y: geometry.size.height * 0.47777)
                    case .listado:
                        Listado()
                            .position(x: geometry.size.width/2.0, y: geometry.size.height * 0.47777)
                    case .contacto:
                        Contacto()
                            .position(x: geometry.size.width/2.0, y: geometry.size.height * 0.47777)
                    case .menu:
                        Menu()
                            .position(x: geometry.size.width/2.0, y: geometry.size.height * 0.47777)
                    }
                    HStack{
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .inicio, width:  geometry.size.width/5, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? geometry.size.height/30 : geometry.size.height/35, systemIconName: "homekit", tabName: TABNAME_INICIO)
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .listado,width: geometry.size.width/5, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? geometry.size.height/30 : geometry.size.height/35, systemIconName: "list.dash", tabName: TABNAME_LISTADO)
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .contacto,width: geometry.size.width/5, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? geometry.size.height/30 : geometry.size.height/35, systemIconName: "phone", tabName: TABNAME_CONTACTO)
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .menu,width: geometry.size.width/5, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? geometry.size.height/30 : geometry.size.height/35, systemIconName: "line.horizontal.3", tabName: TABNAME_MENU)
                    }.frame(width: geometry.size.width, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? geometry.size.height/11 : geometry.size.height/8.5)
                    .background(Color.white)
                    .border(Color("grisClaro"))
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
            .previewLayout(.device)
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top,22)
            Text(tabName)
                .font(.texto())
                .padding(.top, 6)
            Spacer()
        }
        .padding(.bottom, 5)
        .padding(.horizontal, 4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("verde1") : Color("gris1"))
    }
}

struct TopBand: View {
    @State var width: CGFloat
    @State var height: CGFloat
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        if self.viewModel.isExtraordinario{
            HStack{
                VStack(alignment: .center){
                    Text("\(self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionado  : self.viewModel.subsidioActual) \(self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual )")
                        .foregroundColor(.white)
                        .font(.titulo())
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }.frame(width: width * 1.0, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 72.5 : 60)
            .background(Color("rosita1"))
            .padding(.bottom, -10)
        }
        else{
            HStack{
                VStack(alignment: .center){
                    Text("\(self.viewModel.cambiarParametros ?  self.viewModel.subsidioSeleccionado  : self.viewModel.subsidioActual) \(self.viewModel.cambiarParametros ?  self.viewModel.anioSeleccionado  : self.viewModel.anioActual )")
                        .foregroundColor(.white)
                        .font(.titulo())
                }
            }.frame(width: width * 1.0, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 72.5 : 44.5)
            .background(Color("verde1"))
            .padding(.bottom, -10)
        }
    }
}

struct TopBar: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .fill(Color("verdeGob"))
                    .frame(width: geometry.size.width * 1.0, height: geometry.size.height/7.9)
                    .position(x: geometry.size.width/2.0, y: geometry.size.height * 0.05)
                    .edgesIgnoringSafeArea(.all)
                HStack{
                    VStack{
                        Text(TITULO_APP)
                            .font(.titulo())
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }.padding(.top, 1)
                }
            }
        }
        
    }
}
/*
extension Font{
    
    static func montserrat(size: Int) -> Font {
        return Font.custom("Montserrat", size: CGFloat(size))
    }
    static func titulo() -> Font {
        return Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 30 : 20)
    }
    static func texto() -> Font {
        return Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
    }
    static func texto1() -> Font {
        return Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 28 : 18)
    }
    static func texto2() -> Font {
        return Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
    }
}
*/
extension Font{
    
    static func montserrat(size: Int) -> Font {
        return Font.custom("NotoSans-Regular", size: CGFloat(size))
    }
    static func titulo() -> Font {
        return Font.custom("NotoSans-Regular", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 30 : 20)
    }
    static func texto() -> Font {
        return Font.custom("NotoSans-Regular", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
    }
    static func texto1() -> Font {
        return Font.custom("NotoSans-Regular", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 28 : 18)
    }
    static func texto2() -> Font {
        return Font.custom("NotoSans-Regular", size: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
    }
}
