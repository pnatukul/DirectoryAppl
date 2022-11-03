//
//  UIStackView+Extension.swift
//  DirectoryApp
//
//  Created by Pradeepthi N on 02/11/2022.
//

import Foundation
import UIKit

extension UIStackView {
    static public func createStackView(axis:NSLayoutConstraint.Axis = .vertical,
                                       alignment: UIStackView.Alignment = .fill,
                                       distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = alignment
        stackView.spacing = 10.0
        stackView.distribution = distribution
        return stackView
    }
}
