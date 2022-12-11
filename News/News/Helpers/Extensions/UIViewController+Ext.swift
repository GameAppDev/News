//
//  UIViewController+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenCicked() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func getNavigationBarFrame() -> CGRect {
        let topSAInsets = navigationController?.view.safeAreaInsets.top ?? 0

        return .init(x: 0,
                     y: -topSAInsets,
                     width: navigationController?.navigationBar.bounds.width ?? 0,
                     height: (navigationController?.navigationBar.bounds.height ?? 0) + topSAInsets
        )
    }
}
