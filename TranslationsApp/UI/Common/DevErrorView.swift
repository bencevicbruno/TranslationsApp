//
//  DevErrorView.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import SwiftUI

struct DevErrorView: View {
    
    var error: AppError
    
    var body: some View {
        VStack(spacing: 15) {
            Text(error.title)
                .font(.system(size: 32))
                .fontWeight(.bold)
            
            if let message = error.message {
                Text(message)
                    .font(.system(size: 32))
            }
        }
    }
}

struct DevErrorView_Previews: PreviewProvider {
    static var previews: some View {
        DevErrorView(error: AppError(title: "Dev Error", message: "This is just to test things"))
    }
}
