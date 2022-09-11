//
//  SearchBarTableViewCell.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

class SearchBarTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        searchBar.searchTextField.textColor = UIColor.textColor
        searchBar.searchTextField.tintColor = UIColor.textColor
        searchBar.searchTextField.font = UIFont.textFont
        searchBar.searchTextField.placeholder = "Search".localized
    }
}
