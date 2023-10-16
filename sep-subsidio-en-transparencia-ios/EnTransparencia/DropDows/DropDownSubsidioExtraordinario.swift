import SwiftUI

struct DropDownSubsidioExtraordinario: View {
    var subsidios = Dictionary<String,Dictionary<String,String>>()
    var anio: String
    @State var expand = false
    @State var selected: String = "Selecciona"
    @State var selectedKey: String = ""
    @EnvironmentObject var viewModel : ViewModel
    @State var expandExtraordinarios = false
    @State var expandOrdinario = false
    var body: some View {
        VStack{
            HStack{
                Text(TITULO_DROPDOWN_SUBSIDIOS)
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
                            .multilineTextAlignment(.center)
                        Image(systemName: expand ? "chevron.up" :  "chevron.down")
                            .resizable()
                            .frame(width: 20, height: 10)
                            .foregroundColor(.black)
                    })
                }.background(Color.white)
            }
            VStack(alignment: .center, content: {
                if expand {
                    if self.anio != "2018"{
                        HStack{
                            Text(TITULO_SUBSIDIO_ORDINARIO)
                                .font(.titulo())
                                .foregroundColor(.black)
                            Spacer()
                            HStack{
                                Button(action: {
                                    self.expandOrdinario.toggle()
                                }, label: {
                                    Image(systemName: expandOrdinario ? "chevron.up" :  "chevron.down")
                                        .resizable()
                                        .frame(width: 20, height: 10)
                                        .foregroundColor(.black)
                                })
                            }.background(Color.white)
                        }.padding([.horizontal])
                            VStack(alignment: .center,spacing: 1, content: {
                                if expandOrdinario{
                                    if  let subsidio = subsidios[self.anio]{
                                        ForEach(subsidio.filter{$0.key == "subsidio_ordinario"}, id: \.key){ key,item in
                                            Button(action: {
                                                self.expand.toggle()
                                                self.expandOrdinario.toggle()
                                                self.selected = "\(item)"
                                                self.selectedKey = "\(key)"
                                                self.viewModel.subsidioSeleccionadokey = "\(key)"
                                                self.viewModel.subsidioSeleccionado = "\(item)"
                                                if !selected.isEmpty{
                                                    self.viewModel.isSubsidioSelect = true
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
                            }).padding(.top, 5)
                            .background(expand ? Color.white : Color.white)
                            .animation(.spring())
                            .frame(width: .infinity, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    if self.anio != "2024"{
                        HStack{
                            Text(TITULO_SUBSIDIO_EXTRAORDINARIO)
                                .font(.titulo())
                                .foregroundColor(.black)
                            Spacer()
                            HStack{
                                Button(action: {
                                    self.expandExtraordinarios.toggle()
                                }, label: {
                                    Image(systemName: expandExtraordinarios ? "chevron.up" :  "chevron.down")
                                        .resizable()
                                        .frame(width: 20, height: 10)
                                        .foregroundColor(.black)
                                })
                            }.background(Color.white)
                        }.padding([.horizontal])
                        ScrollView(showsIndicators: false){
                            VStack(alignment: .center, spacing: 16,content: {
                                if expandExtraordinarios{
                                    if  let subsidio = subsidios[self.anio]{
                                        ForEach(subsidio.filter{$0.key == "subsidio_extraordinario" || $0.key == "subsidio_profexce" || $0.key == "subsidio_presupuesto"}.sorted(by: {$0.0 > $1.0}), id: \.key){ key,item in
                                            Button(action: {
                                                self.expand.toggle()
                                                self.expandExtraordinarios.toggle()
                                                self.selected = "\(item)"
                                                self.selectedKey = "\(key)"
                                                self.viewModel.subsidioSeleccionadokey = "\(key)"
                                                self.viewModel.subsidioSeleccionado = "\(item)"
                                                if !selected.isEmpty{
                                                    self.viewModel.isSubsidioSelect = true
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
                            .background(expand ? Color.white : Color.white)
                            .animation(.spring())
                            .frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    
                }
            }).padding(.top, 11)
            .frame(width: .infinity, height: self.expandExtraordinarios ? 230 : 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(expand ? Color.white : Color.white)
            .animation(.spring())
            .animation(.default)
        }
    }
}

extension Dictionary where Value : Equatable {
    func allKeysForValue(val : Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}




struct DropDownSubsidioExtraordinario_Previews: PreviewProvider {
    static var previews: some View {
        DropDownSubsidioExtraordinario(anio: "2021ß")
    }
}
