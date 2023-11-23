import Foundation

struct DetalleUniversidad: Codable {
    var id: Int
    var estado: String
    var nombre: String
    var siglas: String
    var escudo: String
    var webUrl: String
    var transparencyUrl: String
    var gobernador: String
    var gobernadorCargo: String
    var rector: String
    var rectorCargo: String
    var direccion: String
    var montos: Montos
    var anexoEjecucion: String?
    var ModificacionCalendario: String?
    var oficioCalendario: String?
    var planAusteridad: String?
    var MarcoColaboracion: String?
    var MarcoAnio: Int?
    var convenio: String?
    var numeralia: Numeralia
}

struct Montos: Codable {
    var montoFederal: Double?
    var montoEstatal: Double?
    var montoPublico: Double?
    var montoFederalLetra: String?
    var montoEstatalLetra: String?
    var montoPublicoLetra: String?
}

struct Numeralia: Codable {
    var higherEducationEnrolment: Double
    var highSchoolEnrolment: Double?
    var enrolmentTotal: Double
    var fullTimeProfessorsTotal: Double
    var desirableProfileProfessor: Double
    var nationalSystemResearchersProfessor: Double
    var studentAllowance: Double
    var federationOwnershipPercentage: Double
    var stateOwnershipPercentage: Double
}
