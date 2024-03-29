//
//  DetailTableViewCell.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCell() {
        titleLabel.textColor = UIColor.titleColour
        titleLabel.font = UIFont.titleFont
        detailLabel.textColor = UIColor.textColor
        detailLabel.font = UIFont.textFont
        dateLabel.textColor = UIColor.textColor
        dateLabel.font = UIFont.textFont
        
        newsImageView.roundCorners(size: CGFloat(10).ws)
    }
    
    public func configureCell(news: NewsArticle) {
        newsImageView.downloadImage(
            imageKey: news.urlToImage ?? "imageKey",
            defaultImage: "DefaultNewsIcon"
        )
        
        titleLabel.text = news.title ?? "Title"
        detailLabel.text = news.description ?? "Description"
        dateLabel.text = news.publishedAt?.toDate()?.toString(formatType: "dd-MM-yyyy")
    }
}
