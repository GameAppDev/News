//
//  FavsViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import UIKit

final class FavsViewController: BaseViewController {

    // MARK: Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var presenter: PFavsViewToPresenter?
    var collectionViewConnector: FavNewsCollectionView?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = collectionViewConnector
        collectionView.dataSource = collectionViewConnector
        collectionView.registerCell(FavNewsCollectionViewCell.self)
    }
}

extension FavsViewController: PFavsPresenterToView {
    
    func setCollectionView(isHidden: Bool) {
        collectionView.isHidden = isHidden
        collectionView.reloadData()
    }
    
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
