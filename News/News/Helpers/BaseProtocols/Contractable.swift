//
//  Contractable.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

// MARK: - PresenterToView
@objc protocol PresenterToView: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
    func showAlert(message: String)
    @objc optional func setNavBar(title: String)
}

extension UIViewController: PresenterToView {
    
    func showIndicatorView() {
        ActivityIndicatorManager.shared.showIndicator()
    }
    
    func hideIndicatorView() {
        ActivityIndicatorManager.shared.hideIndicator()
    }
    
    func showAlert(message: String) {
        AppRouter.shared.showAlert(message: message)
    }
}

// MARK: - ViewToPresenter
@objc protocol ViewToPresenter: AnyObject {
    func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillDisappear()
    @objc optional func viewDidDisappear()
}

// MARK: - PresenterToInteractor
protocol PresenterToInteractor: AnyObject {
    func fetchData<T>(request: T)
}

// MARK: - InteractorToPresenter
protocol InteractorToPresenter: AnyObject {
    func setData<T>(data: T)
    func setError(error: BaseError)
}

// MARK: - PresenterToRouter
protocol PresenterToRouter: AnyObject { }

// MARK: - ConnectorToPresenter
protocol ConnectorToPresenter: AnyObject { }
