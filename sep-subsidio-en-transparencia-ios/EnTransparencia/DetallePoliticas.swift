//
//  DetallePoliticas.swift
//  EnTransparencia
//
//  Created by Invitado on 31/07/24.
//

import SwiftUI

struct DetallePoliticas: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var contactoViewModel = ContactoViewModel()
    var body: some View {
        NavigationView{
            VStack{
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
                                    Text(GRID_MENU_POLITICAS)
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color("rosita"))
                                        .font(.titulo())
                                    Spacer()
                                }
                            }
                            Spacer()
                        }.padding()
                        
                        HStack{
                            VStack{
                                Text("Politicas de privacidad").bold()
                                    .multilineTextAlignment(.center)
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                                
                                Text("Esta política de privacidad rige el uso de la aplicación del software Subsidio en Transparencia para dispositivos móviles, que fue creada por la Dirección General de Educación Superior Universitaria e Intercultural.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                
                                Text("Esta aplicación promueve la transparencia de la información relativa al apoyo financiero de recursos públicos federales y estatales ordinarios y extraordinarios otorgados por la Federación y las Entidades Federativas a las Universidades Públicas Estatales (UPES), Universidades Públicas Estatales con Apoyo Solidario (UPEAS) y Universidades Interculturales (Ul) para garantizar su operación de conformidad con el Articulo 67 de la Ley General de Educación Superior, fracciones II y VIII.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                
                                Text("¿Qué información recopilamos?").bold()
                                    .multilineTextAlignment(.trailing)
                                    .font(.title3)
                                    .foregroundColor(.black)
                                    .padding(.top, 15)
                                
                                Text("La aplicación no recopila información personal de los usuarios como nombre, apellido, edad, fecha de nacimiento, etc., y no se almacenan ni comparten datos de los servicios a los cuales se solicita permiso.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                Text("La aplicación Subsidio en Transparencia requiere permisos de los siguientes servicios:")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                Text("- Geolocalización: permiso necesario para futuras mejoras en la aplicación, no recopila los datos de ubicación ni se comparten.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                Text("- Almacenamiento: permite el guardado de archivos necesarios de la aplicación.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                
                                Text("- Network: permite saber si el dispositivo cuenta con internet.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                
                                Text("La información de ubicación utilizada por esta aplicación es limitada a la posición GPS en coordenadas de latitud y longitud. No incluye ninguna información que lo identifique a usted o a su dispositivo que permita el rastreo de su equipo. Ninguna información será guardada ni compartida, se garantiza la completa privacidad de usuarios y el contenido de su equipo.")
                                    .multilineTextAlignment(.leading)
                                    .font(.texto1())
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .padding(.top,10)
                                
                                Text("Contacto").bold()
                                    .multilineTextAlignment(.trailing)
                                    .font(.title3)
                                    .foregroundColor(.black)
                                    .padding(.top, 15)
                                VStack{
                                    Text("Para ponerse en contacto con nosotros, utilice el correo electrónico:")
                                        .multilineTextAlignment(.leading)
                                        .font(.texto1())
                                        .foregroundColor(.black)
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .padding(.top,10)
                                    Link("subsidiotransparencia@nube.sep.gob.mx", destination: URL(string: "mailto:subsidiotransparencia@nube.sep.gob.mx")!)
                                        .foregroundColor(Color("dorado"))
    //                                    .accentColor(Color("dorado"))
                                    
                                        .padding(.top,10)
                                }
                                
                                
                            }.padding()
                            
                            
                        }
                    }.padding(.bottom, UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? -20 : -10)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
                
            }
        }.navigationBarHidden(true)
        Spacer(minLength: 100)
    }
}

#Preview {
    DetallePoliticas()
}
