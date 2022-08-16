//
//  View+Navigation.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

extension View {
    
    func pushNavigation<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: @escaping (Item) -> Destination) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )
        
        return LazyView(pushNavigation(isActive: isActive) {
            if let item = item.wrappedValue {
                destination(item)
            } else {
                EmptyView()
            }
        })
    }
    
    func presentNavigation<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: @escaping (Item) -> Destination) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )
        
        return LazyView(fullScreenCover(isPresented: isActive) {
            if let item = item.wrappedValue {
                destination(item)
            } else {
                EmptyView()
            }
        })
    }
}

fileprivate extension View {
    
    func pushNavigation<Destination: View>(isActive: Binding<Bool>, @ViewBuilder destination: () -> Destination) -> some View {
        overlay(
            NavigationLink(
                destination: isActive.wrappedValue ? destination() : nil,
                isActive: isActive,
                label: { EmptyView() }
            )
        )
    }
}
