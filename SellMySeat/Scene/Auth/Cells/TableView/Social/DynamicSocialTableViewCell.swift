//
//  DynamicSocialTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 24.04.25.
//

import UIKit

class DynamicSocialTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var appleUnderView: UIView!
    @IBOutlet private weak var ImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        self.appleUnderView.layer.masksToBounds = true
        self.appleUnderView.layer.cornerRadius = self.appleUnderView.frame.height / 2
        self.appleUnderView.layer.borderColor = Asset.Colors.primaryBtn.color.cgColor
        self.appleUnderView.layer.borderWidth = 1
        self.ImgView.image = Asset.Assets.socialApple.image
    }
}
