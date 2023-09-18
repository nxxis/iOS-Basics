//
//  TableView+Extensions.swift
//  quotesSudip
//
//  Created by ebpearls on 30/06/2023.
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
