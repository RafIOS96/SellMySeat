//
//  DynamicCreateAccountTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 24.04.25.
//

import UIKit

class DynamicCreateAccountTableViewCell: UITableViewCell {

    @IBOutlet private weak var lbl: UILabel!
    
    private var fullTxt: String = ""
    private var linkedTxt: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        self.setup()
    }
 
    func setTxts(fullTxt: String, linkedTxt: String) {
        self.fullTxt = fullTxt
        self.linkedTxt = linkedTxt
    }
    
    private func setup() {
        let fullText = self.fullTxt
        let signUpRange = (fullText as NSString).range(of: self.linkedTxt)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: Asset.Colors.primaryBtn.color, range: signUpRange)
        self.lbl.attributedText = attributedString
    }
}
