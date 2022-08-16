//
//  TranslationCell.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

struct TranslationCell: View {
    
    var translation: Translation
    
    @State private var isExpanded = true
    
    var body: some View {
        GroupBox {
            DisclosureGroup(translation.key, isExpanded: $isExpanded) {
                ForEach(translation.allTranslations, id: \.key) { key, value in
                    Text("\(key.flag): \(value)")
                        .padding(.vertical)
                        .frame(width: 200)
                        .background(.red)
                }
            }
            .frame(alignment: .leading)
        }
        .frame(width: 200)
        .background(.blue)
    }
}

struct TranslationCell_Previews: PreviewProvider {
    static var previews: some View {
        TranslationCell(translation:
                .init(key: "example",
                      translations: [
                        .croatian: "Primjer",
                        .english: "Example",
                        .french: "Exemple"
                      ]))
    }
}
