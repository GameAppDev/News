//
//  Array+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

extension Array {
    
    subscript (safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
}
