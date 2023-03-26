//
//  WebViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import UIKit
import WebKit

final class WebViewController: BaseViewController {

    // MARK: Outlets
    @IBOutlet private weak var webView: WKWebView!
    
    public var presenter: PWebViewToPresenter?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
    
    private func setupViewController() {
        webView.backgroundColor = UIColor.clear
        webView.configuration.allowsInlineMediaPlayback = false
    }
}

extension WebViewController: PWebPresenterToView {
    
    func setWebView(isHidden: Bool) {
        webView.isHidden = isHidden
    }
    
    func setWebView(url: URL?) {
        if let newsUrl = url {
            webView.load(URLRequest(url: newsUrl))
        }
    }
    
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
