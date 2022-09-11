//
//  CGFloat+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import UIKit

extension CGFloat {
    
    var ws: CGFloat {
        return (self / 320) * UIScreen.main.bounds.width
    }
    
    var hs: CGFloat {
        return (self / 568) * UIScreen.main.bounds.height
    }
}
