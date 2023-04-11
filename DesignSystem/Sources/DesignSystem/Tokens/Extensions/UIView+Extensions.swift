//
//  UIView+Extensions.swift
//  
//
//  Created by Elen Souza on 09/04/23.
//

import UIKit

extension UIView {
    func shadow(level: Shadow) {
        self.layer.shadowOffset = level.offset
        self.layer.shadowRadius = level.blur
    }
}
