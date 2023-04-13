import SwiftUI

struct DropDownCategorias: View {
    var clasificacion = Dictionary<String,Dictionary<String,String>>()
    var subsidioSeleccionadokey : String
    var categoria_estado = Dictionary<String,Dictionary<String,Dictionary<String,Dictionary<String,String>>>>()
    @State var selectClasificacion = false
    @State var expandClasificacion = false
    @State var mostrarTodosEstados = true
    @State var expand = false
    @State var selectedClasificacion: String = "Selecciona"
    @State var selected: String = "Selecciona"
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        VStack{
            HStack{
                Text(TITULO_DROPDOWN_CATEGORIAS)
                    .font(.titulo())
                    .foregroundColor(.black)
                Spacer()
                HStack{
                    Button(action: {
                        self.expand.toggle()
                    }, label: {
                        Text("\(self.selected)")
                            .font(.titulo())
                            .foregroundColor(.black)
                        Image(systemName: expand ? "chevron.up" :  "chevron.down")
                            .resizable()
                            .frame(width: 20, height: 10)
                            .foregroundColor(.black)
                    })
                }.background(Color.white)
            }
            ScrollView(showsIndicators: false){
                VStack(alignment: .center, spacing: 18, content: {
                    if expand {
                        if  let categoria = clasificacion[self.subsidioSeleccionadokey]{
                            ForEach(categoria.sorted(by: <), id: \.key){ key,item in
                                Button(action: {
                                    self.expand.toggle()
                                    self.selected = "\(item)"
                                    self.selectClasificacion = true
                                    self.mostrarTodosEstados = false
                                    self.selectedClasificacion = "Selecciona"
                                    if self.viewModel.categoriaSelecionado == self.viewModel.categoriaSelecionado {
                                        self.viewModel.categoriaSelecionado = "\(item)"
                                        self.viewModel.categoriaSelecionadokey = "\(key)"
                                        self.viewModel.isCategoriaSelected = true
                                    }
                                }){
                                    VStack{
                                        Text(String(item))
                                            .font(.titulo())
                                            .padding(.top, -13)
                                            .multilineTextAlignment(.center)
                                        Divider()
                                    }
                                }.foregroundColor(.black)
                            }
                        }
                    }
                })
                .padding()
                .background(expand ? Color.white : Color.white)
                .animation(.spring())
            }.frame(width: .infinity, height: 150, alignment: .center)
            .animation(.default)
            HStack{
                Text(TITULO_DROPDOWN_ESTADOS)
                    .font(.titulo())
                    .foregroundColor(.black)
                    .padding(.trailing)
                Spacer()
                HStack{
                    Button(action: {
                        self.expandClasificacion.toggle()
                    }, label: {
                        Text("\(self.selectedClasificacion)")
                            .font(.titulo())
                            .foregroundColor(.black)
                        Image(systemName: expandClasificacion ? "chevron.up" :  "chevron.down")
                            .resizable()
                            .frame(width: 20, height: 10)
                            .foregroundColor(.black)
                    })
                }.background(Color.white)
            }
            ScrollView(showsIndicators: false){
                VStack(alignment: .center, spacing: 18, content: {
                    if expandClasificacion && selectClasificacion {
                        if let subsidio = categoria_estado[self.viewModel.subsidioSeleccionadokey]{
                            if let anio = subsidio[self.viewModel.anioSeleccionado]{
                                if let estados = anio[self.viewModel.categoriaSelecionado]{
                                    ForEach(estados.sorted(by: <), id: \.key){ key,item in
                                        Button(action: {
                                            self.expandClasificacion.toggle()
                                            self.selectedClasificacion = "\(item)"
                                            self.viewModel.estadoSeleccionado = "\(key)"
                                        }){
                                            VStack{
                                                Text(String(item))
                                                    .font(.titulo())
                                                    .padding(.top, -10)
                                                Divider()
                                            }
                                        }.foregroundColor(.black)
                                    }
                                    
                                }
                            }
                        }
                    }
                })
                .padding()
                .background(expandClasificacion ? Color.white : Color.white)
                .animation(.spring())
            }.frame(width: .infinity, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .animation(.default)
        }
    }
}

struct DropDownCategorias_Previews: PreviewProvider {
    static var previews: some View {
        DropDownCategorias(subsidioSeleccionadokey: "subsidi_ordinario")
    }
}
