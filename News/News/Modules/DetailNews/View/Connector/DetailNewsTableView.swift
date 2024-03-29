//
//  DetailNewsTableView.swift
//  News
//
//  Created by Oguzhan Yalcin on 12.12.2022.
//

import UIKit

final class DetailNewsTableView: NSObject {
    
    private let presenter: PDetailConnectorToPresenter?
    
    init(presenter: PDetailConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension DetailNewsTableView: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.className,
                                                                for: indexPath) as? DetailTableViewCell
        else { return UITableViewCell() }

        if let news = presenter?.getSelectedNews() {
            tableViewCell.configureCell(news: news)
        }

        return tableViewCell
    }
    
    // MARK: - Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PrimaryButtonFooterView.className) as? PrimaryButtonFooterView
        else { return UIView() }
        
        footerView.configureView(delegate: self, buttonTitle: "News Source".localized)
        
        return footerView
    }
}

extension DetailNewsTableView: PrimaryButtonDelegate {
    
    func primaryButtonClicked() {
        presenter?.handleWebView()
    }
}
