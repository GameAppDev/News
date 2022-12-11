//
//  Contractable.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

@objc protocol PresenterToView: AnyObject {
    @objc optional func setNavBar(title: String)
}

@objc protocol ViewToPresenter: AnyObject {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewWillDisappear()
}

protocol PresenterToInteractor: AnyObject {
    func fetchData<T>(request: T)
}

protocol InteractorToPresenter: AnyObject {
    func setData<T>(data: T)
    func setError(error: BaseError)
}

@objc protocol PresenterToRouter: AnyObject { }

/*
extension PresenterToRouter {
    
    func showAlert(from navController: UINavigationController?, title: String? = "", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        navController?.present(alert, animated: true, completion: nil)
    }
}
*/
