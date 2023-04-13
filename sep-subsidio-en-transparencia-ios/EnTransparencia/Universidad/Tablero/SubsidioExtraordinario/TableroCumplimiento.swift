import SwiftUI

struct TableroCumplimiento: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var subtituloView: String
    @StateObject private var tableroCumplimientoViewModel = TableroCumplimientoViewModel()
    
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
   
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
                                    Text("\(self.titulo)")
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .top, .bottom])
                        .background(Color.white)
                        VStack(alignment: .leading){
                            Trimestres(textosTrimestre: tableroCumplimientoViewModel.textosPrimerTrimestre, fechaLimite: tableroCumplimientoViewModel.fechaLimitePT, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaPT, cumplimiento: tableroCumplimientoViewModel.cumplimientoPT, observaciones: tableroCumplimientoViewModel.observacionPT, subtituloView: "Cumplimiento", trimestre: tableroCumplimientoViewModel.trimestre1, isSelected: tableroCumplimientoViewModel.isSelected1)
                            
                            Trimestres(textosTrimestre: tableroCumplimientoViewModel.textosSegundoTrimestre, fechaLimite: tableroCumplimientoViewModel.fechaLimiteST, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaST, cumplimiento: tableroCumplimientoViewModel.cumplimientoST, observaciones: tableroCumplimientoViewModel.observacionST, subtituloView: "Cumplimiento", trimestre: tableroCumplimientoViewModel.trimestre2, isSelected: tableroCumplimientoViewModel.isSelected2)
                            
                            Trimestres(textosTrimestre: tableroCumplimientoViewModel.textosTercerTrimestre, fechaLimite: tableroCumplimientoViewModel.fechaLimiteTT, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaTT, cumplimiento: tableroCumplimientoViewModel.cumplimientoTT, observaciones: tableroCumplimientoViewModel.observacionTT, subtituloView: "Cumplimiento", trimestre: tableroCumplimientoViewModel.trimestre3, isSelected: tableroCumplimientoViewModel.isSelected3)
                           
                            Trimestres(textosTrimestre: tableroCumplimientoViewModel.textosCuartoTrimestre, fechaLimite: tableroCumplimientoViewModel.fechaLimiteCT, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaCT, cumplimiento: tableroCumplimientoViewModel.cumplimientoCT, observaciones: tableroCumplimientoViewModel.observacionCT, subtituloView: "Cumplimiento", trimestre: tableroCumplimientoViewModel.trimestre4, isSelected: tableroCumplimientoViewModel.isSelected4)
                            
                            LinksTablero(texto: "Entrega del reporte final academico y financiero\u{2074}", fechaLimite: tableroCumplimientoViewModel.fechaLimiteER, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaER, cumplimiento: tableroCumplimientoViewModel.cumplimientoER, observaciones: tableroCumplimientoViewModel.observacionER, subtituloView: "Cumplimiento").padding(.horizontal)
                            
                            LinksTablero(texto: "Comprobación de la totalidad de los recursos asignados\u{2075}", fechaLimite: tableroCumplimientoViewModel.fechaLimiteCR, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaCR, cumplimiento: tableroCumplimientoViewModel.cumplimientoCR, observaciones: tableroCumplimientoViewModel.observacionCR, subtituloView: "Cumplimiento").padding(.horizontal)
                            
                            LinksTablero(texto: "Finiquito de la subcuenta del fideicomiso PROFEXCE\u{2076}", fechaLimite: tableroCumplimientoViewModel.fechaLimiteF, fechaEntrega: tableroCumplimientoViewModel.fechaEntregaF, cumplimiento: tableroCumplimientoViewModel.cumplimientoF, observaciones: tableroCumplimientoViewModel.observacionF, subtituloView: "Cumplimiento").padding(.horizontal)
                            
                            VStack{
                                VStack(alignment: .leading){
                                    Text("Fecha de entrega")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(tableroCumplimientoViewModel.fechaEntregaRG)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }
                                
                                VStack(alignment: .leading){
                                    Text("Aprobación")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(tableroCumplimientoViewModel.aprobacionRG)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }
                                
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(tableroCumplimientoViewModel.observacionRG)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }
                            }.padding(.horizontal)
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }.onAppear{
            tableroCumplimientoViewModel.loadComprmisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
        }
    }
}

struct TableroCumplimiento_Previews: PreviewProvider {
    static var previews: some View {
        TableroCumplimiento(titulo: "", subtituloView: "", anio: 2020, id: "", subsidio: "", tipo: "")
    }
}
