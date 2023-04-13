//
//  TableroCompromisosListaPresupuesto.swift
//  EnTransparencia
//
//  Created by Invitado on 30/01/23.
//

import SwiftUI

struct TableroCompromisosListaPresupuesto: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var titulo: String
    @State var subtituloView: String
    @StateObject private var tableroCumplimientoViewModel = TableroCumplimientoViewModel()
    
    @State var anio: Int
    @State var id: String
    @State var subsidio: String
    @State var tipo: String
    @State var tablero: String
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

                        if tableroCumplimientoViewModel.dataPresupuesto?.Informes != nil && self.tablero == "informe"{
                            let datos = tableroCumplimientoViewModel.dataPresupuesto?.Informes
                            let num = Int(datos!.count)
                            VStack(alignment: .leading){
                                ForEach(0..<num, id: \.self){item in
                                    NavigationLink(destination: TableroCumplimientoDetalle(texto: tableroCumplimientoViewModel.dataPresupuesto?.Informes[item].descripcion.reemplazo() ?? "", fechaLimite: tableroCumplimientoViewModel.dataPresupuesto?.Informes[item].fechaLimite ?? "", fechaEntrega: tableroCumplimientoViewModel.dataPresupuesto?.Informes[item].fechaEntrega ?? "", cumplimiento: tableroCumplimientoViewModel.dataPresupuesto?.Informes[item].cumplimiento ?? "", observaciones: tableroCumplimientoViewModel.dataPresupuesto?.Informes[item].observacion ?? "", subtituloView: "Actividad"),
                                    label: {
                                        HStack {
                                            Text(tableroCumplimientoViewModel.dataPresupuesto?.Informes[item].descripcion.reemplazo() ?? "")
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                                }
                            }
                        }
                        if tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega != nil && self.tablero == "seguimiento"{
                            let datos = tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega
                            let num = Int(datos!.count)
                            VStack(alignment: .leading){
                                ForEach(0..<num, id: \.self){item in
                                    NavigationLink(destination: TableroCumplimientoDetalle(texto: tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega[item].mes.reemplazo() ?? "", fechaLimite: tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega[item].fechaLimite ?? "", fechaEntrega: tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega[item].fechaEntrega ?? "", cumplimiento: tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega[item].cumplimiento ?? "", observaciones: tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega[item].observacion ?? "", subtituloView: "Actividad"),
                                    label: {
                                        HStack {
                                            Text(tableroCumplimientoViewModel.dataPresupuesto?.Seguimiento_de_entrega[item].mes.reemplazo() ?? "")
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                                }
                            }
                        }
                        if tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE != nil && self.tablero == "tesofe"{
                            VStack(alignment: .leading){
                                let datos = tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE
                                let num = Int(datos!.count)
                                ForEach(0..<num, id: \.self){item in
                                    NavigationLink(destination: TableroCumplimientoDetalle(texto: tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE[item].descripcion.reemplazo() ?? "", fechaLimite: tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE[item].fechaLimite ?? "", fechaEntrega: tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE[item].fechaReintegro ?? "", cumplimiento: tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE[item].cumplimiento ?? "", observaciones: tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE[item].observacion ?? "", subtituloView: "Actividad", tipo: "reintegro"),
                                    label: {
                                        HStack {
                                            Text(tableroCumplimientoViewModel.dataPresupuesto?.Reintegro_TESOFE[item].descripcion.reemplazo() ?? "")
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.texto1())
                                                .foregroundColor(Color("gris1"))
                                            
                                        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                                            .frame(maxWidth: .infinity, maxHeight: 150)
                                    })
                                }
                                
                            }
                        }
                        if tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva != nil && self.tablero == "cierre"{
                            NavigationLink(destination: TableroCumplimientoDetalle(texto: tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva.accion.reemplazo() ?? "", fechaLimite: tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva.fechaLimite ?? "", fechaEntrega: tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva.fechaComprobacion ?? "", cumplimiento: tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva.cumplimiento ?? "", observaciones: tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva.observacion ?? "", subtituloView: "Actividad", tipo: "cierre"),
                            label: {
                                HStack {
                                    Text(tableroCumplimientoViewModel.dataPresupuesto?.Cierre_productiva.accion.reemplazo() ?? "")
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.texto1())
                                        .foregroundColor(Color("gris1"))
                                    
                                }.padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                            })
                        }
                        
                    }.navigationBarHidden(true)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }.padding(.bottom)
            .onAppear{
                tableroCumplimientoViewModel.loadComprmisos(anio: self.anio, id: self.id, subsidio: self.subsidio, tipo: self.tipo)
            }
        
    }
}
struct TableroCompromisosListaPresupuesto_Previews: PreviewProvider {
    static var previews: some View {
        TableroCompromisosListaPresupuesto(titulo: "", subtituloView: "", anio: 2020, id: "", subsidio: "", tipo: "", tablero: "")
    }
}
