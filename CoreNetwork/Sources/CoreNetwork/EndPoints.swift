//
//  EndPoints.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.

import Foundation

public struct EndPoint {
   public static let baseUrl = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
}

public enum Path: String {
    case rooms
    case people
}
