//
//  DynamicCreateAccountTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 24.04.25.
//

import UIKit

class DynamicCreateAccountTableViewCell: UITableViewCell {

    @IBOutlet private weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    private func setup() {
        let fullText = "Create An Account Sign Up"
        let signUpRange = (fullText as NSString).range(of: "Sign Up")
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: Asset.Colors.primaryBtn.color, range: signUpRange)
        self.lbl.attributedText = attributedString
    }
}
