//
//  CustomFlowLayout.swift
//  TableViewCollectionLayout
//
//  Created by Karlo Pagtakhan on 06/16/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    private let spaceBetweenCells: CGFloat = 8
    var numberOfColumns: CGFloat = 1

    override func prepare() {
        super.prepare()

        guard let cv = collectionView else { return }

        let usableWidth = cv.frame.width - cv.safeAreaInsets.left - cv.safeAreaInsets.right
        let widthPerItem = (usableWidth - (spaceBetweenCells * (numberOfColumns - 1 + 2))) / numberOfColumns

        minimumLineSpacing = spaceBetweenCells
        minimumInteritemSpacing = spaceBetweenCells
        itemSize = CGSize(width: widthPerItem, height: 130)
        sectionInset = UIEdgeInsets(top: spaceBetweenCells, left: spaceBetweenCells, bottom: spaceBetweenCells, right: spaceBetweenCells)
        headerReferenceSize = CGSize(width: widthPerItem, height: 50)
    }
}
  
