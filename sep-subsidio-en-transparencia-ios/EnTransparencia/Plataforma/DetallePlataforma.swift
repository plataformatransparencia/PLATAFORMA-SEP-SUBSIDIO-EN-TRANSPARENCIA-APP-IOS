import SwiftUI
import AVKit

struct DetallePlataforma: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var detallePlataformaViewModel = DetallePlataformaViewModel()
    
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
                                Text("\(detallePlataformaViewModel.tituloPlataforma)")
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
                        VStack(alignment: .leading){
                            if detallePlataformaViewModel.videoPlataforma != ""{
                                CustomVideo(player: AVPlayer(url: URL(string: "https://sep.subsidioentransparencia.mx/videos/video.mp4")!), isPlaying: false, showControls: false).padding(.top)
                            }
                            ForEach(detallePlataformaViewModel.descripcionPlataforma, id: \.description){item in
                                Text("\(item)")
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .font(.texto())
                                    .foregroundColor(.black)
                                    .padding(.bottom)
                            }
                            //ley universitaria
                            Text("\(detallePlataformaViewModel.tituloLeyUniversitaria)").bold()
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            HStack{
                                Text("\(detallePlataformaViewModel.tituloArticulo62) ")
                                    .bold()
                                    .font(.texto1())
                                    + Text("\(detallePlataformaViewModel.descripcionArticulo62)")
                            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .font(.texto())
                            .foregroundColor(.black)
                            .padding(.bottom)
                            HStack{
                                Text("\(detallePlataformaViewModel.tituloArticulo67) ")
                                    .bold()
                                    .font(.texto1())
                                    + Text("\(detallePlataformaViewModel.descripcionArticulo67)")
                            }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .font(.texto())
                            .foregroundColor(.black)
                            .padding(.bottom)
                            ForEach(detallePlataformaViewModel.nume, id: \.indice){indice in
                                HStack{
                                    Text("\(indice.indice) ")
                                        .bold()
                                        .font(.texto1())
                                        + Text("\(indice.descripcion)")
                                        .font(.texto())
                                }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .padding([.bottom, .horizontal])
                            }
                            //Complemento
                            ForEach(detallePlataformaViewModel.complemento, id: \.description){item in
                                Text("\(item)")
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .font(.texto())
                                    .foregroundColor(.black)
                                    .padding(.bottom)
                            }
                        }.navigationBarHidden(true)
                    }.padding([.bottom, .horizontal])
                    HStack{
                        VStack(alignment: .leading){
                            //UPE
                            Text("\(detallePlataformaViewModel.upeTitulo)").bold()
                                .multilineTextAlignment(.center)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            Text("\(detallePlataformaViewModel.upeDescripcion)")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto())
                                .foregroundColor(.black)
                                .padding(.bottom)
                            //UPEAS
                            Text("\(detallePlataformaViewModel.upeasTitulo)").bold()
                                .multilineTextAlignment(.center)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            Text("\(detallePlataformaViewModel.upeasDescripcion)")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto())
                                .foregroundColor(.black)
                                .padding(.bottom)
                            //UI
                            Text("\(detallePlataformaViewModel.uiTitulo)").bold()
                                .multilineTextAlignment(.center)
                                .font(.texto1())
                                .foregroundColor(.black)
                                .padding(.bottom, 5)
                            Text("\(detallePlataformaViewModel.uiDescripcion)")
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .font(.texto())
                                .foregroundColor(.black)
                                .padding(.bottom)
                        }
                    }.padding([.bottom, .horizontal])
                    .padding(.bottom, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 120 : 65)
                }.padding(.bottom, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? -20 : -10)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }.onAppear(perform: detallePlataformaViewModel.loadDataPlataforma)
        .navigationBarHidden(true)
    }
}

struct DetallePlataforma_Previews: PreviewProvider {
    static var previews: some View {
        DetallePlataforma()
    }
}
