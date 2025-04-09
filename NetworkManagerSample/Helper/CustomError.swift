//
//  CustomError.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import VKNetworkManager

/// Custom and network errors
public enum CustomError: Error {
    case networkError(NetworkError)
    case notRechable
    case decode
    case emptyToken
    case generic(String)

    public var message: String {
        switch self {
        case .networkError(let networkError):
            switch networkError {
            case .invalidURL:
                return "Invalid url"
            case .noResponse:
                return "No response"
            case .unauthorized:
                return "Un-authorized"
            case .unexpectedStatusCode:
                return "Unexpected status code"
            case .unknown(let text):
                return text
            }
        case .notRechable:
            return "Not reachable"
        case .decode:
            return "Decode error"
        case .emptyToken:
            return "Empty token"
        case .generic(let text):
            return text
        }
    }
}
