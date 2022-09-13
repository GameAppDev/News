//
//  UIImageView+Ext.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func downloadImage(imageKey: String, defaultImage: String) {
        guard let imageUrl = URL(string: imageKey) else {
            self.image = UIImage(named: defaultImage)
            return
        }
        DispatchQueue.main.async {
            let resource = ImageResource(downloadURL: imageUrl)
            
            self.kf.indicatorType = .activity
            self.kf.setImage(with: resource, placeholder: UIImage(named: defaultImage), options: [.scaleFactor(UIScreen.main.scale), .cacheOriginalImage]) { result in
                switch result {
                case .success(let value):
                    debugPrint("<--- Image: \(value.image) - Got from: \(value.cacheType) --->")
                case .failure(let error):
                    debugPrint("<---! Download Image Error: \(error) !--->")
                    self.image = UIImage(named: defaultImage)
                }
            }
        }
    }
}
