//
//  Helper.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import VKNetworkManager
import Foundation

struct Helper {
    
    /// This is generic function that convert the json object to the  requested type model object
    static func decoded<T: Decodable>(_ result: Result<Data, NetworkError>, _ responseModel: T.Type)
    async -> Result<Response<T>, CustomError> {
        switch result {
        case .success(let responseData):
            guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: responseData) else {
                return .failure(.decode)
            }
            let respone = Response(data: responseData, model: decodedResponse)
            return .success(respone)
        case .failure(let error):
            return .failure(.networkError(error))
        }
    }

}
