//
//  NetworkManagerSampleTests.swift
//  NetworkManagerSampleTests
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Testing
@testable import NetworkManagerSample
import Foundation

struct NetworkManagerSampleTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test func getUsers() async throws {
        let serviceMock = UserServiceMock()
        let result = await serviceMock.getUsers()
        switch result {
        case .success(let response):
            #expect(response.model.count > 0)
            #expect(response.model.first?.name == "Leanne Graham")
        case .failure:
            Issue.record("Failed to load users")
        }
    }
    @Test func getUserDetails() async throws {
        let serviceMock = UserServiceMock()
        let result = await serviceMock.getUserDetail(id: 0)
        switch result {
        case .success(let response):
            #expect(response.model.id != 0)
            #expect(response.model.name == "Glenna Reichert")
        case .failure:
            Issue.record("Failed to load user details")
        }
    }
}

final class UserServiceMock: Mockable, UserServiceable {
    func getUsers() async -> Result<NetworkManagerSample.Response<[NetworkManagerSample.User]>, NetworkManagerSample.CustomError> {
        let result = loadJSON(filename: "users", type: [NetworkManagerSample.User].self)
        return .success(Response(data: result.data, model: result.model))
    }
    
    func getUserDetail(id: Int) async -> Result<NetworkManagerSample.Response<NetworkManagerSample.User>, NetworkManagerSample.CustomError> {
        let result = loadJSON(filename: "user", type: NetworkManagerSample.User.self)
        return .success(Response(data: result.data, model: result.model))
    }
}
