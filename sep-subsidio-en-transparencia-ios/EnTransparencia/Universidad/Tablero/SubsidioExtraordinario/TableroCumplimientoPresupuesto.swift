//
//  TableroCumplimientoPresupuesto.swift
//  EnTransparencia
//
//  Created by Invitado on 30/01/23.
//

import SwiftUI

struct TableroCumplimientoPresupuesto: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var subtituloView: String
    //@StateObject private var tableroCumplimientoViewModel = TableroCumplimientoViewModel()
    
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
                            NavigationLink(
                                destination: TableroCompromisosListaPresupuesto(titulo: "Informes", subtituloView: "Actividades", anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: TIPO_TABLERO, tablero: "informe"),
                                label: {
                                    HStack {
                                        Text("Informes")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                })
                            NavigationLink(
                                destination: TableroCompromisosListaPresupuesto(titulo: "Seguimiento de la entrega de los estados de cuenta de la cuenta productiva específica", subtituloView: "Actividades", anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: TIPO_TABLERO, tablero: "seguimiento"),
                                label: {
                                    HStack {
                                        Text("Seguimiento de la entrega de los estados de cuenta de la cuenta productiva específica")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                })
                            NavigationLink(
                                destination: TableroCompromisosListaPresupuesto(titulo: "Seguimiento de reintegros a la TESOFE", subtituloView: "Actividades", anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: TIPO_TABLERO, tablero: "tesofe"),
                                label: {
                                    HStack {
                                        Text("Seguimiento de reintegros a la TESOFE")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                })
                            NavigationLink(
                                destination: TableroCompromisosListaPresupuesto(titulo: "Cierre de la cuenta productiva específica", subtituloView: "Actividad", anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: TIPO_TABLERO, tablero: "cierre"),
                                label: {
                                    HStack {
                                        Text("Cierre de la cuenta productiva específica")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                        
                                    }.padding([.top,.trailing,.bottom, .leading])
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                })
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct TableroCumplimientoPresupuesto_Previews: PreviewProvider {
    static var previews: some View {
        TableroCumplimientoPresupuesto(titulo: "", subtituloView: "", anio: 2020, id: "", subsidio: "", tipo: "")
    }
}
