//
//  AppCoordinator.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import UIKit
import CoreNetwork

protocol Coordinator: AnyObject {
    func start()
    func navigateToPeople()
    func navigateToRooms()
    func navigateToPeopleDetails(people: People)
}

final class AppCoordinator: Coordinator {
    private var navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let homeViewController = HomeViewController(homeViewModel: HomeViewModel(), coordinator: self)
         navController.viewControllers = [homeViewController]
    }
        
    func navigateToPeople() {
        
        let networkManager = NetworkManager()
        let defualtPeopleRepository = DefaultPeopleRepository(networkManager: networkManager)
        let peopleUseCase = DefaultPeopleUseCase(peoplesRepository: defualtPeopleRepository)
        let peopleViewModel = PeopleViewModel(peopleUseCase: peopleUseCase, coordinator: self)
        
        let peopleVC = PeoplesViewController(viewModel: peopleViewModel)
        
        peopleViewModel.view = peopleVC
        
        navController.pushViewController(peopleVC, animated: false)
        }
    
    func navigateToRooms() {
        
        let networkManager = NetworkManager()
        let defualtRoomsRepository = DefaultRoomsRepository(networkManager: networkManager)
        let roomsUseCase = DefaultRoomsUseCase(roomsRepository: defualtRoomsRepository)
        
        let roomsViewModel = RoomsViewModel(roomsUseCase: roomsUseCase)
        
        let roomsVC = RoomsViewController(viewModel: roomsViewModel)
           
        roomsViewModel.view = roomsVC
        
        navController.pushViewController(roomsVC, animated: false)
    }
    
    func navigateToPeopleDetails(people: People) {
        
        let peopleDetailsVeiwModel = PeopleDetailsViewModel(people: people)
        
        let peopleDetailsVC = PeopleDetailsViewController(peopleDetailsViewModel: peopleDetailsVeiwModel)
                   
        navController.pushViewController(peopleDetailsVC, animated: true)
    }

}
