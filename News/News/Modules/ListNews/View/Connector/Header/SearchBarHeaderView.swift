//
//  SearchBarHeaderView.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.12.2022.
//

import UIKit

final class SearchBarHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var searchBar: UISearchBar!
    
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
    
    public func configureView(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}
