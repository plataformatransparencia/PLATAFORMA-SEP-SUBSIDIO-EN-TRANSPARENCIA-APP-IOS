import SwiftUI

struct TableroEstatal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var tituloTablero : String
    @State var anio: Int
    @State var id: String
    @State var tipo: String
    
    @StateObject private var tableroCumplimientoEstatalViewModel = TableroCumplimientoEstatalViewModel()
    var body: some View {
        VStack{
            NavigationView{
                ZStack{
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(showsIndicators: false){
                        HStack{
                            VStack{
                                HStack{
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "chevron.left")
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                    })
                                    Spacer()
                                    Text("\(self.tituloTablero)")
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .top])
                        .background(Color.white)
                        VStack(alignment: .leading){
                            Text("Monto")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                            ForEach(tableroCumplimientoEstatalViewModel.ministracion, id: \.monto){item in
                                if item.monto != 0.0 && item.monto != nil{
                                    NavigationLink(
                                        destination: ListaMontos(listaMontos: tableroCumplimientoEstatalViewModel.ministracion),
                                        label: {
                                            HStack {
                                                Text("$ \(String(formatResultForRegion(basedOn: String(item.monto ?? 0.0))))")
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                    .font(.texto1())
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.texto1())
                                                    .foregroundColor(Color("gris1"))
                                                
                                            }.padding(.top,5)
                                        })
                                }
                            }
                            
                            Text("Monto Total Ministrado por el Estado")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                                .padding(.top)
                            
                            Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoEstatalViewModel.montoTotalEstado))))")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.top)
                            
                            Text("Adeudo Total Estatal con Corte al: \(tableroCumplimientoEstatalViewModel.fechaAdeudo)")
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                                .padding(.top)
                            
                            Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoEstatalViewModel.adeudoEstatal))))")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.top)
                            
                            Text("Monto Total Ministrado, Aportación Federal y Estatal")
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(Color("rosita"))
                                .padding(.top)
                            
                            Text("$ \(String(formatResultForRegion(basedOn: String(tableroCumplimientoEstatalViewModel.montoTotal))))")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.top)
                            
                        }.padding([.top,.horizontal])
                    }.onAppear(perform: {
                        tableroCumplimientoEstatalViewModel.loadMinistracionEstatal(anio: self.anio, id: self.id, tipo: self.tipo)
                    })
                    .navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct Tablero_Previews: PreviewProvider {
    static var previews: some View {
        TableroEstatal(tituloTablero: "Tablero de Cumplimiento de Ministraciones, Aportación Federal: SEP - Estado - Universidad", anio: 2020, id: "", tipo: "")
    }
}
