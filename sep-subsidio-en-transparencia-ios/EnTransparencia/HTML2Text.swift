//
//  HTML2Text.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 02/03/25.
//
import SwiftUI
import UIKit
//Last code Correct
struct HTMLText: View {
    let htmlString: String
    let alignment: TextAlignment
    
    var body: some View {
        if let attributedString = parseHTML(htmlString) {
            Text(AttributedString(attributedString))
                .multilineTextAlignment(alignment)
                .padding()
        } else {
            Text("Error al cargar el texto")
                .multilineTextAlignment(alignment)
                .padding()
        }
    }
    
    private func parseHTML(_ html: String) -> NSAttributedString? {
        guard let data = html.data(using: .utf8) else { return nil }
        
        guard let attributedString = try? NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) else {
            return nil
        }

        // **Recorrer los estilos existentes y cambiar solo la fuente**
        attributedString.enumerateAttribute(.font, in: NSRange(location: 0, length: attributedString.length), options: []) { value, range, _ in
            if let oldFont = value as? UIFont {
                           let isBold = oldFont.fontDescriptor.symbolicTraits.contains(.traitBold)
                           let isItalic = oldFont.fontDescriptor.symbolicTraits.contains(.traitItalic)
                           
                           var fontName = "NotoSans-Regular"
                           if isBold && isItalic {
                               fontName = "NotoSans-Medium"
                           } else if isBold {
                               fontName = "NotoSans-Bold"
                           } else if isItalic {
                               fontName = "NotoSans-Italic"
                           }
                           
                           if let newFont = UIFont(name: fontName, size: 14) {
                               attributedString.addAttribute(.font, value: newFont, range: range)
                           }
                       }
        }

        return attributedString
    }
}


