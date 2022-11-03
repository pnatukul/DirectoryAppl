//
//  PeoplesRepository.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation

protocol PeoplesRepository {
   func getPeoples() async throws -> [People]
    func getImages(for url: String) async throws -> Data 
}

protocol ImageCacher {
    func getImage(url:String) -> Data?
    func saveImage(url:String, data:Data)
}
