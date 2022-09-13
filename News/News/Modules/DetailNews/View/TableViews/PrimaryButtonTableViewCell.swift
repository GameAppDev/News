//
//  PrimaryButtonTableViewCell.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import UIKit

protocol PrimaryButtonCellDelegate: AnyObject {
    func primaryButtonClickAction()
}

class PrimaryButtonTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet private weak var primaryButton: UIButton!
    
    private weak var delegate: PrimaryButtonCellDelegate?
    
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
    
    public func configureCell(delegate: PrimaryButtonCellDelegate, name: String) {
        primaryButton.setTitle(name, for: .normal)
        
        self.delegate = delegate
    }
    
    @IBAction func primaryButtonClicked(_ sender: UIButton) {
        delegate?.primaryButtonClickAction()
    }
}
