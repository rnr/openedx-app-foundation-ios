//
//  File.swift
//  OEXFoundation
//
//  Created by Anton Yarmolenka on 28/01/2025.
//

import SwiftUI

/// A protocol that represents an in-app purchase product. Use to create views and request info about product.
public protocol IAPProduct: Sendable {}

/// A protocol that represents information about an in-app purchase product. Like sku or product id in store.
public protocol IAPProductInfo: Sendable {}

public protocol IAPPurchaseResult: Sendable {
    var isSuccess: Bool { get }
    var receipt: String? { get }
    var error: Error? { get }
}

/// An error for provider
public enum IAPProductProviderError: Error {
    case noBlockToRequestInfo
}

/// A struct that provides methods for managing in-app purchase products and their information.
public struct IAPProductProvider<Product: IAPProduct, Info: IAPProductInfo>: Sendable {
    public typealias RequestInfoBlock = @Sendable (Product) async throws -> Info
    public typealias ProductBlock = @Sendable (Any) -> Product?
    
    private let requestBlock: RequestInfoBlock?
    private let productBlock: ProductBlock

    /// Initializes the provider with an async/await request block and a product block.
    /// - Parameters:
    ///   - request: An async/await function to request information for a product.
    ///   - product: A function to convert an `Any` type into a `Product`.
    public init(request: @escaping RequestInfoBlock, product: @escaping ProductBlock) {
        requestBlock = request
        productBlock = product
    }

    /// Converts an `Any` type into a `Product` using the provided product block.
    /// - Parameter object: The object to convert.
    /// - Returns: A `Product` instance.
    public func product(for object: Any) -> Product? {
        productBlock(object)
    }

    /// An async/await method to request information for a given product.
    /// - Parameter product: The product to request information for.
    /// - Returns: The requested `Info`.
    public func requestInfo(for product: Product) async throws -> Info {
        if let requestBlock {
            return try await requestBlock(product)
        }
        throw IAPProductProviderError.noBlockToRequestInfo
    }
}

/// A protocol that defines the requirements for an in-app purchase service.
/// Conforming types must operate on a specific type of `IAPProduct` and `IAPProductInfo`.
@MainActor
public protocol IAPServiceProtocol {
    associatedtype Product: IAPProduct
    associatedtype ProductInfo: IAPProductInfo
    
    /// The provider used to manage product and product information requests.
    var provider: IAPProductProvider<Product, ProductInfo> { get }
    
    /// Converts an `Any` type into a `Product` using the provider's product block.
    /// - Parameter object: The object to convert.
    /// - Returns: A `Product` instance.
    ///
    /// To retrieve value you can use `product(for:)` from `provider`.
    /// ```swift
    /// let product = provider.product(for: object)
    /// ```
    func product(for object: Any) -> Product?
    
    /// Initiates a purchase for the specified product.
    /// - Parameter product: The product to purchase.
    /// - Returns: An object that implement `IAPPurchaseResult` protocol.
    func buy(product: Product) -> IAPPurchaseResult
    
    /// Initiates a getting info for specified product.
    /// - Parameter object: The object to get purchasing info like price, accessibility and etc.
    /// - Returns: An object that implement `IAPProductInfo` protocol.
    ///
    /// In a service that will implement `IAPServiceProtocol` you can add a check to see if the given
    /// object is an `IAPProduct`, if not then you can call the `product(for:)` function. Example:
    /// ```swift
    ///     struct SomeProduct: IAPProduct {}
    ///     ....
    ///     if let product = object as? SomeProduct {
    ///         return try await provider.info(for: product)
    ///     } else if let product = product(for: object){
    ///         return try await provider.info(for: product)
    ///     }
    /// ```
    func info(for object: Any) async throws -> ProductInfo
    
    /// Returns a SwiftUI view for a given object.
    /// - Parameter object: The object to create a view for.
    /// - Returns: An `AnyView` instance representing the view for the object.
    func view(for object: Any) -> AnyView?
}
