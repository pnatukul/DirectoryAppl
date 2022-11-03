//
//  URLRequest+Extension.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

extension URLRequest {
    
    public static func getURLRequest(for apiRequest:ApiRequestType) -> URLRequest? {
        if let url = URL(string:apiRequest.baseUrl.appending(apiRequest.path)),
           let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            let urlRequest = URLRequest(url: urlComponents.url!)
            return urlRequest
        } else {
            return nil
        }
    }
}
