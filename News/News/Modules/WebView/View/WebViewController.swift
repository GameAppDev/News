//
//  WebViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    @IBOutlet private weak var webView: WKWebView!
    
    public var presenter: WebPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension WebViewController: PWebPresenterToView {
    
    func setupViews() {
        webView.backgroundColor = UIColor.clear
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "NEWS SOURCE".localized)
    }
    
    func loadWebView(url: URL?) {
        if let newsUrl = url {
            webView.load(URLRequest(url: newsUrl))
        }
    }
}
