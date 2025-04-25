//
//  HeaderTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupLbl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTxt(_ txt: String) {
        self.lbl.text = txt
    }
    
    private func setupLbl() {
        self.lbl.numberOfLines = 0
        self.lbl.textAlignment = .left
        self.lbl.lineBreakMode = .byWordWrapping
        self.lbl.textColor = Asset.Colors.black.color
        self.lbl.font = UIFont.boldSystemFont(ofSize: 36)
    }
}
