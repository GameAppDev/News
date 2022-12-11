//
//  FavNewsCollectionViewCell.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import UIKit

final class FavNewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.textColor = UIColor.titleColour
        titleLabel.font = UIFont.titleFont
        
        containerView.roundCorners(size: CGFloat(6).ws)
        newsImageView.roundCorners(size: CGFloat(6).ws)
        containerView.setBorder(width: CGFloat(1).ws, color: UIColor.navbarTitleColor)
    }
    
    public func configureCell(news: NewsArticle) {
        newsImageView.downloadImage(imageKey: news.urlToImage ?? "imageKey", defaultImage: "DefaultNewsIcon")
        
        titleLabel.text = news.title ?? "Title"
    }
}
