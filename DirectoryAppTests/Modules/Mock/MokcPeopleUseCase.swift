//
//  MokcPeopleUseCase.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import Foundation
@testable import DirectoryApp
import XCTest
import CoreNetwork

class MokcPeopleUseCase: PeopleUseCase {
    
    var peoplesRecords: [People]?
    
    func execute() async throws -> [People] {
        
        if peoplesRecords == nil {
            throw  APIError.invalidData
        }
       return  peoplesRecords!
    }
    
    func getImage(for url: String) async throws -> Data {
        if url == "invalid" {
            throw  APIError.invalidData
        }
        return url.data(using: .utf8)!
    }
    
    func enqueuePeopelesRecords(peoplesRecords: [People]) {
        self.peoplesRecords = peoplesRecords
    }
}
