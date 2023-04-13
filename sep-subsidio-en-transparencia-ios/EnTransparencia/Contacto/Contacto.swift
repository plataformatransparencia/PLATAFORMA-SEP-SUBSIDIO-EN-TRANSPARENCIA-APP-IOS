import SwiftUI

struct Contacto: View {
    @StateObject private var contactoViewModel = ContactoViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        HStack{
                            Text("\(contactoViewModel.encabezado)")
                                .foregroundColor(.black)
                                .font(.titulo())
                        }.padding([.top, .bottom])
                        Text("\(contactoViewModel.departamento)")
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .font(.texto())
                            .padding(.bottom, 10)
                        Text("\(contactoViewModel.direccion)")
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .font(.texto())
                            .padding(.bottom, 10)
                        HStack{
                            Text(contactoViewModel.telefono != "" ? "Teléfono:" : "")
                                .foregroundColor(.black)
                            if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
                                Text("\(contactoViewModel.telefono)")
                                    .foregroundColor(Color("dorado"))
                            } else{
                                Link(contactoViewModel.telefono, destination: URL(string: "tel:(55)36002511")!)
                                    .foregroundColor(Color("dorado"))
                            }
                        }.font(.texto())
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 10)
                        Text("\(contactoViewModel.extensiones)")
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .font(.texto())
                            .padding(.bottom, 10)
                        HStack{
                            Text(contactoViewModel.correo != "" ? "Correo:" : "")
                                .foregroundColor(.black)
                            Link(contactoViewModel.correo, destination: URL(string: "mailto:\(contactoViewModel.correo)")!)
                                .foregroundColor(Color("dorado"))
                        }.font(.texto())
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 10)
                    }
                    .padding([.leading, .horizontal])
                    .onAppear(perform: contactoViewModel.loadContactos)
                }.navigationBarHidden(true)
            }
        }.padding(.top, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 30 : 0)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Contacto_Previews: PreviewProvider {
    static var previews: some View {
        Contacto()
    }
}
