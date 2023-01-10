//
//  ListNewsTableView.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.12.2022.
//

import UIKit

final class ListNewsTableView: NSObject {
    
    private let presenter: PListConnectorToPresenter?
    
    init(presenter: PListConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension ListNewsTableView: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getNews().count ?? 0)
    }
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.className,
                                                           for: indexPath) as? NewsTableViewCell
        else { return UITableViewCell() }

        if let news = presenter?.getNews(),
           let searchedNews = news[safe: indexPath.row] {
                newsCell.configureCell(news: searchedNews)
        }

        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.handleDetail(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !(presenter?.getBusyStatus() ?? true) && (presenter?.getNews().count == indexPath.row + 1) {
            presenter?.handleNews(isNewSearch: false)
        }
    }
    
    // MARK: - Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let searchBarView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SearchBarHeaderView.className) as? SearchBarHeaderView
        else { return UIView() }
        
        searchBarView.configureView(delegate: self)
        
        return searchBarView
    }
    
    // MARK: - Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let buttonView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PrimaryButtonFooterView.className) as? PrimaryButtonFooterView
        else { return UIView() }
        
        buttonView.configureCell(delegate: self, buttonTitle: "Fav News".localized)
        
        return buttonView
    }
}

extension ListNewsTableView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debugPrint("searchText: \(searchText)")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter?.setSearchedKey(text: searchBar.searchTextField.text ?? "")
        presenter?.handleNews(isNewSearch: true)
    }
}

extension ListNewsTableView: PrimaryButtonDelegate {
    
    func primaryButtonClicked() {
        presenter?.handleFavNews()
    }
}
