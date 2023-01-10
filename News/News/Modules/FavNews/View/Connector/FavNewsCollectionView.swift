//
//  FavNewsCollectionView.swift
//  News
//
//  Created by Oguzhan Yalcin on 12.12.2022.
//

import UIKit

final class FavNewsCollectionView: NSObject {
    
    private let presenter: PFavsConnectorToPresenter?
    
    init(presenter: PFavsConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension FavNewsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Count
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.getFavNews().count ?? 0)
    }

    // MARK: - Cells
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
        guard let favNewsCell = collectionView.dequeueReusableCell(withReuseIdentifier: FavNewsCollectionViewCell.className,
                                                                   for: indexPath) as? FavNewsCollectionViewCell
        else { return UICollectionViewCell() }
        
        if let favNews = presenter?.getFavNews(),
           let news = favNews[safe: indexPath.row] {
                favNewsCell.configureCell(news: news)
        }
        
        return favNewsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.handleDetail(index: indexPath.row)
    }
}
