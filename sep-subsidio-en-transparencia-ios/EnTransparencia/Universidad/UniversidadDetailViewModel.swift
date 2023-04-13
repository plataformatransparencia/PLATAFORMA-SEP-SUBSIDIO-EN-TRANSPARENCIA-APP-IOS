import Foundation


final class UniversidadDetailViewModel: ObservableObject{
    @Published var nombre = ""
    @Published var estado = ""
    @Published var siglas = ""
    @Published var webUrl = ""
    @Published var transparencyUrl = ""
    @Published var gobernador = ""
    @Published var rector = ""
    @Published var direccion = ""
    
    @Published var anexoEjecucion = ""
    @Published var ModificacionCalendario = ""
    @Published var oficioCalendario = ""
    @Published var planAusteridad = ""
    @Published var MarcoColaboracion = ""
    @Published var MarcoAnio = 0
    @Published var convenio = ""
    
    //Montos
    @Published var montoFedral = 0.0
    @Published var montoEstatal = 0.0
    @Published var montoPublico = 0.0
    
    //Numeralia
    @Published var higherEducationEnrolment = 0.0
    @Published var highSchoolEnrolment = 0.0
    @Published var enrolmentTotal = 0.0
    @Published var fullTimeProfessorsTotal = 0.0
    @Published var desirableProfileProfessor = 0.0
    @Published var nationalSystemResearchersProfessor = 0.0
    @Published var studentAllowance = 0.0
    @Published var federationOwnershipPercentage = 0.0
    @Published var stateOwnershipPercentage = 0.0
    
    //Referencias Numeralia
    @Published var numeralia = [String:String]()
    //Referencias Subsidio Ordinario
    @Published var anexo = [Int:String]()
    @Published var otras = [Int:String]()
    // Referencias Subsidio Profrexce
    @Published var anexoProfexce =  [Int:String]()
    // Referencias Subsidio Extraordinario
    @Published var subsidioExtra = [String:String]()
    // Referencia Subsidio Presupuesto
    @Published var anexopre = [Int:String]()
    @Published var titulo : String? = ""
    // Notas
    @Published var notaEspecial : String? = ""
    @Published var notaGlobal : String? = ""
    
    func loadData(anio: Int, id: String, extraordinarioSeleccionadokey: String ){
        guard let url = URL(string: "\(URL_BASE)/ficha2/\(anio)/\(id)/\(extraordinarioSeleccionadokey)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(DetalleUniversidad.self, from: data)
                DispatchQueue.main.async {
                    self.nombre = decodedData.nombre
                    self.siglas = decodedData.siglas
                    self.estado = decodedData.estado
                    self.webUrl = decodedData.webUrl
                    //self.escudo = decodedData.escudo
                    self.transparencyUrl = decodedData.transparencyUrl
                    self.gobernador = decodedData.gobernador
                    self.rector = decodedData.rector
                    self.direccion = decodedData.direccion
                    self.anexoEjecucion = decodedData.anexoEjecucion ?? ""
                    self.ModificacionCalendario = decodedData.ModificacionCalendario ?? ""
                    self.oficioCalendario = decodedData.oficioCalendario ?? ""
                    self.planAusteridad = decodedData.planAusteridad ?? ""
                    self.MarcoColaboracion = decodedData.MarcoColaboracion ?? ""
                    self.MarcoAnio = decodedData.MarcoAnio ?? 0
                    self.convenio = decodedData.convenio ?? ""
                    //Montos
                    self.montoFedral = decodedData.montos.montoFederal ?? 0.0
                    self.montoEstatal = decodedData.montos.montoEstatal ?? 0.0
                    self.montoPublico = decodedData.montos.montoPublico ?? 0.0
                    //Numeralia
                    self.higherEducationEnrolment = decodedData.numeralia.higherEducationEnrolment
                    self.highSchoolEnrolment = decodedData.numeralia.highSchoolEnrolment ?? 0.0
                    self.enrolmentTotal = decodedData.numeralia.enrolmentTotal
                    self.fullTimeProfessorsTotal = decodedData.numeralia.fullTimeProfessorsTotal
                    self.desirableProfileProfessor = decodedData.numeralia.desirableProfileProfessor
                    self.nationalSystemResearchersProfessor = decodedData.numeralia.nationalSystemResearchersProfessor
                    self.studentAllowance = decodedData.numeralia.studentAllowance
                    self.federationOwnershipPercentage = decodedData.numeralia.federationOwnershipPercentage
                    self.stateOwnershipPercentage = decodedData.numeralia.stateOwnershipPercentage
                    
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
    func loadReferences(anio: Int){
        guard let url = URL(string: "\(URL_BASE)/referencias2/\(anio)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(Referencias.self, from: data)
                DispatchQueue.main.async {
                    self.numeralia = decodedData.numeralia
                    //Subsidio Ordinario
                    self.otras = decodedData.subsidio_ordinario?.otras ?? [Int:String]()
                    self.anexo = decodedData.subsidio_ordinario?.anexo ?? [Int:String]()
                    //Subsidio Extraordinario
                    self.subsidioExtra = decodedData.subsidio_extraordinario ?? [String:String]()
                    //Subsidio Profexce
                    self.anexoProfexce = decodedData.subsidio_profexce?.anexo ?? [Int:String]()
                    // Subsidio Presupuesto
                    self.titulo = decodedData.subsidio_presupuesto?.titulo ?? ""
                    self.anexopre = decodedData.subsidio_presupuesto?.anexo ?? [Int:String]()
                    
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
    
    
    func loadNotes(anio: Int, id: String, subsidio: String ){
        guard let url = URL(string: "\(URL_BASE)/notas/\(anio)/\(id)/\(subsidio)")
        else{
            return
        }
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else{
                return
            }
            do{
                let decodedData = try  JSONDecoder().decode(Notas.self, from: data)
                DispatchQueue.main.async {
                    self.notaEspecial = decodedData.nota_especial
                    self.notaGlobal = decodedData.nota_global
                }
            }catch{
                print("No se pudo completar la peticion. Error: \(error)")
            }
        }.resume()
    }
}
