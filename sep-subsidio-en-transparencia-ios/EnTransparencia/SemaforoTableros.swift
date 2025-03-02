import SwiftUI

struct SemaforoTableros: View {
    @State var cumplimiento: String
    @State var fecha: String
    @State var textoColumna1: String
    @State var textoColumna2: String
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .center){
                    HStack{
                        VStack{
                            Text("\(self.textoColumna1)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            switch self.cumplimiento {
                            case "Cumplió":
                                Circle()
                                    .foregroundColor(Color("Verde"))
                                    .background(Color("Verde"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                            case "No cumplió":
                                Circle()
                                    .foregroundColor(Color("Rojo"))
                                    .background(Color("Rojo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                            case "En revisión":
                                Circle()
                                    .foregroundColor(Color("Amarillo"))
                                    .background(Color("Amarillo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                            case "Incompleta":
                                Circle()
                                    .foregroundColor(Color("vinoTablero"))
                                    .background(Color("vinoTablero"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("vinoTablero"),lineWidth: 1))
                            case "Complementada":
                                Circle()
                                    .foregroundColor(Color("verdeTablero"))
                                    .background(Color("verdeTablero"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("verdeTablero"),lineWidth: 1))
                            case "Extemporánea":
                                Circle()
                                    .foregroundColor(Color("rositaTablero"))
                                    .background(Color("rositaTablero"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
                            default:
                                Circle()
                                    .foregroundColor(.white)
                                    .background(Color.white)
                                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            }
                        }
                        Divider()
                            .background(Color("grisClaro"))
                            .frame(height: 95)
                        VStack{
                            Text("\(self.textoColumna2)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            Text("\(self.fecha)")
                                .font(.texto())
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                        }
                    }.padding()
                    .frame(height: 95)
                    .border(Color("grisClaro"))
                }
            }
            VStack(alignment: .center){
                HStack{
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                    Text("Cumplió")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                    Text("No cumplió")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                    Text("En revisión")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                }.padding([.top, .bottom])
                
               /* HStack{
                    Circle()
                        .foregroundColor(Color("vinoTablero"))
                        .background(Color("vinoTablero"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("vinoTablero"),lineWidth: 1))
                    Text("Incompleta")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("verdeTablero"))
                        .background(Color("verdeTablero"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("verdeTablero"),lineWidth: 1))
                    Text("Complementada")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("rositaTablero"))
                        .background(Color("rositaTablero"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
                    Text("Extemporánea")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                }.padding([.top, .bottom])*/
            }
        }
        
    }
}
struct SemaforoTablero: View {
    @State var mes: String
    var cumplimiento: String
    var monto: Double
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(self.mes)").font(.texto1())
                    .foregroundColor(Color(.black))
                    .padding(.bottom, 3)
                Text("$ \(String(formatResultForRegion(basedOn: String(self.monto))))")
                    .font(.texto1())
                    .foregroundColor(Color("gris1"))
            }.padding(.bottom, 7)
            .padding(.leading, 40)
            Spacer()
            switch self.cumplimiento {
            case "Cumplió":
                Circle()
                    .foregroundColor(Color("Verde"))
                    .background(Color("Verde"))
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
            case "No cumplió":
                Circle()
                    .foregroundColor(Color("Rojo"))
                    .background(Color("Rojo"))
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
            case "En revisión":
                Circle()
                    .foregroundColor(Color("Amarillo"))
                    .background(Color("Amarillo"))
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                
            case "Incompleta":
                Circle()
                    .foregroundColor(Color("vinoTablero"))
                    .background(Color("vinoTablero"))
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color("vinoTablero"),lineWidth: 1))
                
            case "Complementada":
                Circle()
                    .foregroundColor(Color("verdeTablero"))
                    .background(Color("verdeTablero"))
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color("verdeTablero"),lineWidth: 1))
            case "Extemporánea":
                Circle()
                    .foregroundColor(Color("rositaTablero"))
                    .background(Color("rositaTablero"))
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
            default:
                Circle()
                    .foregroundColor(.white)
                    .background(Color.white)
                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
            }
            Image(systemName: "chevron.right")
                .font(.texto1())
                .foregroundColor(Color("gris1"))
        }
    }
}
struct SemaforoTableroInformes: View {
    @State var cumplimiento : String
    var body: some View {
        VStack{
            HStack(alignment: .center){
                switch self.cumplimiento {
                case "Cumplió":
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                case "No cumplió":
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                case "En revisión":
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                case "En proceso":
                    Circle()
                        .foregroundColor(Color("dorado"))
                        .background(Color("dorado"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("dorado"),lineWidth: 1))
                case "Incompleta":
                    Circle()
                        .foregroundColor(Color("vinoTablero"))
                        .background(Color("vinoTablero"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("vinoTablero"),lineWidth: 1))
                    
                case "Complementada":
                    Circle()
                        .foregroundColor(Color("verdeTablero"))
                        .background(Color("verdeTablero"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("verdeTablero"),lineWidth: 1))
                case "Extemporánea":
                    Circle()
                        .foregroundColor(Color("rositaTablero"))
                        .background(Color("rositaTablero"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
                default:
                    Circle()
                        .foregroundColor(.white)
                        .background(Color.white)
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white,lineWidth: 1))
                }
            }
            HStack(alignment: .center){
                switch self.cumplimiento {
                case "Cumplió":
                    Text("Cumplió")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "No cumplió":
                    Text("No cumplió")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "En revisión":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "En proceso":
                    Text("En proceso")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "Incompleta":
                    Text("Incompleta")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "Complementada":
                    Text("Complementada")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "Extemporánea":
                    Text("Extemporánea")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                default:
                    Text("")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                }
            }.padding(.bottom)
            
            HStack{
                VStack{
                    HStack{
                        Circle()
                            .foregroundColor(Color("Amarillo"))
                            .background(Color("Amarillo"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                        Text("En revisión")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .padding(.leading, 5)
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("Verde"))
                            .background(Color("Verde"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                        Text("Cumplió")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("Rojo"))
                            .background(Color("Rojo"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                        Text("No cumplió")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                    }.padding([.top, .bottom])
                }
            }.padding(.leading)
            
            HStack{
                VStack{
                    HStack{
                        Circle()
                            .foregroundColor(Color("dorado"))
                            .background(Color("dorado"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("dorado"),lineWidth: 1))
                        Text("En proceso")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("vinoTablero"))
                            .background(Color("vinoTablero"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("vinoTablero"),lineWidth: 1))
                        Text("Incompleta")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .padding(.leading, 5)
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("verdeTablero"))
                            .background(Color("verdeTablero"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("verdeTablero"),lineWidth: 1))
                        Text("Complementada")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                        
                    }.padding([.top, .bottom])
                }
            }.padding(.leading)
            
            HStack{
                VStack{
                    HStack{
                        Circle()
                            .foregroundColor(Color("rositaTablero"))
                            .background(Color("rositaTablero"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
                        Text("Extemporánea")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                    }.padding([.top, .bottom])
                }
            }.padding(.leading)
            
        }
        
    }
}


struct SemaforoTablerosu079: View {
    @State var cumplimiento: String
    @State var fecha: String
    @State var textoColumna1: String
    @State var textoColumna2: String
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .center){
                    HStack{
                        VStack{
                            Text("\(self.textoColumna1)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            switch self.cumplimiento {
                            case "Cumplió":
                                Circle()
                                    .foregroundColor(Color("Verde"))
                                    .background(Color("Verde"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                            case "No cumplió":
                                Circle()
                                    .foregroundColor(Color("Rojo"))
                                    .background(Color("Rojo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                            case "En revisión":
                                Circle()
                                    .foregroundColor(Color("Amarillo"))
                                    .background(Color("Amarillo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                            case "Extemporánea":
                                Circle()
                                    .foregroundColor(Color("rositaTablero"))
                                    .background(Color("rositaTablero"))
                                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
                            default:
                                Circle()
                                    .foregroundColor(.white)
                                    .background(Color.white)
                                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            }
                        }
                        Divider()
                            .background(Color("grisClaro"))
                            .frame(height: 95)
                        VStack{
                            Text("\(self.textoColumna2)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            Text("\(self.fecha)")
                                .font(.texto())
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                        }
                    }.padding()
                    .frame(height: 95)
                    .border(Color("grisClaro"))
                }
            }
            VStack(alignment: .center){
                HStack{
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                    Text("Cumplió")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                    Text("No cumplió")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                    Text("En revisión")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("rositaTablero"))
                        .background(Color("rositaTablero"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("rositaTablero"),lineWidth: 1))
                    Text("Extemporánea")
                        .font(.texto2())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                }.padding([.top, .bottom])
            }
        }
        
    }
}

struct SemaforoTablerosEO: View {
    @State var cumplimiento: String
    @State var fecha: String
    @State var textoColumna1: String
    @State var textoColumna2: String
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .center){
                    HStack{
                        VStack{
                            Text("\(self.textoColumna1)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            switch self.cumplimiento {
                            case "Cumplió":
                                Circle()
                                    .foregroundColor(Color("Verde"))
                                    .background(Color("Verde"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                            case "No cumplió":
                                Circle()
                                    .foregroundColor(Color("Rojo"))
                                    .background(Color("Rojo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                            case "En revisión":
                                Circle()
                                    .foregroundColor(Color("Amarillo"))
                                    .background(Color("Amarillo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                            default:
                                Circle()
                                    .foregroundColor(.white)
                                    .background(Color.white)
                                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            }
                        }
                        Divider()
                            .background(Color("grisClaro"))
                            .frame(height: 95)
                        VStack{
                            Text("\(self.textoColumna2)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            Text("\(self.fecha)")
                                .font(.texto())
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                        }
                    }.padding()
                    .frame(height: 95)
                    .border(Color("grisClaro"))
                }
            }
            VStack(alignment: .center){
                HStack{
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                    Text("Cumplió")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                    Text("No cumplió")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                    Text("En revisión")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                }.padding([.top, .bottom])
            }
        }
        
    }
}


struct SemaforoTableroInformesEO: View {
    @State var cumplimiento : String
    var body: some View {
        VStack{
            HStack(alignment: .center){
                switch self.cumplimiento {
                case "Cumplió":
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                case "No cumplió":
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                case "En revisión":
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                default:
                    Circle()
                        .foregroundColor(.white)
                        .background(Color.white)
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white,lineWidth: 1))
                }
            }
            HStack(alignment: .center){
                switch self.cumplimiento {
                case "Cumplió":
                    Text("Cumplió")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "":
                    Text("No cumplió")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "No cumplió":
                    Text("No cumplió")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "En revisión":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                default:
                    Text("No aplica")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                }
            }.padding(.bottom)
            
            HStack{
                VStack{
                    HStack{
                        Circle()
                            .foregroundColor(Color("Amarillo"))
                            .background(Color("Amarillo"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                        Text("En revisión")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .padding(.leading, 5)
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("Verde"))
                            .background(Color("Verde"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                        Text("Cumplió")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("Rojo"))
                            .background(Color("Rojo"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                        Text("No cumplió")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                    }.padding([.top, .bottom])
                }
            }.padding(.leading)
        }
        
    }
}

struct SemaforoTablerosItsoPef: View {
    @State var cumplimiento: String
    @State var fecha: String
    @State var textoColumna1: String
    @State var textoColumna2: String
    var body: some View {
        VStack{
            HStack {
                VStack(alignment: .center){
                    HStack{
                        VStack{
                            Text("\(self.textoColumna1)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            switch self.cumplimiento {
                            case "Cumple":
                                Circle()
                                    .foregroundColor(Color("Verde"))
                                    .background(Color("Verde"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                            case "No cumple":
                                Circle()
                                    .foregroundColor(Color("Rojo"))
                                    .background(Color("Rojo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                            case "En revisión":
                                Circle()
                                    .foregroundColor(Color("Amarillo"))
                                    .background(Color("Amarillo"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                            case "En Proceso":
                                Circle()
                                    .foregroundColor(Color("dorado"))
                                    .background(Color("dorado"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("dorado"),lineWidth: 1))
                            case "Incompleta":
                                Circle()
                                    .foregroundColor(Color("vino1"))
                                    .background(Color("vino1"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("vino1"),lineWidth: 1))
                            case "Extemporánea":
                                Circle()
                                    .foregroundColor(Color("vino"))
                                    .background(Color("vino"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("vino"),lineWidth: 1))

                            case "Complementada":
                                Circle()
                                    .foregroundColor(Color("verdeGob"))
                                    .background(Color("verdeGob"))
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color("verdeGob"),lineWidth: 1))

                            default:
                                Circle()
                                    .foregroundColor(.white)
                                    .background(Color.white)
                                    .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            }
                        }
                        Divider()
                            .background(Color("grisClaro"))
                            .frame(height: 95)
                        VStack{
                            Text("\(self.textoColumna2)")
                                .foregroundColor(Color("rosita"))
                                .font(.texto1())
                                .bold()
                                .padding(.bottom)
                            Text("\(self.fecha)")
                                .font(.texto())
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                        }
                    }.padding()
                    .frame(height: 95)
                    .border(Color("grisClaro"))
                }
            }
            VStack(alignment: .center){
                HStack{
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                    Text("Cupmle")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                    Text("No cumple")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                    Text("En revisión")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Circle()
                        .foregroundColor(Color("dorado"))
                        .background(Color("dorado"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("dorado"),lineWidth: 1))
                    Text("En Proceso")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Circle()
                        .foregroundColor(Color("vino1"))
                        .background(Color("vino1"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("vino1"),lineWidth: 1))
                    Text("Incompleta")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Circle()
                        .foregroundColor(Color("vino"))
                        .background(Color("vino"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("vino"),lineWidth: 1))
                    Text("Extemporánea")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Circle()
                        .foregroundColor(Color("verdeGob"))
                        .background(Color("verdeGob"))
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("verdeGob"),lineWidth: 1))
                    Text("Complementada")
                        .font(.texto2())
                        .foregroundColor(.black)
                        .padding(.leading, 5)
                        .fixedSize(horizontal: true, vertical: false)
                    
                }.padding([.top, .bottom])
            }
        }
        
    }
}


struct SemaforoTableroInformesItsoPef: View {
    @State var cumplimiento : String
    var body: some View {
        VStack{
            HStack(alignment: .center){
                switch self.cumplimiento {
                case "Cumple":
                    Circle()
                        .foregroundColor(Color("Verde"))
                        .background(Color("Verde"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                case "No cumple":
                    Circle()
                        .foregroundColor(Color("Rojo"))
                        .background(Color("Rojo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                case "En revisión":
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                case "En Proceso":
                    Circle()
                        .foregroundColor(Color("dorado"))
                        .background(Color("dorado"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                case "Incompleta":
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                case "Extemporánea":
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                case "Complementada":
                    Circle()
                        .foregroundColor(Color("Amarillo"))
                        .background(Color("Amarillo"))
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 25 : 15)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                default:
                    Circle()
                        .foregroundColor(.white)
                        .background(Color.white)
                        .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 40 : 20)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white,lineWidth: 1))
                }
            }
            HStack(alignment: .center){
                switch self.cumplimiento {
                case "Cumple":
                    Text("Cumple")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "":
                    Text("No cumple")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "No cumple":
                    Text("No cumplió")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "En revisión":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "En Proceso":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "Incompleta":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "Extemporánea":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                case "Complementada":
                    Text("En revisión")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                default:
                    Text("No aplica")
                        .font(.texto())
                        .foregroundColor(Color(.black))
                        .fixedSize(horizontal: true, vertical: false)
                }
            }.padding(.bottom)
            
            HStack{
                VStack{
                    HStack{
                        Circle()
                            .foregroundColor(Color("Amarillo"))
                            .background(Color("Amarillo"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Amarillo"),lineWidth: 1))
                        Text("En revisión")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .padding(.leading, 5)
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("Verde"))
                            .background(Color("Verde"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Verde"),lineWidth: 1))
                        Text("Cumplió")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                        Circle()
                            .foregroundColor(Color("Rojo"))
                            .background(Color("Rojo"))
                            .frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 22 : 12)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke(Color("Rojo"),lineWidth: 1))
                        Text("No cumplió")
                            .font(.texto2())
                            .foregroundColor(Color(.black))
                            .fixedSize(horizontal: true, vertical: false)
                    }.padding([.top, .bottom])
                }
            }.padding(.leading)
        }
        
    }
}


struct SemaforoTableros_Previews: PreviewProvider {
    static var previews: some View {
        
        SemaforoTableros(cumplimiento: "Cumplió", fecha: "20/01/22" ,textoColumna1: "Cumplimiento", textoColumna2: "Fecha de revisión")
        
        //Este es el que se ve en el colapsable del tablero de ministraciones
        SemaforoTablero(mes: "Enero", cumplimiento: "Extemporánea", monto: 2344004)
        
        //Informes de los colapsables
        SemaforoTableroInformes(cumplimiento: "")
        
    }
}
