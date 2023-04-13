//
//  CompromisosVertientes.swift
//  EnTransparencia
//
//  Created by Invitado on 27/01/23.
//

import SwiftUI

struct CompromisosVertientes: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var compromisoDe: String
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
    @State var subsidioSeleccionadokey : String
    
    @StateObject private var compromisosUniversidadViewModel = CompromisosUniversidadViewModel()
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
                        }.padding([.horizontal, .top])
                        .background(Color.white)
                        if compromisosUniversidadViewModel.compromisosVA != nil{
                            NavigationLink(
                                destination: Compromisos(titulo: TITULO_COMPROMISOS_UNI, compromisoDe: "Compromiso de la universidad", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_UNI, vertiente: "A"),
                                label: {
                                    HStack {
                                        Text("Compromisos Vertiente A")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.titulo())
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                }).padding(.bottom, 5)
                        }
                        if compromisosUniversidadViewModel.compromisosVB != nil{
                            NavigationLink(
                                destination: Compromisos(titulo: TITULO_COMPROMISOS_UNI, compromisoDe: "Compromiso de la universidad", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_UNI, vertiente: "B"),
                                label: {
                                    HStack {
                                        Text("Compromisos Vertiente B")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.titulo())
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                }).padding(.bottom, 5)
                        }
                        if compromisosUniversidadViewModel.compromisosVC != nil{
                            NavigationLink(
                                destination: Compromisos(titulo: TITULO_COMPROMISOS_UNI, compromisoDe: "Compromiso de la universidad", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_UNI, vertiente: "C"),
                                label: {
                                    HStack {
                                        Text("Compromisos Vertiente C")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.titulo())
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.titulo())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                }).padding(.bottom, 5)
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }.padding(.bottom)
            .onAppear{
                compromisosUniversidadViewModel.loadComprmisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
            }
    }
}

struct CompromisosVertientes_Previews: PreviewProvider {
    static var previews: some View {
        CompromisosVertientes(titulo: "Compromisos del estado", compromisoDe: "Compromiso del estado", anio: 2021 , id: "" ,subsidio: "", tipo: "",subsidioSeleccionadokey: "")
    }
}
