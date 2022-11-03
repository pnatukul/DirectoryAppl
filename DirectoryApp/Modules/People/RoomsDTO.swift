//
//  RoomsResponseDTO.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

struct RoomsDTO: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}

// MARK: - Mappings to Domain

extension RoomsDTO {
    func toDomain() -> Room {
        return Room(createdAt:createdAt, occupiedMessage: isOccupied ? "Occupied" :"Not Occupied", maxOccupancy: maxOccupancy, id: id)
    }
}
