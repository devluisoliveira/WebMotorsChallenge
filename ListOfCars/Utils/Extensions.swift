//
//  Extensions.swift
//  KabumChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 15/10/21.
//

import UIKit

extension UIView {
    // Add Shadow
    func addShadow() {
        self.layer.shadowColor      = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4).cgColor
        self.layer.shadowOpacity    = 1.0
        self.layer.shadowOffset     = CGSize.init(width: 0.0, height: 0.0)
        self.layer.shadowRadius     = 2.0
    }
    
    // Add Shadow Border and Corner
    func addShadowAndBorderAndCorner() {
        self.addShadow()
        self.layer.cornerRadius = 8.0
    }
}

extension String {
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "R$ "
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = "."
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // Remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // If first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        return formatter.string(from: number)!
    }
}
