import SwiftUI

struct InformeSemestralMA: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var cumplimiento : String
    @State var observacion : String
    @State var anio: Int
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
                                    Text("Informe Semestral de Matricula Auditada")
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding([.horizontal, .bottom, .top])
                        HStack {
                            VStack(alignment: .center){
                                HStack{
                                    Text("Cumplimiento")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                }.padding(.bottom, 5)
                            }
                        }
                        if (self.anio == 2020 || self.anio == 2021 || self.anio >= 2022) && (self.tipo == "subsidio_ordinario" || self.tipo == ""){
                            SemaforoTableroInformes(cumplimiento: self.cumplimiento)
                        }else{
                            SemaforoTableroInformesEO(cumplimiento: self.cumplimiento)
                        }
                        if self.observacion != ""{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Observaciones")
                                        .foregroundColor(Color("rosita"))
                                        .font(.texto1())
                                        .bold()
                                    HStack{
                                        Text("\(self.observacion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto())
                                            .foregroundColor(Color(.black))
                                            .foregroundColor(.black)
                                        Spacer()
                                    }.padding(.bottom, 8)
                                    .padding(.top)
                                }.padding(.leading)
                            }.padding(.leading)
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct InformeSemestralMA_Previews: PreviewProvider {
    static var previews: some View {
        InformeSemestralMA(cumplimiento: "Cumplió", observacion: "Esta es una observació", anio: 2020,tipo: "subsidio_ordinario")
    }
}
