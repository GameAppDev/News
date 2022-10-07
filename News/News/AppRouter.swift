//
//  AppRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 19.09.2022.
//

import Foundation
import UIKit

open class AppRouter {

    public static var shared = AppRouter()
    
    private var navigationController: UINavigationController?
    
    public static var window: UIWindow {
        return appDelegate.window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    
    public func openApp() {
        let rootVC = ListRouter().returnNC()
        
        setActiveNavController(with: rootVC, isFirstTime: true)
    }
    
    public func setActiveNavController(with navCont: UINavigationController, isFirstTime: Bool = false) {
        navigationController?.popToRootViewController(animated: false)
        navigationController = nil
        
        navigationController = navCont
        
        AppRouter.window.rootViewController = navCont
        isFirstTime ? (AppRouter.window.makeKeyAndVisible()) : ()
    }
    
    public func pushVC(_ vc: UIViewController, animated: Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    public func presentVC(_ vc: UIViewController, animated: Bool) {
        navigationController?.present(vc, animated: animated)
    }
}
