//
//  String+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import UIKit

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
        if let formattedDate = dateFormatter.date(from: self) {
            return formattedDate
        }
        let currentDate = Date()
        return currentDate
    }
}
