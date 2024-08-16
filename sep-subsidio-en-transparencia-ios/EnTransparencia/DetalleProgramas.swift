import SwiftUI

struct DetalleProgramas: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var detalleProgramasViewModel = DetalleProgramasViewModel()
    
    var body: some View { 
        VStack{
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
                                Text(GRID_MENU_PROGRAMAS)
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color("rosita"))
                                    .font(.titulo())
                                Spacer()
                            }
                        }
                        Spacer()
                    }.padding()
                    HStack{
                        VStack{
                            ForEach(detalleProgramasViewModel.programa, id: \.titulo){item in
                                VStack{
                                    Text("\(item.titulo)")
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                        .padding(.bottom, 5)
                                    
                                    ForEach(item.descripcion, id: \.description){ descr in
                                        Text("\(descr)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto())
                                            .foregroundColor(.black)
                                            .padding(.bottom)
                                    }
                                }
                            }
                        }.padding(.top)
                        .navigationBarHidden(true)
                    }.padding([.bottom, .horizontal])
                    .padding(.bottom, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 120 : 65)
                }.padding(.bottom, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? -20 : -10)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }.onAppear(perform: detalleProgramasViewModel.loadDataProgramas)
        .navigationBarHidden(true)
    }
}

struct DetalleProgramas_Previews: PreviewProvider {
    static var previews: some View {
        DetalleProgramas()
    }
}
