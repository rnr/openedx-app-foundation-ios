//
//  Dictionary+JSON.swift
//  OExFoundation
//
//  Created by Ivan Stepanok on 07.10.2024.
//


import Foundation

public extension Dictionary where Key == String, Value == String {
    func toJson() -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []) else {
            return nil
        }

        return String(data: jsonData, encoding: .utf8)
    }
}