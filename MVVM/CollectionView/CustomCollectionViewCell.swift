//
//  CustomCollectionViewCell.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/26/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    //MARK:- IBOutlets
    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var acceptButton: UIButton!
    @IBOutlet var declineButton: UIButton!
    @IBOutlet var containerView: UIView!
    @IBOutlet var buttonContainerView: UIView!

    typealias OnAction = () -> ()
    var onAccept: OnAction?
    var onDecline: OnAction?

    //MARK:- Static constants
    static let reuseIdentifier = "CustomCollectionViewCell"
    static let nibName = "CustomCollectionViewCell"
    static let acceptColor = UIColor.myGreen
    static let declineColor = UIColor.myRed

    var isActionEnabled: Bool = true {
        didSet {
            buttonContainerView.isHidden = !isActionEnabled
            acceptButton.isHidden = !isActionEnabled
            declineButton.isHidden = !isActionEnabled
        }
    }

    //MARK:- Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.makeRound()
        acceptButton.makeRound(withBorderColor: CustomCollectionViewCell.acceptColor)
        declineButton.makeRound(withBorderColor: CustomCollectionViewCell.declineColor)
        declineButton.tintColor = CustomCollectionViewCell.declineColor

        acceptButton.backgroundColor = CustomCollectionViewCell.acceptColor
        acceptButton.setTitleColor(.black, for: .normal)
        declineButton.setTitleColor(CustomCollectionViewCell.declineColor, for: .normal)

    }

    //MARK:- IBActions
    @IBAction func acceptOrder(_ sender: Any) {
        onAccept?()
    }

    @IBAction func declineOrder(_ sender: Any) {
        onDecline?()
    }

}
