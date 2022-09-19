//
//  ListViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

class ListViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
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

extension ListViewController: PListPresenterToView {
    
    func setupViews() {
        tableView.backgroundColor = UIColor.clear
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "NEWS".localized)
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: CGFloat(0), left: CGFloat(0), bottom: CGFloat(15).ws, right: CGFloat(0))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.registerCell(NewsTableViewCell.self)
        tableView.registerHeaderFooterView(SearchBarTableViewCell.self)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.news.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.className, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }

        if let presenterNews = presenter?.news {
            if let searchedNews = presenterNews[safe: indexPath.row] {
                newsCell.configureCell(news: searchedNews)
            }
        }

        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToDetail(news: presenter?.news[safe: indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !(presenter?.isBusy ?? true) && (presenter?.news.count == indexPath.row + 1) {
            presenter?.getNews(isNewSearch: false)
        }
    }
    
    //Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let searchBarCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: SearchBarTableViewCell.className) as? SearchBarTableViewCell else { return UIView() }
        
        searchBarCell.searchBar.delegate = self
        
        return searchBarCell
    }
}

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debugPrint("searchText \(searchText)")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter?.searchedKey = searchBar.searchTextField.text ?? ""
        presenter?.getNews(isNewSearch: true)
    }
}
