//
//  NetworkManager.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

public protocol Networkable {
    func get(apiRequest:ApiRequestType) async throws -> Data
}

public class NetworkManager: Networkable {
    public init() {}
    public func get(apiRequest: ApiRequestType) async throws -> Data {
        guard let request = URLRequest.getURLRequest(for: apiRequest) else {
            throw APIError.requestFailed
        }
        do {
            let (data, _)  = try await URLSession.shared.data(for: request)
            return data
        } catch {
            throw APIError.invalidData
        }
    }
  
}
