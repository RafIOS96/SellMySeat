//
//  SignUpEnum.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 25.04.25.
//

import UIKit

protocol SignUpEnumDataSource {
    static var allCases: [Self] { get }
    func cellForRowAt(delegate: InputTypeCellDelegate, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}

enum SignUpEnum: Int, CaseIterable, SignUpEnumDataSource {
    case header
    case email
    case pass
    case confirmPass
    case signUpBtn
    case orLabel
    case social
    case backToLogin
    
    func inputPlaceHolder() -> String {
        switch self {
        case .email: return "Username or Email"
        case .pass: return "Password"
        case .confirmPass: return "Confirm Password"
        default: return ""
        }
    }
    
    func headerTxt() -> String {
        switch self {
        case .header: return "Create an\naccount"
        default: return ""
        }
    }
    
    func inputLeftImg() -> UIImage? {
        switch self {
        case .email: return Asset.Assets.inputUser.image
        case .pass, .confirmPass: return Asset.Assets.inputPass.image
        default: return nil
        }
    }
    
    func inputRightImg() -> UIImage? {
        switch self {
        case .pass, .confirmPass: return Asset.Assets.inputEye.image
        default: return nil
        }
    }
    
    func isShowInputLeftImg() -> Bool {
        switch self {
        case .email, .pass, .confirmPass: return true
        default: return false
        }
    }
    
    func isShowInputRightImg() -> Bool {
        switch self {
        case .pass, .confirmPass: return true
        default: return false
        }
    }
    
    func signUpBtnTxt() -> String {
        switch self {
        case .signUpBtn: return "Sign Up"
        default: return ""
        }
    }
    
    func fullAndLinkedTxts() -> (String, String) {
        switch self {
        case .backToLogin:
            return ("I Already Have an Account Login", "Login")
        default:
            return ("", "")
        }
    }
    
    func cellForRowAt(delegate: InputTypeCellDelegate, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        switch self {
        case .header:
            guard let cell = tableView.dequeueCell(ofType: HeaderTableViewCell.self) else {return UITableViewCell()}
            cell.setTxt(self.headerTxt())
            return cell
        case .email, .pass, .confirmPass:
            guard let cell = tableView.dequeueCell(ofType: InputTableViewCell.self) else {return UITableViewCell()}
            cell.setupTxtField(placeHolder: self.inputPlaceHolder(),
                               type: InputEnum(rawValue: self.rawValue) ?? .none,
                               isSecure: self != .email)
            cell.setInputComponents(delegate: delegate,
                                    isShowLeftImg: self.isShowInputLeftImg(),
                                    isShowRightImg: self.isShowInputRightImg(),
                                    leftImg: self.inputLeftImg(),
                                    rightImg: self.inputRightImg())
            return cell
        case .signUpBtn:
            guard let cell = tableView.dequeueCell(ofType: ContinueBtnTableViewCell.self) else {return UITableViewCell()}
            cell.setTxt(self.signUpBtnTxt())
            return cell
        case .orLabel:
            guard let cell = tableView.dequeueCell(ofType: DynamicOrTableViewCell.self) else {return UITableViewCell()}
            return cell
        case .social:
            guard let cell = tableView.dequeueCell(ofType: DynamicSocialTableViewCell.self) else {return UITableViewCell()}
            return cell
        case .backToLogin:
            guard let cell = tableView.dequeueCell(ofType: DynamicCreateAccountTableViewCell.self) else {return UITableViewCell()}
            let (full, linked) = self.fullAndLinkedTxts()
            cell.setTxts(fullTxt: full, linkedTxt: linked)
            return cell
        }
    }
}
