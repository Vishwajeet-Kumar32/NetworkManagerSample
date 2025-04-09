//
//  UserService.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Foundation
import VKNetworkManager

protocol UserServiceable {
    func getUsers() async -> Result<Response<[User]>, CustomError>
    func getUserDetail(id: Int) async -> Result<Response<User>, CustomError>
}

struct UserService: HTTPClient, UserServiceable {
    func getUsers() async -> Result<Response<[User]>, CustomError> {
        return await Helper.decoded(sendRequest(endpoint: UserEndpoint.users), [User].self)
    }
    func getUserDetail(id: Int) async -> Result<Response<User>, CustomError> {
        return await Helper.decoded(sendRequest(endpoint: UserEndpoint.userDetail(id: id)), User.self)
    }
}
