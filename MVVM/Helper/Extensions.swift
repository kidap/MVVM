//
//  Extensions.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/27/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit


extension Int64 {
    func toString() -> String {
        return String(self)
    }

    func formattedCurrency() -> String {
        let numberWithDecimal = self / 100
        return Formatter.numberFormatter.string(from: NSNumber(value: numberWithDecimal)) ?? "$0.00"
    }
}

extension UIView {
    func makeRound(withBorderColor borderColor: UIColor? = nil) {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        if let color = borderColor?.cgColor {
            layer.borderColor = color
        }
    }
}

extension UIColor {
    static var myYellow = UIColor(displayP3Red: 221/255, green: 221/255, blue: 119/255, alpha: 1.0)
    static var myGreen = UIColor(displayP3Red: 119/255, green: 221/255, blue: 119/255, alpha: 1.0)
    static var myRed = UIColor(red: 221/255, green: 119/255, blue: 119/255, alpha: 1.0)
}


struct Formatter {
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
}


extension String: Error {}
