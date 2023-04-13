import SwiftUI

struct ListaAcciones: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var accionDe: String
    @State var anio: Int
    @State var Materiales_Suministros_Acciones : [Action]? = nil
    @State var Servicios_Generales_Acciones : [Action]? = nil
    @State var Asignaciones_Subsidios_otras_Ayudas : [Action]? = nil
    @State var Bienes_muebles_inmuebles : [Action]? = nil
    @State var Obras_remodelaciones : [Action]? = nil
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
                        if self.Materiales_Suministros_Acciones != nil{
                            ForEach(0..<Materiales_Suministros_Acciones!.count, id: \.self){item in
                                NavigationLink(
                                    destination: AccionesEmprenderDetalle(accion: Materiales_Suministros_Acciones![item].accion, fechaEstipulada: Materiales_Suministros_Acciones![item].fechaEstipulada ?? "", fechaEjecucion: Materiales_Suministros_Acciones![item].fechaEjecucion, cumplimiento: Materiales_Suministros_Acciones![item].cumplimiento, observacion: Materiales_Suministros_Acciones![item].observacion, accionDe: self.accionDe, anio: self.anio),
                                    label: {
                                        HStack {
                                            Text("\(Materiales_Suministros_Acciones![item].accion)")
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
                        }
                        if self.Servicios_Generales_Acciones != nil{
                            ForEach(0..<Servicios_Generales_Acciones!.count, id: \.self){item in
                                NavigationLink(
                                    destination: AccionesEmprenderDetalle(accion: Servicios_Generales_Acciones![item].accion, fechaEstipulada: Servicios_Generales_Acciones![item].fechaEstipulada ?? "", fechaEjecucion: Servicios_Generales_Acciones![item].fechaEjecucion, cumplimiento: Servicios_Generales_Acciones![item].cumplimiento, observacion: Servicios_Generales_Acciones![item].observacion, accionDe: self.accionDe, anio: self.anio),
                                    label: {
                                        HStack {
                                            Text("\(Servicios_Generales_Acciones![item].accion)")
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
                        }
                        if self.Asignaciones_Subsidios_otras_Ayudas != nil{
                            ForEach(0..<Asignaciones_Subsidios_otras_Ayudas!.count, id: \.self){item in
                                NavigationLink(
                                    destination: AccionesEmprenderDetalle(accion: Asignaciones_Subsidios_otras_Ayudas![item].accion, fechaEstipulada: Asignaciones_Subsidios_otras_Ayudas![item].fechaEstipulada ?? "", fechaEjecucion: Asignaciones_Subsidios_otras_Ayudas![item].fechaEjecucion, cumplimiento: Asignaciones_Subsidios_otras_Ayudas![item].cumplimiento, observacion: Asignaciones_Subsidios_otras_Ayudas![item].observacion, accionDe: self.accionDe, anio: self.anio),
                                    label: {
                                        HStack {
                                            Text("\(Asignaciones_Subsidios_otras_Ayudas![item].accion)")
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
                        }
                        if self.Bienes_muebles_inmuebles != nil{
                            ForEach(0..<Bienes_muebles_inmuebles!.count, id: \.self){item in
                                NavigationLink(
                                    destination: AccionesEmprenderDetalle(accion: Bienes_muebles_inmuebles![item].accion, fechaEstipulada: Bienes_muebles_inmuebles![item].fechaEstipulada ?? "", fechaEjecucion: Bienes_muebles_inmuebles![item].fechaEjecucion, cumplimiento: Bienes_muebles_inmuebles![item].cumplimiento, observacion: Bienes_muebles_inmuebles![item].observacion, accionDe: self.accionDe, anio: self.anio),
                                    label: {
                                        HStack {
                                            Text("\(Bienes_muebles_inmuebles![item].accion)")
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
                        }
                        if self.Obras_remodelaciones != nil{
                            ForEach(0..<Obras_remodelaciones!.count, id: \.self){item in
                                NavigationLink(
                                    destination: AccionesEmprenderDetalle(accion: Obras_remodelaciones![item].accion, fechaEstipulada: Obras_remodelaciones![item].fechaEstipulada ?? "", fechaEjecucion: Obras_remodelaciones![item].fechaEjecucion, cumplimiento: Obras_remodelaciones![item].cumplimiento, observacion: Obras_remodelaciones![item].observacion, accionDe: self.accionDe, anio: self.anio),
                                    label: {
                                        HStack {
                                            Text("\(Obras_remodelaciones![item].accion)")
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
                        }
                        
                       
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct ListaAcciones_Previews: PreviewProvider {
    static var previews: some View {
        ListaAcciones(titulo: "", accionDe: "", anio: 2019)
    }
}
