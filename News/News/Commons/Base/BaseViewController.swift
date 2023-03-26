//
//  BaseViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        hideKeyboardWhenCicked()
    }
    
    private func setupViewController() {
        self.view.backgroundColor = UIColor.viewBGColour
    }
    
    public func setNavigationBarItems(title: String) {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navbarTitleColor,
            NSAttributedString.Key.font: UIFont.navbarTitleFont
        ]
        
        self.navigationItem.title = title
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
}
