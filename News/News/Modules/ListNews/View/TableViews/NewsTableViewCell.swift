//
//  NewsTableViewCell.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var newsImageView: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.textColor = UIColor.titleColour
        titleLabel.font = UIFont.titleFont
        infoLabel.textColor = UIColor.textColor
        infoLabel.font = UIFont.textFont
        dateLabel.textColor = UIColor.textColor
        dateLabel.font = UIFont.textFont
        
        containerView.backgroundColor = UIColor.itemBGColour
        containerView.roundCorners(size: CGFloat(6).ws)
        newsImageView.roundCorners(size: CGFloat(6).ws)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(news: NewsArticle) {
        downloadImage(imageKey: news.urlToImage ?? "imageKey")
        
        titleLabel.text = news.title ?? "Title"
        infoLabel.text = news.description ?? "Description"
        dateLabel.text = news.publishedAt?.toDate().toString(formatType: "dd-MM-yyyy")
    }
    
    private func downloadImage(imageKey: String) {
        guard let imageUrl = URL(string: imageKey) else {
            newsImageView.image = UIImage(named: "DefaultNewsIcon")
            return
        }
        DispatchQueue.main.async {
            let resource = ImageResource(downloadURL: imageUrl)
            
            self.newsImageView.kf.indicatorType = .activity
            self.newsImageView.kf.setImage(with: resource, placeholder: UIImage(named: "DefaultNewsIcon"), options: [.scaleFactor(UIScreen.main.scale), .cacheOriginalImage]) { result in
                switch result {
                case .success(let value):
                    print("Image: \(value.image). Got from: \(value.cacheType)")
                case .failure(let error):
                    print("Error: \(error)")
                    self.newsImageView.image = UIImage(named: "DefaultNewsIcon")
                }
            }
        }
    }
}
