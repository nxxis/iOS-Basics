//
//  TableView+Extensions.swift
//  DelegateAndMVC
//
//  Created by ebpearls on 01/06/2023.
//

import UIKit

// MARK: -  UITableView Extension
extension UITableView {
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    func dequeueCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError(" Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}



