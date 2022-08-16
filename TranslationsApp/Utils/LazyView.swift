//
//  LazyView.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    let contentBuilder: () -> Content
    
    init(_ contentBuilder: @autoclosure @escaping () -> Content) {
        self.contentBuilder = contentBuilder
    }
    
    var body: Content {
        contentBuilder()
    }
}
