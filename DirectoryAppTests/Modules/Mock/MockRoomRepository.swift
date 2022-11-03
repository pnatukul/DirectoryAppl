//
//  MockRoomRepository.swift
//  DirectoryAppTests
//
//  Created by Pradeepthi N on 03/11/2022.
//

import Foundation
import CoreNetwork
@testable import DirectoryApp

final class MockRoomRepository: RoomsRepository {
    
    var roomsRecords: [Room]?

    func getRooms() async throws -> [Room] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    
    func enqueueRoomsRecords(roomsRecords: [Room]) {
        self.roomsRecords = roomsRecords
    }
}
