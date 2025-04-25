//
//  DynamicForgotTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 23.04.25.
//

import UIKit

class DynamicForgotTableViewCell: UITableViewCell {

    @IBOutlet private weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupLbl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLbl() {
        self.lbl.numberOfLines = 1
        self.lbl.textAlignment = .right
        self.lbl.text = "Forgot Password?"
        self.lbl.font = .systemFont(ofSize: 12)
        self.lbl.textColor = Asset.Colors.primaryBtn.color
    }
}
