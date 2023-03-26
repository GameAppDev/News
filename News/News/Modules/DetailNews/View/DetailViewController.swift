//
//  DetailViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import UIKit

final class DetailViewController: BaseViewController {

    // MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: PDetailViewToPresenter?
    var tableViewConnector: DetailNewsTableView?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.contentInset = UIEdgeInsets(top: CGFloat(0),
                                              left: CGFloat(0),
                                              bottom: CGFloat(15).ws,
                                              right: CGFloat(0))
        tableView.dataSource = tableViewConnector
        tableView.delegate = tableViewConnector
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.registerCell(DetailTableViewCell.self)
        tableView.registerHeaderFooterView(PrimaryButtonFooterView.self)
    }
    
    @objc private func favNewsClicked(sender: UIBarButtonItem) {
        presenter?.handleFavNewsStatus()
    }
}

extension DetailViewController: PDetailPresenterToView {
    
    func setTableView(isHidden: Bool) {
        tableView.isHidden = isHidden
        tableView.reloadData()
    }
    
    func setFavButton(isFav: Bool) {
        let imageSystemName: String = isFav ? ("heart.fill") : ("heart")
        
        let favButton = UIBarButtonItem(
            image: UIImage(systemName: imageSystemName),
            style: .done,
            target: self,
            action: #selector(favNewsClicked(sender:))
        )
        
        self.navigationItem.rightBarButtonItem = favButton
    }
    
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
