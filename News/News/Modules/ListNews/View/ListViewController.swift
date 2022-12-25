//
//  ListViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

final class ListViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: ListPresenter?
    var tableViewConnector: ListNewsTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
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
        tableView.registerCell(NewsTableViewCell.self)
        tableView.registerHeaderFooterView(SearchBarHeaderView.self)
        tableView.registerHeaderFooterView(PrimaryButtonFooterView.self)
    }
}

extension ListViewController: PListPresenterToView {
    
    func setTableView(isHidden: Bool) {
        tableView.isHidden = isHidden
        tableView.reloadData()
    }
    
    // MARK: PresenterToView
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
