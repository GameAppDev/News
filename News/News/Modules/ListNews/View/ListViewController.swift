//
//  ListViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

class ListViewController: UIViewController {

    public var presenter: ListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }

}
