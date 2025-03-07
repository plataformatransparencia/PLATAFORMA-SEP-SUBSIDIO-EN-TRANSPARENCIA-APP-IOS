//
//  FontListView.swift
//  EnTransparencia
//
//  Created by Armando Rodríguez on 07/03/25.
//
import SwiftUI

struct FontListView: View {
    var body: some View {
        List(UIFont.familyNames.sorted(), id: \.self) { family in
            Section(header: Text(family)) {
                ForEach(UIFont.fontNames(forFamilyName: family), id: \.self) { fontName in
                    Text(fontName).font(.custom(fontName, size: 16))
                }
            }
        }
    }
}

struct FontListView_Previews: PreviewProvider {
    static var previews: some View {
        FontListView()
    }
}

