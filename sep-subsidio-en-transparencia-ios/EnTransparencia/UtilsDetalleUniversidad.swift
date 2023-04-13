import SwiftUI


struct BotonDocumentos: View {
    @State var documento: String
    @State var titulo: String
    @State var anio: Int
    var body: some View {
        Button(action: {
            UIApplication.shared.open(URL(string: "\(self.documento)")!)
        }, label: {
            HStack{
                Image(systemName: "doc")
                    .foregroundColor(.white)
                    .font(.texto1())
                if titulo == "Plan de austeridad"{
                    Text("\(String(self.titulo))")
                        .font(.texto1())
                        .foregroundColor(.white)
                }else{
                    Text("\(String(self.titulo)) \(String(self.anio))")
                        .font(.texto1())
                        .foregroundColor(.white)
                }
            }.padding(.horizontal)
            .frame(height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 80 : 50)
            .background(Color("vino"))
            .overlay(Rectangle().stroke(Color("vino1"), lineWidth: 1))
        }).padding(.bottom, 10)
    }
}


struct itemNumeralia: View {
    var monto: String = ""
    var texto: String = ""
    var body: some View {
        HStack{
            Text("\(self.monto)")
                .foregroundColor(Color("rosita"))
                .font(.texto())
                .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 160 : 80, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, alignment: .trailing)
            Text("\(self.texto)")
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.black)
                .font(.texto())
                .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 600 : 270, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, alignment: .leading)
        }.padding(.bottom, 20)
    }
}
