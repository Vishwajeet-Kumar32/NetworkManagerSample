//
//  User.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Foundation

@MainActor class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var showingAlert = false
    @Published var alertMessage = ""
    
    let service: UserServiceable
    init(service: UserServiceable) {
        self.service = service
    }
    
    func getUsers() {
        Task {
            let result = await service.getUsers()
            switch result {
            case .success(let response):
                self.users = response.model
            case .failure(let error):
                showingAlert = true
                alertMessage = error.message
            }
        }
    }
    
    func isValidUrl(url: String) -> Bool {
        let regEx = "http[s]?://(([^/:.[:space:]]+(.[^/:.[:space:]]+)*)|([0-9](.[0-9]{3})))(:[0-9]+)?((/[^?#[:space:]]+)([^#[:space:]]+)?(#.+)?)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
        return predicate.evaluate(with: url)
    }
}


