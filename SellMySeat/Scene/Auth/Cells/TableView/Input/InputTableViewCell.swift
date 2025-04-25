//
//  InputTableViewCell.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

protocol InputTypeCellDelegate: AnyObject {
    func didChangedTxt(text: String?, inputType: InputEnum?)
}

class InputTableViewCell: UITableViewCell {

    @IBOutlet private weak var underView: UIView!
    @IBOutlet private weak var leftImgView: UIImageView!
    @IBOutlet private weak var rightImgView: UIImageView!
    @IBOutlet private weak var txtField: UITextField!

    @IBOutlet private weak var leftImgViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var leftImgViewBetweenSpacing: NSLayoutConstraint!
    @IBOutlet private weak var rightImgViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var rightImgViewBetweenSpacing: NSLayoutConstraint!
    
    private var delegate: InputTypeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInputComponents(delegate: InputTypeCellDelegate?,
                            isShowLeftImg: Bool,
                            isShowRightImg: Bool,
                            leftImg: UIImage?,
                            rightImg: UIImage?) {
        self.delegate = delegate
        self.leftImgView.isHidden = !isShowLeftImg
        self.leftImgViewWidthConstraint.constant = isShowLeftImg ? 24 : 0
        self.leftImgViewBetweenSpacing.constant = isShowLeftImg ? 6 : 0
        self.rightImgView.isHidden = !isShowRightImg
        self.rightImgViewWidthConstraint.constant = isShowRightImg ? 24 : 0
        self.rightImgViewBetweenSpacing.constant = isShowRightImg ? 6 : 0
        if leftImg != nil {
            self.leftImgView.image = leftImg
        }
        
        if rightImg != nil {
            self.rightImgView.image = rightImg
        }
    }
    
    func setupTxtField(placeHolder: String,
                       type: InputEnum) {
        self.txtField.delegate = self
        self.txtField.tag = type.rawValue
        self.txtField.placeholder = placeHolder
    }
    
    private func setupView() {
        self.underView.layer.borderWidth = 1
        self.underView.layer.cornerRadius = 8
        self.underView.layer.masksToBounds = true
        self.underView.layer.borderColor = Asset.Colors.borderGray.color.cgColor
    }
}

extension InputTableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.delegate?.didChangedTxt(text: textField.text, inputType: InputEnum.init(rawValue: textField.tag))
    }
}
