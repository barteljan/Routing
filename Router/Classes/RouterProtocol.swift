//
//  RouterProtocol.swift
//  Router
//
//  Created by bartel on 25.07.18.
//

public protocol RouterProtocol {
    
    /// Route to a new route presenting a view controller
    ///
    /// - Parameters:
    ///   - url: the route of the view controller to be presented
    ///   - option: how should your view controller be presented
    ///   - parameters: a dictionary of parameters (data) send to the presented view controller
    ///   - completion: function called when the view controller was presented
    /// - Throws: throws an error when no controller and/or option provider can be found.
    func route(url: URL,
               parameters: Any?,
               option: RoutingOption?) -> RoutingResponse
    
    
    func route(url: String,
               parameters: Any?,
               option: RoutingOption?) -> RoutingResponse

    
}

/// A message object describing how the view controller presented after routing will be presented
public protocol RoutingOption {
    func isEqual(otherOption: RoutingOption?) -> Bool
}

public indirect enum RoutingResponse {
    case routeNotFound(url: URL)
    case notAuthorized
    case redirected(response: RoutingResponse)
    case incorrectParameters
    case unknown(error: Error)
}
