import SwiftUI

struct AccionesEmprender: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var accionDe: String
    @State var anio: Int
    @State var tipo: String
    @State var id: String
    
    @StateObject private var accionesEmprenderViewModel = AccionesEmprenderViewModel()
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
                        ForEach(0..<accionesEmprenderViewModel.acciones.count, id: \.self){item in
                            NavigationLink(
                                destination: AccionesEmprenderDetalle(accion: accionesEmprenderViewModel.acciones[item].accion, fechaEstipulada: accionesEmprenderViewModel.acciones[item].fechaEstipulada ?? "", fechaEjecucion: accionesEmprenderViewModel.acciones[item].fechaEjecucion, cumplimiento: accionesEmprenderViewModel.acciones[item].cumplimiento, observacion: accionesEmprenderViewModel.acciones[item].observacion, accionDe: self.accionDe, anio: self.anio, imagen: self.accionesEmprenderViewModel.acciones[item].imagen ?? "", subacciones: accionesEmprenderViewModel.acciones[item].subacciones, id: self.id),
                                label: {
                                    HStack {
                                        Text("\(accionesEmprenderViewModel.acciones[item].accion)")
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .font(.texto1())
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.texto1())
                                            .foregroundColor(Color("gris1"))
                                    }.padding([.top,.trailing, .leading])
                                })
                        }
                        VStack{
                            if accionesEmprenderViewModel.Materiales_Suministros_Acciones != nil{
                                NavigationLink(
                                    destination: ListaAcciones(titulo: "Materiales y Suminitros Acciones", accionDe: "Acción de Materiales y Suministros Acciones", anio: self.anio, Materiales_Suministros_Acciones: accionesEmprenderViewModel.Materiales_Suministros_Acciones),
                                    label: {
                                        HStack {
                                            Text("Materiales y Suministros Acciones")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                            if accionesEmprenderViewModel.Servicios_Generales_Acciones != nil{
                                NavigationLink(
                                    destination: ListaAcciones(titulo: "Servicios Generales: Acciones", accionDe: "Acción de Servicios Generales: Acciones", anio: self.anio, Servicios_Generales_Acciones: accionesEmprenderViewModel.Servicios_Generales_Acciones),
                                    label: {
                                        HStack {
                                            Text("Servicios Generales: Acciones")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                            if accionesEmprenderViewModel.Asignaciones_Subsidios_otras_Ayudas != nil {
                                NavigationLink(
                                    destination: ListaAcciones(titulo: "Asignaciones, Subsidios y otras Ayudas", accionDe: "Acción de Asignaciones, Subsidios y otras Ayudas", anio: self.anio, Asignaciones_Subsidios_otras_Ayudas: accionesEmprenderViewModel.Asignaciones_Subsidios_otras_Ayudas),
                                    label: {
                                        HStack {
                                            Text("Asignaciones, Subsidios y otras Ayudas")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                            if accionesEmprenderViewModel.Bienes_muebles_inmuebles != nil{
                                NavigationLink(
                                    destination: ListaAcciones(titulo: "Bienes muebles e inmuebles", accionDe: "Acción de Bienes muebles e inmuebles", anio: self.anio, Bienes_muebles_inmuebles: accionesEmprenderViewModel.Bienes_muebles_inmuebles),
                                    label: {
                                        HStack {
                                            Text("Bienes muebles e inmuebles")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                            if accionesEmprenderViewModel.Obras_remodelaciones != nil{
                                NavigationLink(
                                    destination: ListaAcciones(titulo: "Obras y remodelaciones", accionDe: "Acción de Obras y remodelaciones ", anio: self.anio, Obras_remodelaciones: accionesEmprenderViewModel.Obras_remodelaciones),
                                    label: {
                                        HStack {
                                            Text("Obras y remodelaciones")
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding([.top,.trailing,.bottom])
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                            }
                        }.padding(.leading)
                        if accionesEmprenderViewModel.referencias != nil{
                            VStack{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Referencias")
                                            .foregroundColor(.black)
                                            .font(.titulo())
                                            .bold()
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }.padding(.bottom,8)
                                    .padding(.top, 8)
                                    .padding(.leading)
                                }
                                VStack(alignment: .leading){
                                    ForEach(accionesEmprenderViewModel.referencias!.sorted(by: >).reversed(), id: \.key){key, value in
                                        if value.containsSubString(theSubString: "http", isCaseSensitive: false) {
                                            HStack{
                                                Text("\(key)")
                                                Text("\(searchSubStringTermingCharacters(cadena: value, busqueda: accionesEmprenderViewModel.busqueda))")
                                                Link("Ir a la página", destination: URL(string: accionesEmprenderViewModel.busqueda)!).foregroundColor(Color("rosita"))
                                            }.foregroundColor(.black)
                                            .font(.texto())
                                            .padding(.horizontal)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }else{
                                            HStack{
                                                Text("\(key)")
                                                Text("\(value)")
                                            }.foregroundColor(.black)
                                            .font(.texto())
                                            .padding(.horizontal)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                }
                            }
                        }
                        
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }.onAppear{
            accionesEmprenderViewModel.loadAcciones(anio: self.anio, id: self.id, tipo: self.tipo)
        }
    }
}

struct AccionesEmprender_Previews: PreviewProvider {
    static var previews: some View {
        AccionesEmprender(titulo: "Acciones por emprender por la universidad", accionDe: "Acciones por emprender por el gobierno de estado", anio: 2019, tipo: "", id: "")
    }
}
