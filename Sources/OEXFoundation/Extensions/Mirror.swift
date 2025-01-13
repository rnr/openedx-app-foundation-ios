//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 13/01/2025.
//

import Foundation

public extension Mirror {
    // MARK: - Static
    
    /// Returns a variable by type via reflection.
    /// - Parameters:
    /// - target: The object to search for.
    /// - name: The name of the variable.
    /// - matchingType: The type of the variable
    //// - Returns: Found variable by type. Or nil if the search has no result.
    static func reflectProperty<T>(of target: Any, name: String, matchingType _: T.Type = T.self) -> T? {
        let wrapperName = "_\(name)"
        let searchNames: [String?] = [name, "$__lazy_storage_$_\(name)", wrapperName]
        var mirror: Mirror? = .init(reflecting: target)
        
        repeat {
            let children = mirror?.children ?? .init([])
            
            for child in children where searchNames.contains(child.label) {
                if child.label == wrapperName {
                    return reflectProperty(of: child.value, name: "wrappedValue")
                } else {
                    return child.value as? T
                }
            }
            
            mirror = mirror?.superclassMirror
        } while mirror != nil
        
        return nil
    }
}
