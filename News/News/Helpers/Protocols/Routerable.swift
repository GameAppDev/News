//
//  Routerable.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

protocol Routerable {
    
    var navigationController: UINavigationController? { get set }

    func pushVC(_ vc:UIViewController, animated: Bool)
    
    func presentVC(_ vc:UIViewController, animated: Bool)
}
