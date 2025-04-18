//
//  Mockable.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> (data: Data, model: T)
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> (data: Data, model: T) {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }

        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)

            return (data, decodedObject)
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }
}
