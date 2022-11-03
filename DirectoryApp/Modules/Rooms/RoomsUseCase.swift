//
//  RoomsUseCase.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.

import Foundation

protocol RoomsUseCase {
    func execute() async throws -> [Room]
}

final class DefaultRoomsUseCase {
    private var roomsRepository: RoomsRepository

    init(roomsRepository: RoomsRepository) {
        self.roomsRepository = roomsRepository
    }
}

extension DefaultRoomsUseCase: RoomsUseCase {
    func execute() async throws -> [Room] {
        do {
            return try await roomsRepository.getRooms()
        } catch {
          throw error
        }
    }
}
