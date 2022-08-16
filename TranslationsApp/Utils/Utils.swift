//
//  Utils.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 29.04.2022..
//

import Foundation

func debug(_ message: String) {
    #if DEBUG
    print(message)
    #endif
}

func debugError(_ message: String, _ fileName: String = #file, _ lineNumber: Int = #line) {
    debug("[\(fileName)@\(lineNumber)]: \(message)")
}
