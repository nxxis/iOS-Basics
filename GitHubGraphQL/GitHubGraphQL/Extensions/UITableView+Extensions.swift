//
//  UITableView+Extensions.swift
//  TableView
//
//  Created by ebpearls on 05/07/2023.
//

import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
            guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
                fatalError(" Could not dequeue cell with identifier: \(T.identifier)")
            }
            return cell
        }
    
    public func register<T: UITableViewCell>(cellClass: T.Type) {
           register(cellClass, forCellReuseIdentifier: T.identifier)
       }
}

