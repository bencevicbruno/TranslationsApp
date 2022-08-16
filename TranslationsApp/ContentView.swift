//
//  ContentView.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 13.04.2022..
//

import SwiftUI


var listItems = ["Item 1", "Item 2", "Item 3", "Item 4"]
var secondItems = ["Second 1", "Second 2", "Second 3", "Second 4"]

struct ContentView: View {
    let api_key = "AIzaSyDEDdyIRrbbIzvzlnrD3P0u0zmS4VbDBoY"
    
    
    @State var select: String? = "Item 1"
    var body: some View
    {
        VStack
        {
            NavigationView
            {
                List
                {
                    ForEach((0..<listItems.count), id: \.self)
                    {index in
                        NavigationLink(destination: SecondView(), tag: listItems[index], selection: $select)
                        {
                            Text(listItems[index])
                                .padding(.vertical, 2.0)
                        }
                    }
                    Spacer()
                    
                }.frame(width:160)
                    .listStyle(SidebarListStyle())
            }
            
            .toolbar
            {
                Text("this is not the title")
                Button(action: {})
                {
                    Label("Upload", systemImage: "square.and.arrow.up")
                }
            }
            .navigationTitle("My Title")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

struct SecondView: View {

    var body: some View {
        NavigationView {
            List
            {
                ForEach((0..<secondItems.count), id: \.self)
                {index in
                    NavigationLink(destination: Text(secondItems[index]))
                    {
                        Text(secondItems[index])
                            .frame(height: 20)
                    }
                }
            }.frame(width:150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
