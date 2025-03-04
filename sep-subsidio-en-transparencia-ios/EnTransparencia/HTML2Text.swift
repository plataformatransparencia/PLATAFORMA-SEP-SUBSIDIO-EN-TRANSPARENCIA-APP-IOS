//
//  HTML2Text.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 02/03/25.
//
import SwiftUI
import UIKit

struct HTMLText: View {
    let htmlString: String
    let alignment: TextAlignment
    
    var body: some View {
        if let attributedString = parseHTML(htmlString) {
            Text(AttributedString(attributedString))
                .font(.texto())
                .multilineTextAlignment(alignment)
                .foregroundColor(Color(.black))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        } else {
            Text("Error al cargar el texto")
                .font(.texto())
                .multilineTextAlignment(alignment)
                .foregroundColor(Color(.black))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
    }
    
    private func parseHTML(_ html: String) -> NSAttributedString? {
        guard let data = html.data(using: .utf8) else { return nil }
        
        return try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
    }
}


