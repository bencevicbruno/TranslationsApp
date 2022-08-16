//
//  View+Error.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 02.05.2022..
//

import SwiftUI

extension View {
    
    func appErrorOverlay<Overlay>(_ errorBinding: Binding<AppError?>, @ViewBuilder _ content: @escaping (AppError) -> Overlay) where Overlay: View {
        let isActive = Binding(
            get: { errorBinding.wrappedValue != nil },
            set: { value in
                if !value {
                    errorBinding.wrappedValue = nil
                }
            }
        )
        
        self.fullScreenCover(item: isActive) {
            if let error = errorBinding.wrappedValue {
                content(error)
            } else {
                EmptyView()
            }
        }
    }
}
