import SwiftUI
import Charts

struct UniversidadDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var universidadDetailViewModel = UniversidadDetailViewModel()
    @State var logo: String
    @State var isExtraordinario : Bool
    @State var subsidioSeleccionadokey : String
    @State var anio: Int
    @State var id: String
    @State var bandera: Bool
    
    var body: some View {
        VStack{
            GeometryReader{ geometry in
                Color(self.isExtraordinario ? "rosita" : "verde2")
                Text("\(universidadDetailViewModel.nombre)")
                    .foregroundColor(.white)
                    .font(.texto1())
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            }.frame(height: universidadDetailViewModel.nombre.count > 38 ? UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 70 : 50 : UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 45 : 35)
            NavigationView{
                ZStack{
                    Color.white.edgesIgnoringSafeArea(.all)
                    ScrollView(showsIndicators: false){
                        HStack{
                            VStack{
                                HStack{
                                    if self.bandera{
                                        Button(action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        }, label: {
                                            Image(systemName: "chevron.left")
                                                .font(.titulo())
                                                .foregroundColor(Color("gris1"))
                                        })
                                    }
                                    Spacer()
                                    Text("\(universidadDetailViewModel.siglas)")
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }
                                Text("\(universidadDetailViewModel.nombre)")
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                    .font(.titulo())
                                    .padding(.top, 3)
                                if universidadDetailViewModel.webUrl != "" {
                                    HStack{
                                        Image(systemName: "link").font(.texto1())
                                        Link("Ir a \(universidadDetailViewModel.siglas)", destination: URL(string: "\(universidadDetailViewModel.webUrl)")!)
                                            .font(.texto1())
                                    }.foregroundColor(Color("dorado"))
                                }
                            }
                            Spacer()
                            AsyncImage(
                                url: URL(string: self.logo)!,
                                placeholder: {Text("...").font(.texto())
                                    .foregroundColor(.black)}
                            ).frame(width: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 150 : 100, height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 180 : 150)
                        }.padding(.horizontal)
                        .background(Color.white)
                        HStack{
                            VStack{
                                HStack{
                                    Text(TITULO_FICHA_GENERAL)
                                        .bold()
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.titulo())
                                    Spacer()
                                }.padding(.bottom, 8)
                                .padding(.top, 5)
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "location.fill")
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                            Text(TITULO_DIRECCION)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }.padding(.bottom, 3)
                                        Text("\(universidadDetailViewModel.direccion)")
                                            .font(.texto())
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .padding(.leading, 30)
                                            .foregroundColor(.black)
                                    }
                                    Spacer()
                                }
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "person.fill")
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                            Text(TITULO_RECTOR)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            
                                        }.padding(.bottom, 3)
                                        Text("\(universidadDetailViewModel.rector)")
                                            .font(.texto())
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .padding(.leading, 30)
                                    }
                                    Spacer()
                                }.padding(.top, 5)
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "building.2.fill")
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                            Text(TITULO_GOBERNADOR)
                                                .font(.texto1())
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }.padding(.bottom, 3)
                                        Text("\(universidadDetailViewModel.gobernador)")
                                            .font(.texto())
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            .padding(.leading, 30)
                                    }
                                    Spacer()
                                }.padding(.top, 5)
                                .padding(.bottom, 5)
                            }.padding(.leading)
                        }.background(Color("grisClaro1"))
                        HStack{
                            VStack{
                                HStack{
                                    Text(TITULO_SITIO_EN_TRANSPARENCIA).bold()
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    Spacer()
                                }.padding(.bottom,3)
                                HStack{
                                    VStack(alignment: .leading){
                                        if universidadDetailViewModel.transparencyUrl != ""{
                                            HStack{
                                                Image(systemName: "link")
                                                Link("Ir a sitio", destination: URL(string: "\(universidadDetailViewModel.transparencyUrl)")!).font(.texto1())
                                            }.foregroundColor(Color("dorado"))
                                            .padding(.bottom, 3)
                                        }
                                        if universidadDetailViewModel.planAusteridad != ""{
                                            BotonDocumentos(documento: universidadDetailViewModel.planAusteridad, titulo: TITULO_DOC_PLAN_AUSTERIDAD, anio: self.anio)
                                        }
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Text(TITULO_NUMERALIA)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }.padding(.bottom, 7)
                                if self.anio == 2018 && self.subsidioSeleccionadokey == "subsidio_extraordinario"{
                                    LazyVGrid(columns:
                                                [
                                                    GridItem(.flexible(minimum: 350, maximum: 350), spacing: 3)
                                                ],spacing: 3, content: {
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.higherEducationEnrolment))), texto: TITULO_MEST_EX)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.enrolmentTotal))), texto: TITULO_MT_EX)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.fullTimeProfessorsTotal))), texto: TITULO_TPTC_EX)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.desirableProfileProfessor))), texto: TITULO_TPTCPDV_EX)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.nationalSystemResearchersProfessor))), texto: TITULO_PSNIV_EX)
                                                    itemNumeralia(monto: "$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.studentAllowance))), texto: TITULO_SAFYE_EX)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.federationOwnershipPercentage))) + "%", texto: TITULO_PPF_EX)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.stateOwnershipPercentage))) + "%", texto: TITILO_PPE_EX)
                                                })
                                }else{
                                    LazyVGrid(columns:
                                                [
                                                    GridItem(.flexible(minimum: 350, maximum: 350), spacing: 3)
                                                ],spacing: 3, content: {
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.higherEducationEnrolment))), texto: TITULO_MEST)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.highSchoolEnrolment))), texto: TITULO_MEMST)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.enrolmentTotal))), texto: TITULO_MT)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.fullTimeProfessorsTotal))), texto: TITULO_TPTC)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.desirableProfileProfessor))), texto: TITULO_TPTCPDV)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.nationalSystemResearchersProfessor))), texto: TITULO_PSNIV)
                                                    itemNumeralia(monto: "$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.studentAllowance))), texto: TITULO_SAFYE)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.federationOwnershipPercentage))) + "%", texto: TITULO_PPF)
                                                    itemNumeralia(monto: String(formatResultForRegion(basedOn: String(universidadDetailViewModel.stateOwnershipPercentage))) + "%", texto: TITULO_PPE)
                                                })
                                }
                            }.padding(.leading)
                        }.background(Color.white)
                        .padding(.top, 8)
                        VStack{
                            VStack(alignment: .leading){
                                HStack{
                                    Text(TITULO_REFERENCIAS_NUMERALIA)
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
                                ForEach(universidadDetailViewModel.numeralia.sorted(by: >).reversed(), id: \.key){key, value in
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
                        HStack{
                            VStack{
                                if universidadDetailViewModel.montoFedral != 0 && universidadDetailViewModel.montoEstatal != 0 && universidadDetailViewModel.montoPublico != 0{
                                    HStack{
                                        Text("$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.montoPublico))))
                                            .foregroundColor(Color("rosita"))
                                            .font(.titulo())
                                            .bold()
                                    }.padding(.top, 8)
                                    .padding(.leading)
                                    Text(TITULO_MONTO_TOTAL)
                                        .foregroundColor(Color.black)
                                        .font(.texto())
                                        .bold()
                                    PieChart(entries: Grafica.entriesForWines(
                                                [
                                                    Grafica(value: calcularPorcentaje(monto: universidadDetailViewModel.montoFedral, montoPublico: universidadDetailViewModel.montoPublico), label: TITULO_MONTO_FEDERAL, categoria: .graficaPastel),
                                                    Grafica(value: calcularPorcentaje(monto: universidadDetailViewModel.montoEstatal, montoPublico: universidadDetailViewModel.montoPublico), label: TITULO_MONTO_ESTATAL, categoria: .graficaPastel),
                                                ], categoria: .graficaPastel))
                                        .frame(height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 550 : 250)
                                    VStack{
                                        HStack{
                                            Circle()
                                                .foregroundColor(Color("verde2"))
                                                .background(Color("verde2"))
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .overlay(Circle().stroke(Color("verde2"),lineWidth: 1))
                                            Text("$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.montoFedral))))
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                                .bold()
                                        }.padding(.top, 8)
                                        .padding(.leading)
                                        Text(TITULO_MONTO_FEDERAL)
                                            .foregroundColor(Color.black)
                                            .font(.texto())
                                            .bold()
                                        
                                        HStack{
                                            Circle()
                                                .foregroundColor(Color("verde3"))
                                                .background(Color("verde3"))
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .overlay(Circle().stroke(Color("verde3"),lineWidth: 1))
                                            Text("$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.montoEstatal))))
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                                .bold()
                                        }.padding(.top, 8)
                                        .padding(.leading)
                                        Text(TITULO_MONTO_ESTATAL)
                                            .foregroundColor(Color.black)
                                            .font(.texto())
                                            .bold()
                                    }.padding(.top, 8)
                                    .padding(.bottom, 10)
                                }
                                if universidadDetailViewModel.montoFedral == 0 && universidadDetailViewModel.montoEstatal == 0 && universidadDetailViewModel.montoPublico != 0{
                                    PieChart1(entries: Grafica.entriesForWines(
                                                [
                                                    Grafica(value: calcularPorcentaje(monto: universidadDetailViewModel.montoPublico, montoPublico: universidadDetailViewModel.montoPublico), label: TITULO_MONTO_PUBLICO, categoria: .graficaPastel),
                                                ], categoria: .graficaPastel))
                                        .frame(height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 550 : 250)
                                    VStack{
                                        HStack{
                                            Circle()
                                                .foregroundColor(Color("rosita"))
                                                .background(Color("rosita"))
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .overlay(Circle().stroke(Color("rosita"),lineWidth: 1))
                                            Text("$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.montoPublico))))
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                                .bold()
                                        }.padding(.top, 8)
                                        .padding(.leading)
                                        Text(self.anio == 2018 ? TITULO_MONTO_PUBLICO : TITULO_MONTO)
                                            .foregroundColor(Color.black)
                                            .font(.texto())
                                            .bold()
                                    }.padding(.top, 8)
                                    .padding(.bottom, 10)
                                }
                                if universidadDetailViewModel.montoFedral != 0 && universidadDetailViewModel.montoEstatal == 0 && universidadDetailViewModel.montoPublico == 0{
                                    PieChart1(entries: Grafica.entriesForWines(
                                                [
                                                    Grafica(value: calcularPorcentaje(monto: universidadDetailViewModel.montoFedral, montoPublico: universidadDetailViewModel.montoFedral), label: TITULO_MONTO_PUBLICO, categoria: .graficaPastel),
                                                ], categoria: .graficaPastel))
                                        .frame(height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 550 : 250)
                                    VStack{
                                        HStack{
                                            Circle()
                                                .foregroundColor(Color("rosita"))
                                                .background(Color("rosita"))
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .overlay(Circle().stroke(Color("rosita"),lineWidth: 1))
                                            Text("$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.montoFedral))))
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                                .bold()
                                        }.padding(.top, 8)
                                        .padding(.leading)
                                        Text(TITULO_MONTO_FEDERAL)
                                            .foregroundColor(Color.black)
                                            .font(.texto())
                                            .bold()
                                    }.padding(.top, 8)
                                    .padding(.bottom, 10)
                                }
                                if universidadDetailViewModel.montoFedral == 0 && universidadDetailViewModel.montoEstatal != 0 && universidadDetailViewModel.montoPublico == 0{
                                    PieChart1(entries: Grafica.entriesForWines(
                                                [
                                                    Grafica(value: calcularPorcentaje(monto: universidadDetailViewModel.montoEstatal, montoPublico: universidadDetailViewModel.montoEstatal), label: TITULO_MONTO_PUBLICO, categoria: .graficaPastel),
                                                ], categoria: .graficaPastel))
                                        .frame(height: UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 550 : 250)
                                    VStack{
                                        HStack{
                                            Circle()
                                                .foregroundColor(Color("rosita"))
                                                .background(Color("rosita"))
                                                .frame(width: 20, height: 20)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .overlay(Circle().stroke(Color("rosita"),lineWidth: 1))
                                            Text("$" + String(formatResultForRegion(basedOn: String(universidadDetailViewModel.montoEstatal))))
                                                .foregroundColor(Color("rosita"))
                                                .font(.texto1())
                                                .bold()
                                        }.padding(.top, 8)
                                        .padding(.leading)
                                        Text(TITULO_MONTO_ESTATAL)
                                            .foregroundColor(Color.black)
                                            .font(.texto())
                                            .bold()
                                    }.padding(.top, 8)
                                    .padding(.bottom, 10)
                                }
                            }
                        }.background(Color.white)
                        .overlay(Rectangle().stroke(Color("grisClaro"), lineWidth: 1.5))
                        .padding()
                        HStack{
                            VStack{
                                if self.subsidioSeleccionadokey == "subsidio_extraordinario" && self.id != "32"{
                                    VStack{
                                        ForEach(universidadDetailViewModel.subsidioExtra.filter{$0.value != "La revisión del cumplimiento de los compromisos ha sido realizada por la Asociación Mexicana de Órganos de Control y Vigilancia en Instituciones de Educación Superior (AMOCVIES)."}, id: \.key){key, value in
                                            HStack{
                                                VStack(alignment: .leading){
                                                    Text("\(value)")
                                                        .font(.texto())
                                                        .foregroundColor(.black)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                if universidadDetailViewModel.notaEspecial != ""{
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("\(universidadDetailViewModel.notaEspecial ?? "")")
                                                .font(.texto())
                                                .foregroundColor(.black)
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }
                                    }
                                }
                                HStack{
                                    VStack(alignment: .leading){
                                        if universidadDetailViewModel.anexoEjecucion != ""{
                                            BotonDocumentos(documento: universidadDetailViewModel.anexoEjecucion, titulo: TITULO_DOC_ANEXO_EJECUCION, anio: self.anio)
                                        }
                                        if universidadDetailViewModel.MarcoColaboracion != ""{
                                            BotonDocumentos(documento: universidadDetailViewModel.MarcoColaboracion, titulo: TITULO_DOC_CONVENIO_MARCO_COLAB, anio: universidadDetailViewModel.MarcoAnio)
                                        }
                                        if universidadDetailViewModel.convenio != ""{
                                            if(self.subsidioSeleccionadokey == "subsidio_presupuesto"){
                                                let conv = universidadDetailViewModel.convenio.components(separatedBy: ",")
                                                VStack {
                                                    ForEach(0..<conv.count){ i in
                                                        let vert = conv[i].description.components(separatedBy: "*")
                                                        if vert[0] == "A" {
                                                            BotonDocumentos(documento: vert[1], titulo: TITULO_DOC_CONVENIO_VER_A, anio: self.anio)
                                                        }else if vert[0] == "B"{
                                                            BotonDocumentos(documento: vert[1], titulo: TITULO_DOC_CONVENIO_VER_B, anio: self.anio)
                                                        }else{
                                                            BotonDocumentos(documento: vert[1], titulo: TITULO_DOC_CONVENIO_VER_C, anio: self.anio)
                                                        }
                                                    }
                                                }
                                                
                                            }else{
                                                BotonDocumentos(documento: universidadDetailViewModel.convenio, titulo: TITULO_DOC_CONVENIO, anio: self.anio)
                                            }
                                        }
                                        if universidadDetailViewModel.ModificacionCalendario != ""{
                                            BotonDocumentos(documento: universidadDetailViewModel.ModificacionCalendario, titulo: TITULO_DOC_MODIF_CALENDARIO, anio: self.anio)
                                        }
                                        
                                        if universidadDetailViewModel.oficioCalendario != ""{
                                            BotonDocumentos(documento: universidadDetailViewModel.oficioCalendario, titulo: TITULO_DOC_OFI_CALENDARIO, anio: self.anio)
                                        }
                                    }
                                    Spacer()
                                }
                            }.padding(.leading)
                        }.background(Color.white)
                        HStack{
                            VStack(alignment: .leading){
                                HStack{
                                    Text(TITULO_TABLERO)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }.padding(.bottom,3)
                                if self.isExtraordinario{
                                    if self.subsidioSeleccionadokey == "subsidio_extraordinario" && self.anio == 2021 || self.anio == 2022{
                                        if self.subsidioSeleccionadokey == "subsidio_extraordinario"{
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_TABLERO_ACCIONES_UNI, accionDe: "Acción de la Universidad", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                                label: {
                                                    Text(TITULO_TABLERO_ACCIONES_UNI)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                            
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_TABLERO_ACCIONES_GOB, accionDe: "Acción del Gobierno del Estado", anio: self.anio, tipo: TIPO_EDO, id: self.id),
                                                label: {
                                                    Text(TITULO_TABLERO_ACCIONES_GOB)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: TableroFederal(tituloTablero: TITULO_TABLERO_MINISTACION_FDRAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                                label: {
                                                    Text(TITULO_TABLERO_MINISTACION_FDRAL)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                        if( self.id == "24" && self.anio == 2021){
                                            let _ = print("no hay informacion de esta universidad (UAZ)")
                                        }else{
                                            NavigationLink(
                                                destination: TableroEstatal(tituloTablero: TITULO_TABLERO_MINISTACION_ESTATAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                                label: {
                                                    Text(TITULO_TABLERO_MINISTACION_ESTATAL)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                        }
                                        
                                    }
                                }
                                    if self.subsidioSeleccionadokey == "subsidio_presupuesto"{
                                        NavigationLink(
                                            destination: CompromisosVertientes(titulo: "Vertientes", compromisoDe: "Compromiso de la Universidad", anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_UNI, subsidioSeleccionadokey: self.subsidioSeleccionadokey),
                                            label: {
                                                Text(TITULO_COMPROMISOS_UNI)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                            }).padding(.bottom, 5)
                                        NavigationLink(
                                            destination: TableroFederal(tituloTablero: TITULO_TABLERO_MINISTACION_FDRAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                            label: {
                                                Text(TITULO_TABLERO_MINISTACION_FDRAL)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                                    .multilineTextAlignment(.leading)
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            }).padding(.bottom, 5)
                                        NavigationLink(
                                            destination: TableroCumplimientoPresupuesto(titulo: TITULO_TABLERO_CUMPLIMIENTO, subtituloView: "Cumplimiento", anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_TABLERO),
                                            label: {
                                                Text(TITULO_TABLERO_CUMPLIMIENTO)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                            }).padding(.bottom, 5)

                                    }

                                    
                                    if self.subsidioSeleccionadokey == "subsidio_extraordinario" && self.anio == 2020{
                                        switch self.id {
                                        case "20":
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_TABLERO_ACCIONES_UNI, accionDe: "Acción de la Universidad", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                                label: {
                                                    Text(TITULO_TABLERO_ACCIONES_UNI)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: TableroFederal(tituloTablero: TITULO_TABLERO_MINISTACION_FDRAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                                label: {
                                                    Text(TITULO_TABLERO_MINISTACION_FDRAL)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                        default:
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_TABLERO_ACCIONES_UNI, accionDe: "Acción de la Universidad", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                                label: {
                                                    Text(TITULO_TABLERO_ACCIONES_UNI)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                            
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_TABLERO_ACCIONES_GOB, accionDe: "Acción del Gobierno del Estado", anio: self.anio, tipo: TIPO_EDO, id: self.id),
                                                label: {
                                                    Text(TITULO_TABLERO_ACCIONES_GOB)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: TableroFederal(tituloTablero: TITULO_TABLERO_MINISTACION_FDRAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                                label: {
                                                    Text(TITULO_TABLERO_MINISTACION_FDRAL)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                            
                                            NavigationLink(
                                                destination: TableroEstatal(tituloTablero: TITULO_TABLERO_MINISTACION_ESTATAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                                label: {
                                                    Text(TITULO_TABLERO_MINISTACION_ESTATAL)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                        .multilineTextAlignment(.leading)
                                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                }).padding(.bottom, 5)
                                        }
                                        
                                    }
                                    if self.subsidioSeleccionadokey == "subsidio_profexce" && self.anio == 2020{
                                        NavigationLink(
                                            destination: Compromisos(titulo: TITULO_COMPROMISOS_ESTADO, compromisoDe: "Compromiso del Estado", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_EDO),
                                            label: {
                                                Text(TITULO_COMPROMISOS_ESTADO)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                            }).padding(.bottom, 5)
                                        NavigationLink(
                                            destination: Compromisos(titulo: TITULO_COMPROMISOS_UNI, compromisoDe: "Compromiso de la Universidad", isCompromisoUniversidad: true, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_UNI),
                                            label: {
                                                Text(TITULO_COMPROMISOS_UNI)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                            }).padding(.bottom, 5)
                                        NavigationLink(
                                            destination: TableroCumplimiento(titulo: TITULO_TABLERO_CUMPLIMIENTO, subtituloView: "Cumplimiento", anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: TIPO_TABLERO),
                                            label: {
                                                Text(TITULO_TABLERO_CUMPLIMIENTO)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                            }).padding(.bottom, 5)
                                    }
                                    if self.subsidioSeleccionadokey == "subsidio_extraordinario" && self.anio == 2019{
                                        NavigationLink(
                                            destination: AccionesEmprender(titulo: TITULO_ACCIONES_POR_EMPRENDER, accionDe: "Acción", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                            label: {
                                                Text(TITULO_ACCIONES_POR_EMPRENDER)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                            }).padding(.bottom, 5)
                                        
                                        NavigationLink(
                                            destination: TableroFederal(tituloTablero: TITULO_TABLERO_MINISTACION_FDRAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                            label: {
                                                Text(TITULO_TABLERO_MINISTACION_FDRAL)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                                    .multilineTextAlignment(.leading)
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            }).padding(.bottom, 5)
                                        
                                        NavigationLink(
                                            destination: TableroEstatal(tituloTablero: TITULO_TABLERO_MINISTACION_ESTATAL, anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                            label: {
                                                Text(TITULO_TABLERO_MINISTACION_ESTATAL)
                                                    .font(.texto1())
                                                    .foregroundColor(Color("rosita"))
                                                    .multilineTextAlignment(.leading)
                                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                            }).padding(.bottom, 5)
                                    }
                                    if self.subsidioSeleccionadokey == "subsidio_extraordinario" && self.anio == 2018{
                                        switch self.id {
                                        case "20":
                                            NavigationLink(
                                                destination: Compromisos(titulo: TITULO_COMPROMISOS, compromisoDe: "Compromiso", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: ""),
                                                label: {
                                                    Text(TITULO_COMPROMISOS)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_ACCIONES_POR_EMPRENDER, accionDe: "Acción", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                                label: {
                                                    Text(TITULO_ACCIONES_POR_EMPRENDER)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                        case "28":
                                            NavigationLink(
                                                destination: Compromisos(titulo: TITULO_COMPROMISOS, compromisoDe: "Compromiso", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: ""),
                                                label: {
                                                    Text(TITULO_COMPROMISOS)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_ACCIONES_POR_EMPRENDER, accionDe: "Acción", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                                label: {
                                                    Text(TITULO_ACCIONES_POR_EMPRENDER)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                        case "32":
                                            NavigationLink(
                                                destination: Compromisos(titulo: TITULO_COMPROMISOS, compromisoDe: "Compromiso", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: ""),
                                                label: {
                                                    Text(TITULO_COMPROMISOS)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                        default:
                                            NavigationLink(
                                                destination: Compromisos(titulo: TITULO_COMPROMISOS, compromisoDe: "Compromiso", isCompromisoUniversidad: false, anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: ""),
                                                label: {
                                                    Text(TITULO_COMPROMISOS)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_ACCIONES_EMPRENDIDAS, accionDe: "Acción Emprendida", anio: self.anio, tipo: TIPO_EMPRENDIDAS, id: self.id),
                                                label: {
                                                    Text(TITULO_ACCIONES_EMPRENDIDAS)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                            NavigationLink(
                                                destination: AccionesEmprender(titulo: TITULO_ACCIONES_POR_EMPRENDER, accionDe: "Acción", anio: self.anio, tipo: TIPO_UNI, id: self.id),
                                                label: {
                                                    Text(TITULO_ACCIONES_POR_EMPRENDER)
                                                        .font(.texto1())
                                                        .foregroundColor(Color("rosita"))
                                                }).padding(.bottom, 5)
                                        }
                                    }
                                }else{
                                    NavigationLink(
                                        destination: CompromisosUniversidad(anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey, tipo: ""),
                                        label: {
                                            Text(TITULO_COMPROMISOS_UNI)
                                                .font(.texto1())
                                                .foregroundColor(Color("rosita"))
                                        }).padding(.bottom, 5)
                                    NavigationLink(
                                        destination: TableroCumplimientoFederal(anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey),
                                        label: {
                                            Text(TITULO_TABLERO_MINISTACION_FDRAL)
                                                .font(.texto1())
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color("rosita"))
                                                .multilineTextAlignment(.leading)
                                        }).padding(.bottom, 5)
                                    NavigationLink(
                                        destination: TableroCumplimientoEstatal(anio: self.anio, id: self.id, tipo: self.subsidioSeleccionadokey) ,
                                        label: {
                                            Text(TITULO_TABLERO_MINISTACION_ESTATAL)
                                                .font(.texto1())
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color("rosita"))
                                                .multilineTextAlignment(.leading)
                                        })
                                }
                                if universidadDetailViewModel.notaGlobal != ""{
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("\(universidadDetailViewModel.notaGlobal ?? "")")
                                                .font(.texto())
                                                .foregroundColor(.black)
                                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }.padding(.trailing)
                                    }
                                }
                            }.padding(.leading)
                        }.background(Color.white)
                        
                        if self.subsidioSeleccionadokey == "subsidio_ordinario" ||  self.subsidioSeleccionadokey == ""{
                            VStack(alignment: .center){
                                HStack{
                                    Text(TITULO_REFERENCIA_ANEXO_EJE + " \(String(self.anio))")
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                }.padding(.bottom,8)
                                .padding(.leading)
                            }
                            VStack(alignment: .leading){
                                ForEach(universidadDetailViewModel.anexo.sorted(by: <), id: \.key){key, value in
                                    HStack{
                                        Text("\(key)")
                                        Text("\(value)")
                                    }.foregroundColor(.black)
                                    .font(.texto())
                                    .padding(.horizontal)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    
                                }
                            }
                            VStack(alignment: .leading ){
                                HStack{
                                    Text(TITULO_OTRAS_REF)
                                        .foregroundColor(.black)
                                        .font(.titulo())
                                        .bold()
                                    Spacer()
                                }.padding(.bottom,8)
                                .padding(.leading)
                            }
                            VStack(alignment: .leading){
                                ForEach(universidadDetailViewModel.otras.sorted(by: <), id: \.key){key, value in
                                    HStack{
                                        Text("\(key)")
                                        Text("\(value)")
                                    }.font(.texto())
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                        if self.subsidioSeleccionadokey == "subsidio_extraordinario"{
                            ForEach(universidadDetailViewModel.subsidioExtra.filter{$0.value == "La revisión del cumplimiento de los compromisos ha sido realizada por la Asociación Mexicana de Órganos de Control y Vigilancia en Instituciones de Educación Superior (AMOCVIES)."}, id: \.key){key, value in
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("\(value)")
                                            .font(.texto())
                                            .foregroundColor(.black)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    }
                                }.padding(.horizontal)
                            }
                        }
                        
                        if self.subsidioSeleccionadokey == "subsidio_profexce" || self.subsidioSeleccionadokey == "subsidio_presupuesto"{
                            if self.subsidioSeleccionadokey == "subsidio_presupuesto"{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(universidadDetailViewModel.titulo ?? "referencias Presupuesto")
                                            .foregroundColor(.black)
                                            .font(.titulo())
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    }.padding(.bottom,8)
                                    .padding(.leading)
                                }
                                VStack(alignment: .leading){
                                    ForEach(universidadDetailViewModel.anexopre.sorted(by: <), id: \.key){key, value in
                                        HStack{
                                            Text("\(key)")
                                            Text("\(value)")
                                        }.foregroundColor(.black)
                                        .font(.texto())
                                        .padding(.horizontal)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    }
                                }
                            }else{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(TITULO_REF)
                                            .foregroundColor(.black)
                                            .font(.titulo())
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    }.padding(.bottom,8)
                                    .padding(.leading)
                                }
                                VStack(alignment: .leading){
                                    ForEach(universidadDetailViewModel.anexoProfexce.sorted(by: <), id: \.key){key, value in
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
                        
                        
                        
                        
                    }.edgesIgnoringSafeArea(.all)
                    .navigationBarHidden(true)
                }
            }.edgesIgnoringSafeArea(.all)
            .navigationViewStyle(StackNavigationViewStyle())
        }.padding(.bottom, 50)
        .onAppear{
            universidadDetailViewModel.loadData(anio: self.anio, id: self.id, extraordinarioSeleccionadokey: self.subsidioSeleccionadokey)
            universidadDetailViewModel.loadReferences(anio: self.anio)
            universidadDetailViewModel.loadNotes(anio: self.anio, id: self.id, subsidio: self.subsidioSeleccionadokey)
            
        }.navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}



struct UniversidadDetail_Previews: PreviewProvider {
    static var previews: some View {
        UniversidadDetail(logo: "https://sep.subsidioentransparencia.mx/images/universidades/escudos/BUAP.png", isExtraordinario: false, subsidioSeleccionadokey: "Unversidades Públicas Estatales con deficit financiero", anio: 2018, id: "30", bandera: true)
    }
}
