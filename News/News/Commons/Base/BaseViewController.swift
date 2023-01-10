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
        
        setupViews()
        hideKeyboardWhenCicked()
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.viewBGColour
    }
    
    public func setNavigationBarItems(title: String) {
        self.navigationItem.title = title
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navbarTitleColor,
                              NSAttributedString.Key.font: UIFont.navbarTitleFont]
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
}
