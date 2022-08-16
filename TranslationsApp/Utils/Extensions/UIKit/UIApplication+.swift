//
//  UIApplication+.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import UIKit

extension UIApplication {
    
    static var topViewController: UIViewController? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
    }
}
