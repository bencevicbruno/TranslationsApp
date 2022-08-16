//
//  View+.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

extension View {
    
    func frame(minSize: CGFloat, maxSize: CGFloat) -> some View {
        self.frame(minWidth: minSize, maxWidth: maxSize, minHeight: minSize, maxHeight: maxSize)
    }
    
    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
