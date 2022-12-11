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
    
    var isNotEmpty: Bool {
        return !isEmpty
    }

    mutating func removeObject<T: Equatable>(_ object: T) {
        if let index = self.firstIndex(where: { $0 as? T == object }) {
            self.remove(at: index)
        }
    }
}
