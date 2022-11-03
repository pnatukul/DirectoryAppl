//
//  PeopleDetailsViewModel.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol PeopleDetailsContract {
    var people: People { get }
}

final class PeopleDetailsViewModel: PeopleDetailsContract {
    
    var people: People
    init(people: People) {
        self.people = people
    }
    
}
    
