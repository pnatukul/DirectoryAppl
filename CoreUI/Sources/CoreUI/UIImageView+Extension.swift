//
//  UIImageView+Extension.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import UIKit

extension UIImageView {
   static public func createImageView() -> UIImageView {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
