//
//  PrimaryButtonFooterView.swift
//  News
//
//  Created by Oguzhan Yalcin on 12.12.2022.
//

import UIKit

protocol PrimaryButtonDelegate: AnyObject {
    func primaryButtonClicked()
}

final class PrimaryButtonFooterView: UITableViewHeaderFooterView {

    @IBOutlet private weak var primaryButton: UIButton!
    
    private weak var delegate: PrimaryButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }

    private func setupViews() {
        primaryButton.setTitle("", for: .normal)
        primaryButton.titleLabel?.font = UIFont.buttonTitleFont
        primaryButton.setTitleColor(UIColor.titleColour, for: .normal)
        primaryButton.backgroundColor = UIColor.itemBGColour
    }
    
    public func configureCell(delegate: PrimaryButtonDelegate, buttonTitle: String) {
        primaryButton.setTitle(buttonTitle, for: .normal)
        
        self.delegate = delegate
    }
    
    @IBAction private func primaryButtonClicked(_ sender: UIButton) {
        delegate?.primaryButtonClicked()
    }
}
