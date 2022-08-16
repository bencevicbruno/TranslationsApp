//
//  MainMenuScreen.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 13.04.2022..
//

import SwiftUI

struct MainMenuScreen: View {
    
    @State private var isBold = false
    @State private var isItalic = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: TabViewTestScreen()) {
                    Text("Open TabViewTest")
                }
            }.toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Toggle(isOn: $isBold) {
                        Image(systemName: "bold")
                    }
                    Toggle(isOn: $isItalic) {
                        Image(systemName: "italic")
                    }
                }
            }
        }
        
    }
}

struct MainMenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuScreen()
    }
}
