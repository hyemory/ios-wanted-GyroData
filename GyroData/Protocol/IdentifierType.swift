//
//  IdentifierType.swift
//  GyroData
//
//  Created by Hyejeong Jeong on 2023/06/13.
//

import UIKit

protocol IdentifierType { }

extension IdentifierType {
    public static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdentifierType { }
