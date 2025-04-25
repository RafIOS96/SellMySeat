//
//  AuthEnum.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

protocol AuthViewDataSource {
    static var allCases: [Self] { get }
    func cellForRowAt(delegate: InputTypeCellDelegate, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}

enum AuthViewEnum: Int, CaseIterable, AuthViewDataSource {
    case header
    case email
    case pass
    case forgotPass
    case loginBtn
    case orLabel
    case social
    case createAccount
    
    func inputPlaceHolder() -> String {
        switch self {
        case .email: return "Username or Email"
        case .pass: return "Password"
        default: return ""
        }
    }
    
    func headerTxt() -> String {
        switch self {
        case .header: return "Welcome\nBack!"
        default: return ""
        }
    }
    
    func inputLeftImg() -> UIImage? {
        switch self {
        case .email: return Asset.Assets.inputUser.image
        case .pass: return Asset.Assets.inputPass.image
        default: return nil
        }
    }
    
    func inputRightImg() -> UIImage? {
        switch self {
        case .pass: return Asset.Assets.inputEye.image
        default: return nil
        }
    }
    
    func isShowInputLeftImg() -> Bool {
        switch self {
        case .email, .pass: return true
        default: return false
        }
    }
    
    func isShowInputRightImg() -> Bool {
        switch self {
        case .pass: return true
        default: return false
        }
    }
    
    func cellForRowAt(delegate: InputTypeCellDelegate, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        switch self {
        case .header:
            guard let cell = tableView.dequeueCell(ofType: HeaderTableViewCell.self) else {return UITableViewCell()}
            cell.setTxt(self.headerTxt())
            return cell
        case .email, .pass:
            guard let cell = tableView.dequeueCell(ofType: InputTableViewCell.self) else {return UITableViewCell()}
            cell.setupTxtField(placeHolder: self.inputPlaceHolder(), type: self == .email ? .email : .pass)
            cell.setInputComponents(delegate: delegate,
                                    isShowLeftImg: self.isShowInputLeftImg(),
                                    isShowRightImg: self.isShowInputRightImg(),
                                    leftImg: self.inputLeftImg(),
                                    rightImg: self.inputRightImg())
            return cell
        case .forgotPass:
            guard let cell = tableView.dequeueCell(ofType: DynamicForgotTableViewCell.self) else {return UITableViewCell()}
            return cell
        case .loginBtn:
            guard let cell = tableView.dequeueCell(ofType: ContinueBtnTableViewCell.self) else {return UITableViewCell()}
            return cell
        case .orLabel:
            guard let cell = tableView.dequeueCell(ofType: DynamicOrTableViewCell.self) else {return UITableViewCell()}
            return cell
        case .social:
            guard let cell = tableView.dequeueCell(ofType: DynamicSocialTableViewCell.self) else {return UITableViewCell()}
            return cell
        case .createAccount:
            guard let cell = tableView.dequeueCell(ofType: DynamicCreateAccountTableViewCell.self) else {return UITableViewCell()}
            return cell
        }
    }
}
