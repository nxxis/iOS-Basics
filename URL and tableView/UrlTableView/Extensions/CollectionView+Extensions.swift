//
//  CollectionView+Extensions.swift
//  UrlTableView
//
//  Created by ebpearls on 28/06/2023.
//

import UIKit

extension UICollectionView {
    func registerCollectionCell<T: UICollectionViewCell>(cell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueCollectionCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
        else {
            fatalError(" Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
}

