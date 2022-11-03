//
//  UIImageView+Extension.swift
//  DirectoryApp
//
//  Created by  Mohammad on 04/08/22.
//

import Foundation
import UIKit

extension UIImageView {
   static public func createImageView()-> UIImageView {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
