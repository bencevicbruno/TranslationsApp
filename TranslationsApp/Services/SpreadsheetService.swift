//
//  SpreadsheetService.swift
//  TranslationsApp
//
//  Created by Bruno Benčević on 19.04.2022..
//

import Foundation
import UIKit
import GoogleSignIn

final class SpreadsheetService {
    
    static let spreadsheetID = "10ZExCYEow9C2XaYdZKFIb1LNEUxX-vZamHCmjALkrEk"
    
    
    func fetchData(accessToken aToken: String) {
        let requiredScopes = ["https://www.googleapis.com/auth/drive.readonly"]
        
        guard let topViewController = UIApplication.topViewController else {
            print("topviewcontroller is nil")
            return
        }
        
        GIDSignIn.sharedInstance.addScopes(requiredScopes, presenting: topViewController) { user, error in
            if let error = error {
                print("error adding scopes: \(error)")
            }
            
            guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/\(Self.spreadsheetID)/values:batchGet") else {
                print("invalid spreadsheet url")
                return
            }
            
        
            var requestComponents = URLComponents(string: url.absoluteString)
            requestComponents?.queryItems = [
    //            .init(name: "", value: "")
                .init(name: "access_token", value: GIDSignIn.sharedInstance.currentUser!.authentication.accessToken),
                .init(name: "majorDimension", value: "ROWS"),
                .init(name: "ranges", value: "A1:C1")
            ]
            
            guard let finalURL = requestComponents?.url else {
                print("error creating final url")
                return
            }
            
            var request = URLRequest(url: finalURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("error handling request")
                    print(error)
                    return
                }
                
                if let data = data {
                    print("got data")
                    print(data)
                    
                    if let string = String(data: data, encoding: .utf8) {
                        print("i guess: \(string)")
                    }
                }
                
                if let response = response {
                    print("got response")
                    print(response)
                }
            }
            .resume()
        }
    }
    
    func writeData(data: [String], accessToken: String) {
        let requiredScopes = ["https://www.googleapis.com/auth/drive.readonly",
                              "https://www.googleapis.com/auth/spreadsheets"]
        
        guard let topViewController = UIApplication.topViewController else {
            print("topviewcontroller is nil")
            return
        }
        
        GIDSignIn.sharedInstance.addScopes(requiredScopes, presenting: topViewController) { user, error in
            if let error = error {
                print("error adding scopes: \(error)")
            }
            
            guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/\(Self.spreadsheetID)/values/A1:C1") else {
                print("invalid spreadsheet url")
                return
            }
            
        
            var requestComponents = URLComponents(string: url.absoluteString)
            requestComponents?.queryItems = [
    //            .init(name: "", value: "")
                .init(name: "access_token", value: GIDSignIn.sharedInstance.currentUser!.authentication.accessToken),
//                .init(name: "ValueInputOption", value: "RAW"),
                .init(name: "spreadsheetId", value: Self.spreadsheetID),
                .init(name: "range", value: "A1:C1"),
                .init(name: "includeValuesInResponse", value: "false"),
                .init(name: "responseDateTimeRenderOption", value: "FORMATTED_STRING"),
                .init(name: "responseValueRenderOption", value: "FORMATTED_VALUE"),
                .init(name: "valueInputOption", value: "RAW")
//                .init(name: "majorDimension", value: "ROWS"),
//                .init(name: "values", value: "[\"bruh\", \"cmon\", \"work\"]")
            ]
            
            guard let finalURL = requestComponents?.url else {
                print("error creating final url")
                return
            }
            
            struct Body: Codable {
                let majorDimension: String
                let range: String
                let values: [[String]]
            }
            
            let body = Body(majorDimension: "ROWS", range: "A1:C1", values: [["fast", "ez fak", "boi"]])
            
            var request = URLRequest(url: finalURL)
            request.httpMethod = "PUT"
            request.httpBody = try! JSONEncoder().encode(body)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("error handling request")
                    print(error)
                    return
                }
                
                if let data = data {
                    print("got data")
                    print(data)
                    
                    if let string = String(data: data, encoding: .utf8) {
                        print("i guess: \(string)")
                    }
                }
                
                if let response = response {
                    print("got response")
                    print(response)
                }
            }
            .resume()
        }
    }
}
