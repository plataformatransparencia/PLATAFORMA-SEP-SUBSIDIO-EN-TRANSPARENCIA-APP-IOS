import SwiftUI

struct DropDownAnios: View {
    var subsidios = Dictionary<String,Dictionary<String,String>>()
    @State var expand = false
    @State var selected: String = "Selecciona"
    @EnvironmentObject var viewModel : ViewModel
    var body: some View {
        VStack{
            HStack{
                Text(TITULO_DROPDOWN_ANIOS)
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
                        ForEach(subsidios.sorted(by: {$0.0 > $1.0}), id: \.key){ key, value in
                            Button(action: {
                                self.expand.toggle()
                                self.selected = key
                                self.viewModel.anioSeleccionado = key
                                if !selected.isEmpty{
                                    self.viewModel.isAnioSelected = true
                                }
                            }){
                                VStack{
                                    Text(key)
                                        .font(.titulo())
                                        .padding(.top, -13)
                                    Divider()
                                }
                            }.foregroundColor(.black)
                        }
                    }
                }).padding(.top, 11)
                .background(expand ? Color.white : Color.white)
                .animation(.spring())
            }.frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .animation(.default)
        }
    }
}

struct DropDownAniosPreviews: PreviewProvider {
    static var previews: some View {
        DropDownAnios()
    }
}
