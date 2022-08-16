//
//  LoginScreen.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 13.04.2022..
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
             
                VStack {
                    Text("Welcome to TranslationsApp")
                    
                    TextField("Email", text: $viewModel.email)
                    
                    TextField("Password", text: $viewModel.password)
                    
                    Button("Login") {
                        viewModel.loginTapped()
                    }
                    .buttonStyle(.bordered)
                
                
            }
            .frame(minWidth: 200, maxWidth: 300).background(Color.red)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(viewModel: LoginViewModel())
    }
}
