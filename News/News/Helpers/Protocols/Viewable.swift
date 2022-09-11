//
//  Viewable.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import UIKit

protocol Viewable: AnyObject {
    
    func push(_ vc: UIViewController, animated: Bool)
    
    func present(_ vc: UIViewController, animated: Bool)
}

extension Viewable where Self: UIViewController {

    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    func push(_ vc: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }

    func present(_ vc: UIViewController, animated: Bool) {
        self.present(vc, animated: animated, completion: nil)
    }
}
