//
//  DynamicOrTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 23.04.25.
//

import UIKit

class DynamicOrTableViewCell: UITableViewCell {

    @IBOutlet private weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLbl()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLbl() {
        self.lbl.numberOfLines = 1
        self.lbl.textAlignment = .center
        self.lbl.text = "- OR Continue with -"
        self.lbl.font = .systemFont(ofSize: 12)
        self.lbl.textColor = Asset.Colors.black.color
    }
}
