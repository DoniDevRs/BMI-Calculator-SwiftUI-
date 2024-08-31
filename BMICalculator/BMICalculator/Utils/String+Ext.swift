//
//  String+Ext.swift
//  BMICalculator
//
//  Created by Doni Silva on 30/08/24.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
