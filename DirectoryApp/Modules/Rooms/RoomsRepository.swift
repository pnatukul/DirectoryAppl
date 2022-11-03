//
//  RoomsRepository.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol RoomsRepository {
    func getRooms() async throws -> [Room]
}
