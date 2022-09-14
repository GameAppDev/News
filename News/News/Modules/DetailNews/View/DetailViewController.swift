//
//  DetailViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    public var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension DetailViewController: PDetailPresenterToView {
    
    func setupViews() {
        tableView.backgroundColor = UIColor.clear
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "DETAIL".localized)
    }
    
    func setupTableView() {
        tableView.contentInset = UIEdgeInsets(top: CGFloat(15).ws, left: CGFloat(0), bottom: CGFloat(15).ws, right: CGFloat(0))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.registerCell(DetailTableViewCell.self)
        tableView.registerHeaderFooterView(PrimaryButtonTableViewCell.self)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailCell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.className, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }

        if let news = presenter?.selectedNews {
            detailCell.configureCell(news: news)
        }

        return detailCell
    }
    
    //Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let buttonCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: PrimaryButtonTableViewCell.className) as? PrimaryButtonTableViewCell else { return UIView() }
        
        buttonCell.configureCell(delegate: self, name: "News Source")
        
        return buttonCell
    }
}

extension DetailViewController: PrimaryButtonCellDelegate {
    
    func primaryButtonClickAction() {
        presenter?.navigateToWebView(newsUrl: presenter?.selectedNews?.url)
    }
}
