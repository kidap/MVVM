//
//  CollectionReusableView.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/26/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    //MARK:- IBOutlets
    @IBOutlet var label: UILabel!
    @IBOutlet var countLabel: UILabel!

    //MARK:- Static constants
    static let reuseIdentifier = "CollectionReusableView"
    static let nibName = "CollectionReusableView"


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
