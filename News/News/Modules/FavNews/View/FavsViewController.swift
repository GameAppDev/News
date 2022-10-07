//
//  FavsViewController.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import UIKit

class FavsViewController: BaseViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    public var presenter: FavsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension FavsViewController: PFavsPresenterToView {
    
    func setupViews() {
        collectionView.backgroundColor = UIColor.clear
    }
    
    func setNavBar() {
        setNavigationBarItems(title: "FAV NEWS".localized)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(FavNewsCollectionViewCell.self)
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

extension FavsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.favNews.count ?? 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(140).ws, height: CGFloat(220).ws)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(20).ws, left: CGFloat(15).ws, bottom: CGFloat(20).ws, right: CGFloat(15).ws)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20).ws
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let favNewsCell = collectionView.dequeueReusableCell(withReuseIdentifier: FavNewsCollectionViewCell.className, for: indexPath) as? FavNewsCollectionViewCell else { return UICollectionViewCell() }
        
        if let news = presenter?.favNews {
            if let cellNews = news[safe: indexPath.row] {
                favNewsCell.configureCell(news: cellNews)
            }
        }
        
        return favNewsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.navigateToDetail(news: presenter?.favNews[indexPath.row])
    }
}
