//
//  CollectionView.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)

        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            register(nib, forCellWithReuseIdentifier: cellName)
        } else {
            register(T.self, forCellWithReuseIdentifier: cellName)
        }
    }

    func dequeueCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T? {
        let cellName = String(describing: T.self)

        return dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? T
    }
}
