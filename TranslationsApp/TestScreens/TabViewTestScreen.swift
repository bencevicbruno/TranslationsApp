//
//  TabViewTestScreen.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 13.04.2022..
//

import SwiftUI

enum Tab: CaseIterable, Identifiable {
    case home
    case inbox
    case profile
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .home:
            return "House"
        case .inbox:
            return "Inbox"
        case .profile:
            return "Profile"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .inbox:
            return "envelope"
        case .profile:
            return "person"
        }
    }
    
    var tabSystemImageName: String {
        switch self {
        case .home:
            return "house"
        case .inbox:
            return "envelope"
        case .profile:
            return "person"
        }
    }
}

struct TabViewTestScreen: View {
    
    @State private var tab = Tab.home
    @State private var toggle = false
    
    var body: some View {
#if os(macOS)
        VStack {
            Text("sidebar")
            HSplitView {
                Text("Primary View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)
                Text("Detail Panel")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red)
            }
        }
            
        #else
            TabView(selection: $tab) {
                ForEach(Tab.allCases) { tab in
                    tabContent(tab)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Toggle(isOn: $toggle) {
                        Image(systemName: "house")
                    }
                }
            }
            #endif
    }
    
    func tabContent(_ tab: Tab) -> some View {
        VStack {
            Text(tab.title)
            Image(systemName: tab.systemImageName)
        }
        .background(.yellow)
        .tag(tab)
        .tabItem {
            Group {
                Image(systemName: tab.tabSystemImageName)
                    .resizable()
                    .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)
                Text(tab.title)
            }
            .background(.red)
        }
        .foregroundColor(.white)
    }
}

struct TabViewTestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTestScreen()
    }
}
