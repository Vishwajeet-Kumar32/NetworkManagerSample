//
//  UserEndpoint.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import VKNetworkManager

enum UserEndpoint {
    case users
    case userDetail(id: Int)
}

extension UserEndpoint: Endpoint {
    
    var baseUrl: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var path: String {
        switch self {
        case .users:
            return "users"
        case .userDetail(let id):
            return "users/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .users, .userDetail:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = ""
        switch self {
        case .users, .userDetail:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .users, .userDetail:
            return nil
        }
    }
}
