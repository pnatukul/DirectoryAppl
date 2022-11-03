//
//  RoomsViewModel.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import CoreNetwork

final class RoomsViewModel: RoomsViewModelOutput {
    
    private var roomsUseCase: RoomsUseCase

    internal var rooms: [Room] = []

    weak var view: RoomsViewBehaviour?

    init(roomsUseCase: RoomsUseCase) {
        self.roomsUseCase = roomsUseCase
    }
}

extension RoomsViewModel: RoomsViewModelInput {
    func getRooms() async {
        view?.showActivityIndicator()
        do {
            rooms = try await  roomsUseCase.execute()
            view?.hideActivityIndicator()
            view?.updateSnap()
        } catch {
            view?.hideActivityIndicator()
            view?.showError(message: (error as? APIError)?.localizedDescription ?? "error")
        }
    }
}
