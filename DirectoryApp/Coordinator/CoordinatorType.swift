//
//  CoordinatorType.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
