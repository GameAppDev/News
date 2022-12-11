//
//  BaseViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

class BaseViewController: UIViewController {

    private var activityView: ActivityView?
    
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
        
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navbarTitleColor,
            NSAttributedString.Key.font: UIFont.navbarTitleFont
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
    public func setActivityIndicator(isOn: Bool, message: String? = nil) {
        DispatchQueue.main.async { [unowned self] in
            if isOn {
                activityView = ActivityView(frame: self.view.frame, message: message)
                view.addSubview(activityView!)
            }
            else {
                if (activityView != nil) && (activityView?.activity != nil) {
                    activityView?.activity.stopAnimating()
                    activityView?.removeFromSuperview()
                }
            }
        }
    }
}
