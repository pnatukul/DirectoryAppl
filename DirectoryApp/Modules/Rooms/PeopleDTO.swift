//
//  ImagesResponse.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

// MARK: - PeopleResponce
struct PeopleDTO: Codable {
    
    var createdAt: String?
    var firstName: String?
    var avatar: String?
    var lastName: String?
    var email: String?
    var jobTitle: String?
    var favouriteColor: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey{
        case createdAt,firstName,avatar,email,lastName,favouriteColor,id
        case jobTitle = "jobtitle"
    }
}

// MARK: - Mappings to Domain

extension PeopleDTO {
    func toDomain() -> People {
        return People(firstName: firstName ?? "", avatar: avatar ?? "", lastName: lastName ?? "", email: email ?? "", jobTitle: jobTitle ?? "", joinedDate: createdAt ?? "")
    }
}
