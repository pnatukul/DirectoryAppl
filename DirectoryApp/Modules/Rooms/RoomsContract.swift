//
//  RoomsContract.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol RoomsViewModelInput {
    var view: RoomsViewBehaviour? {get}
    func getRooms() async
}

protocol RoomsViewModelOutput {
      var rooms: [Room] {get}
}

protocol RoomsViewBehaviour: AnyObject {
      func updateSnap()
      func showError(message: String)
      func showActivityIndicator()
      func hideActivityIndicator()
}
