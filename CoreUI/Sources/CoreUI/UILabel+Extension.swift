//
//  UILabel+Extension.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import UIKit

extension UILabel {
    static public func createLabel(text: String = "")-> UILabel {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textAlignment = .center
         label.numberOfLines = 0
         label.text = text
         return label
    }
}
