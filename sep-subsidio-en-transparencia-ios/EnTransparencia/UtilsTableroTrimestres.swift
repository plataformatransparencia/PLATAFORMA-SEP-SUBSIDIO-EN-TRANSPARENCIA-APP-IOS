import SwiftUI

struct Trimestres: View {
    var textosTrimestre : [String]
    var fechaLimite : [String]
    var fechaEntrega : [String]
    var cumplimiento : [String]
    var observaciones : [String]
    var subtituloView : String
    
    var trimestre: String
    @State var isSelected: Bool
    var body: some View{
        VStack{
            Section(header: HStack {
                Image(systemName: "calendar")
                    .foregroundColor(Color(.black))
                    .font(.titulo())
                Text("\(self.trimestre)")
                    .foregroundColor(Color(.black))
                    .font(.titulo())
                    .bold()
                Spacer()
                Button(action: {
                    self.isSelected.toggle()
                }){
                    Image(systemName: self.isSelected ? "chevron.up" : "chevron.down" )
                        .font(.titulo())
                        .foregroundColor(Color("gris1"))
                }
            }.padding(.bottom, 5)){
                if isSelected {
                    ForEach(0..<3, id: \.self){item in
                        NavigationLink(destination: TableroCumplimientoDetalle(texto: "\(textosTrimestre[item])", fechaLimite: "\(self.fechaLimite[item])", fechaEntrega: "\(self.fechaEntrega[item])", cumplimiento: "\(self.cumplimiento[item])", observaciones: "\(self.observaciones[item])", subtituloView: self.subtituloView)){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(textosTrimestre[item])")
                                        .font(.texto1())
                                        .foregroundColor(Color(.black))
                                        .padding(.bottom, 3)
                                }.padding(.leading)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.titulo())
                                    .foregroundColor(Color("gris1"))
                            }.padding(.bottom,5)
                        }
                    }
                }
            }
        }.padding(.bottom, 5)
        .padding(.horizontal)
    }
}

struct LinksTablero: View {
    var texto : String
    var fechaLimite : String
    var fechaEntrega : String
    var cumplimiento : String
    var observaciones : String
    var subtituloView : String
    var body: some View{
        NavigationLink(destination: TableroCumplimientoDetalle(texto: self.texto, fechaLimite: self.fechaLimite, fechaEntrega: self.fechaEntrega, cumplimiento: self.cumplimiento, observaciones: self.observaciones, subtituloView: self.subtituloView)){
            HStack{
                VStack(alignment: .leading){
                    Text("\(self.texto)")
                        .font(.texto1())
                        .foregroundColor(Color(.black))
                        .padding(.bottom, 3)
                }.padding(.bottom, 7)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.titulo())
                    .foregroundColor(Color("gris1"))
            }.padding(.bottom,5)
        }
    }
    
}
