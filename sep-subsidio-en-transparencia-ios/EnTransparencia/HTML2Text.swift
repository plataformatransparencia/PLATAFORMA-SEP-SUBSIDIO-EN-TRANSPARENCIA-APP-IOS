//
//  HTML2Text.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 02/03/25.
//

import SwiftUI

struct HTML2Text:View {
    let htmlString: String
    var textModifier: (Text) -> AnyView // Se usa AnyView para evitar problemas de inferencia
        
    init(htmlString: String, @ViewBuilder textModifier: @escaping (Text) -> some View = {  AnyView($0) } ) {
            self.htmlString = htmlString
            self.textModifier = {  AnyView( textModifier($0) ) } //Se convierte a AnyView
        }
    
    var body: some View {
        if let attributedString = parseHTML(htmlString){
            textModifier(  Text(attributedString))
        }else{
            textModifier( Text(htmlString))
        }
    }
    
    
    
    
    func parseHTML(_ html: String) -> AttributedString? {
        guard let data = html.data(using: .utf8) else {
            return nil
        }
        
        do{
            let options: [NSAttributedString.DocumentReadingOptionKey:Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            return AttributedString(attributedString)
        }catch{
            print("Error al convertir HTML: \(error)")
            return nil
        }
    }
}
