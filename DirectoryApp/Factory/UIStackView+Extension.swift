//
//  UIStackView+Extension.swift
//  DirectoryApp
//
//  Created by  Mohammad on 04/08/22.
//

import Foundation
import UIKit

extension UIStackView {
    static func createStackView(axis:NSLayoutConstraint.Axis = .vertical,
                                alignment: UIStackView.Alignment = .fill,
                                distribution: UIStackView.Distribution = .fill
    )-> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = alignment
        stackView.spacing = 10.0
        stackView.distribution = distribution
        return stackView
    }
}
