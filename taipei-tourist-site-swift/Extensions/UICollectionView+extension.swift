//
//  UICollectionView+extension.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/31.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.className
        if Bundle.main.path(forResource: className, ofType: "nib") != nil {
            // register for nib
            let nib = UINib(nibName: className, bundle: nil)
            register(nib, forCellWithReuseIdentifier: className)
        } else {
            // register for class
            register(cellType, forCellWithReuseIdentifier: className)
        }
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
