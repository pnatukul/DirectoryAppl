//
//  MockRoomsUseCase.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import Foundation
import XCTest
import CoreNetwork
@testable import DirectoryApp

class MockRoomsUseCase: RoomsUseCase {
    var roomsRecords: [Room]?
    
   func execute() async throws -> [Room] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    
    func enqueueRoomsRecords(roomsRecords: [Room]) {
        self.roomsRecords = roomsRecords
    }
}
