//
//  SearchBarHeaderView.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.12.2022.
//

import UIKit

final class SearchBarHeaderView: UITableViewHeaderFooterView {

    // MARK: Outlets
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    private func setupView() {
        searchBar.searchTextField.textColor = UIColor.textColor
        searchBar.searchTextField.tintColor = UIColor.textColor
        searchBar.searchTextField.font = UIFont.textFont
        searchBar.searchTextField.placeholder = "Search".localized
    }
    
    public func configureView(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}
