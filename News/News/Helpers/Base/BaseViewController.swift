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
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navbarTitleColor]
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        /*
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))
        self.navigationItem.setLeftBarButton(doneItem, animated: true)
        self.navigationItem.titleView?.backgroundColor = UIColor.red
        self.navigationItem.leftBarButtonItem?.title = title
        */
    }
    
    @objc func done() { // remove @objc for Swift 3

    }
}
