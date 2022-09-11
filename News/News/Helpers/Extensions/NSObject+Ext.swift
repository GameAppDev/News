//
//  NSObject+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
