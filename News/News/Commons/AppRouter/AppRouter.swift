//
//  AppRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 19.09.2022.
//

import UIKit

open class AppRouter: Routerable {
    
    public static let shared = AppRouter()
    
    private var navigationController: UINavigationController?
    
    public static var window: UIWindow {
        return appDelegate.window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    public func openApp() {
        let rootVC = ListRouter().returnVC()
        let navController = UINavigationController(rootViewController: rootVC)
        
        setActiveNavController(with: navController, isFirstTime: true)
    }
    
    public func changeNavigationController(with rootVC: UIViewController) {
        let navController = UINavigationController(rootViewController: rootVC)
        setActiveNavController(with: navController, isFirstTime: false)
    }
    
    public func getActiveNavigationController() -> UINavigationController? {
        return self.navigationController
    }
    
    private func setActiveNavController(with navCont: UINavigationController, isFirstTime: Bool = false) {
        navigationController?.popToRootViewController(animated: false)
        navigationController = nil
        
        navigationController = navCont
        
        AppRouter.window.rootViewController = navCont
        isFirstTime ? (AppRouter.window.makeKeyAndVisible()) : ()
    }
    
    // MARK: Routerable
    
    func pushVC(_ vc: UIViewController, animated: Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func presentVC(_ vc: UIViewController, animated: Bool) {
        navigationController?.present(vc, animated: animated)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Warning".localized, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK".localized, style: .cancel, handler: nil))
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
