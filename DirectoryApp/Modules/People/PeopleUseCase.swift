//
//  PeopleUseCase.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol PeopleUseCase {
    func execute() async throws -> [People]
    func getImage(for url: String) async throws -> Data
}

final class DefaultPeopleUseCase {
    private var peoplesRepository: PeoplesRepository

    init(peoplesRepository: PeoplesRepository) {
        self.peoplesRepository = peoplesRepository
    }
}

extension DefaultPeopleUseCase: PeopleUseCase {
    func getImage(for url: String) async throws -> Data {
        do {
            return  try await peoplesRepository.getImages(for: url)
        } catch {
            throw error
        }
    }
    
    func execute() async throws -> [People] {
        do {
            return try await peoplesRepository.getPeoples()
        } catch {
          throw error
        }
    }
}
