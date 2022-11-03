//
//  ServiceError.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

public enum APIError: Error {
    case emptyRecords
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailed
    case invalidSearch
    
    public var localizedDescription: String{
        switch self {
        case .emptyRecords:
            return NSLocalizedString("empty_response", comment:"")
        case .requestFailed:
            return NSLocalizedString("request_failed", comment:"")
        case .invalidData:
            return NSLocalizedString("invalid_data", comment:"")
        case .responseUnsuccessful:
            return NSLocalizedString("response_unsucessful", comment:"")
        case .jsonParsingFailed:
            return NSLocalizedString("parsing_failed", comment:"")
        case .invalidSearch:
            return NSLocalizedString("invalid_search", comment:"")
        }
    }
}
