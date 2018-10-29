//
//  ViewController+Private.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/27/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

//MARK:- Private methods
extension OnlineOrdersViewController {

    func setupNavigationController() {
    }

    func setupCollectionView() {
        collectionView.setCollectionViewLayout(CustomFlowLayout(), animated: false)
        collectionView.register(UINib(nibName: CustomCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: CollectionReusableView.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.reuseIdentifier)
    }
}
