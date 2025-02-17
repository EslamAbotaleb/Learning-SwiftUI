//
//  HTTPClient.swift
//  NetworkManager
//
//  Created by Eslam on 13/02/2025.
//

import Foundation
import Combine

protocol HTTPClient {
    func publisher(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error>
}
extension URLSession: HTTPClient {

    struct InvalidHTTPResponseError: Error {}
    //MARK: - This for Any Data & HTTPResponseURL
    func publisher(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error> {
        return dataTaskPublisher(for: request)
            .tryMap { result in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw InvalidHTTPResponseError()
                }
                return (result.data, httpResponse)
            }
            .eraseToAnyPublisher()
    }
}

//MARK: - Will define the token flow
protocol TokenProvider {
    func tokenPublisher() -> AnyPublisher<AuthenticationJWTDTO, Error>
}
enum LoginState {
    case loggedOut
    case loggedIn
}
/// Access Token
/// This can be used inside SwiftUI || UIKit
class AuthenticatedHTTPClientDecorator: HTTPClient {
    let client: HTTPClient
    let tokenProvider: TokenProvider
    let needsAuth = PassthroughSubject<Void,Never>()
//    var needsAuth: (() -> Void)?

    init(client: HTTPClient, tokenProvider: TokenProvider) {
        self.client = client
        self.tokenProvider = tokenProvider
    }
    /// Access Token 
    func publisher(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), any Error> {
       return tokenProvider
            .tokenPublisher()
            .map {
                token in
                var signedRequest = request
                signedRequest.allHTTPHeaderFields?.removeValue(forKey: "Authorization")
                signedRequest.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
                return signedRequest
            }
            .flatMap(client.publisher)
            .handleEvents(receiveCompletion: { [needsAuth] completion in
                if case let Subscribers.Completion<Error>.failure(error) = completion {
//                    needsAuth?()
                    needsAuth.send(())
                }
            })
            .eraseToAnyPublisher()
    }
}
