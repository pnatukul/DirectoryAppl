//
//  HomeViewModel.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol HomeViewModelContract {
    var numberOfItems: Int { get }
    func getDirectory(for index:Int) -> Directory
}

final class HomeViewModel: HomeViewModelContract {
    
    let directoreis: [Directory] = [Directory(name:NSLocalizedString("peoples", comment: "") , iconName: "people"), Directory(name: NSLocalizedString("rooms", comment: ""), iconName: "room")]
    
    var numberOfItems: Int {
        return directoreis.count
    }
    
    func getDirectory(for index:Int) -> Directory {
        return directoreis[index]
    }
}
