//
//  Date+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

extension Date {
    
    func toString(formatType: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = formatType
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: self)
    }
}
