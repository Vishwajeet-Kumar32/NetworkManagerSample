//
//  Response.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import Foundation
/// Response contains raw data with generic model
public struct Response<T: Decodable> {
    public var data: Data
    public var model: T
}
