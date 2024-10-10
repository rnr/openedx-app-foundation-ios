//
//  String+JSON.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//


import Foundation

public extension String {
    func jsonStringToDictionary() -> [String: Any]? {
        guard let jsonData = self.data(using: .utf8) else {
            return nil
        }
        
        guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []),
              let dictionary = jsonObject as? [String: Any] else {
            return nil
        }
        
        return dictionary
    }
}
