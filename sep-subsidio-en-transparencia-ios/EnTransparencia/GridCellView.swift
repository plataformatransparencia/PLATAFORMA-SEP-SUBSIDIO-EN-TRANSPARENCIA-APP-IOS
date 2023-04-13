import SwiftUI

struct GridCellView: View {
    var nombre: String
    var siglas: String
    var logo: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImage(
                    url: URL(string: logo)!,
                    placeholder: {Text("")}
                ).frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 100 : 60, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 100 : 60)
                VStack(alignment: .leading){
                    Text(self.siglas)
                        .font(.titulo())
                        .foregroundColor(.black)
                        .bold()
                    Text(self.nombre).font(.texto())
                        .foregroundColor(Color("gris1"))
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.titulo())
                    .foregroundColor(Color("gris1"))
            }.edgesIgnoringSafeArea(.all)
        }.padding([.top, .horizontal])
        .frame(maxWidth: .infinity, maxHeight: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 120 :70)
    }
}

struct GridCellView_Previews: PreviewProvider {
    static var previews: some View {
        GridCellView(nombre: "adasdaasdasdasdasd", siglas: "SASSS", logo: "https://sep.subsidioentransparencia.mx/images/universidades/escudos/UABC-thumb.jpg")
            .preferredColorScheme(.light)
            .previewLayout(.device)
    }
}
