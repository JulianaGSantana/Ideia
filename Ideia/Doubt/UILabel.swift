//
//  UILabel.swift
//  Ideia
//
//  Created by Juliana Santana on 26/07/21.
//

import Foundation
import UIKit

public extension UILabel {
    func edgeTo(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
