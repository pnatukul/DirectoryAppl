//
//  PeoplesContract.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol PeoplesViewBehaviour: AnyObject {
      func applySnapshot(animatingDifferences: Bool)
      func showError(message: String)
      func showActivityIndicator()
      func hideActivityIndicator()
}

protocol PeopleViewModelAction {
    func navigateToDetails(for index:Int)
}

protocol PeopleViewModelInput {
    func getPeoples() async
    func getPeopleImage(for index: Int, completion:@escaping (Data) -> Void)
}

protocol PeopleViewModelOutput {
    var peoples: [People] {get}
}
