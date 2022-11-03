//
//  DefaultGalleryRepository.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import CoreNetwork

final class DefaultRoomsRepository {
        
    private let networkManager: Networkable
    
    init(networkManager:Networkable) {
        self.networkManager = networkManager
    }
    
    private func getDecodedResopnse(from data: Data) -> [RoomsDTO]? {
        guard let roomsResponceDTO = try? JSONDecoder().decode([RoomsDTO].self, from: data) else {
            return nil
        }
        return roomsResponceDTO
    }
}

extension DefaultRoomsRepository: RoomsRepository {
    func getRooms() async throws -> [Room] {
        let  apiRequest = ApiRequest(baseUrl: EndPoint.baseUrl, path:Path.rooms.rawValue, params: [:])
        
        guard let data = try? await  self.networkManager.get(apiRequest: apiRequest) else {
            throw APIError.invalidData
        }
        
        guard let roomsResponseDTO = getDecodedResopnse(from: data) else {
            throw APIError.jsonParsingFailed
        }
        
        let roomsRecords = roomsResponseDTO.map { $0.toDomain()}
        
        if roomsRecords.isEmpty {
            throw APIError.emptyRecords
        }
            
        return roomsRecords
    }
}
