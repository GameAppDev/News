//
//  Routerable.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

protocol Routerable {
    
    var navigationController: UINavigationController? { get set }

    func pushVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool)
    
    func presentVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool)
}

extension Routerable {
    
    func pushVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool) {
        navController?.pushViewController(vc, animated: animated)
    }
    
    func presentVC(_ vc:UIViewController, navController: UINavigationController?, animated: Bool) {
        navController?.present(vc, animated: animated)
    }
}

