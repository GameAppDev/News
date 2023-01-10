//
//  String+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
        
        guard let formattedDate = dateFormatter.date(from: self) else { return nil }
        
        return formattedDate
    }
    
    func toDouble() -> Double? {
        guard let value = Double(self) else { return nil }
        return value
    }
    
    func getCharacter(index: Int) -> String? {
        guard self.count >= index else { return nil }
        return String(prefix(index))
    }
}
