//
//  ContinueBtnTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

class ContinueBtnTableViewCell: UITableViewCell {

    @IBOutlet private weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLbl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTxt(_ txt: String) {
        self.lbl.text = txt
    }
    
    private func setupLbl() {
        self.lbl.layer.cornerRadius = 8
        self.lbl.textAlignment = .center
        self.lbl.layer.masksToBounds = true
        self.lbl.font = .systemFont(ofSize: 20)
        self.lbl.backgroundColor = Asset.Colors.primaryBtn.color
    }
}
