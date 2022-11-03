//
//  RoomRecord.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

struct Room: Hashable {
    var createdAt: String
    var occupiedMessage: String
    var maxOccupancy: Int
    var id: String
}
