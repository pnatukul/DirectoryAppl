//
//  PeopleViewModel.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import CoreNetwork

final class PeopleViewModel: PeopleViewModelOutput {

    private var peopleUseCase: PeopleUseCase
    private weak var coordinator: Coordinator?
    var peoples: [People] = []
    weak var view: PeoplesViewBehaviour?
    
    init(peopleUseCase: PeopleUseCase,
         coordinator: AppCoordinator) {
        self.peopleUseCase = peopleUseCase
        self.coordinator = coordinator
    }
}

extension PeopleViewModel: PeopleViewModelAction {
    func navigateToDetails(for index: Int) {
        coordinator?.navigateToPeopleDetails(people: peoples[index])
    }
}

extension PeopleViewModel: PeopleViewModelInput {
    
    func getPeopleImage(for index: Int, completion:@escaping (Data) -> Void)  {
        Task {
            do {
                let imageData =  try await peopleUseCase.getImage(for:peoples[index].avatar)

                DispatchQueue.main.async {
                    completion(imageData)
                }
            }catch {
                
            }
        }
    }
    
    func getPeoples() async {
        view?.showActivityIndicator()
        do {
            peoples = try await  peopleUseCase.execute()
            view?.hideActivityIndicator()
            view?.applySnapshot(animatingDifferences: true)
        } catch {
            view?.hideActivityIndicator()
            view?.showError(message: (error as! APIError).localizedDescription)
        }
    }
}

