//
//  UICollectionView+Extensions.swift
//  QuotesPranjal
//
//  Created by ebpearls on 30/06/2023.
//

import UIKit

extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
                fatalError(" Could not dequeue cell with identifier: \(T.identifier)")
            }
            return cell
        }

    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
       }
}



