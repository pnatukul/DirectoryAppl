//
//  MockPeopleRepository.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import Foundation
@testable import DirectoryApp
import CoreNetwork

final class MockPeopleRepository: PeoplesRepository {
    var peoplesRecords: [People]?

    func getPeoples() async throws -> [People] {
        if peoplesRecords == nil {
            throw  APIError.invalidData
        }
       return  peoplesRecords!
    }
    
    func getImages(for url: String) async throws -> Data {
        if url == "invalid" {
            throw  APIError.invalidData
        }
        return url.data(using: .utf8)!
    }
    
    func enqueuePeopelesRecords(peoplesRecords: [People]) {
        self.peoplesRecords = peoplesRecords
    }
}
