//
//  ForgotEnum.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 25.04.25.
//

import UIKit

protocol ForgotViewDataSource {
    static var allCases: [Self] { get }
    func cellForRowAt(delegate: InputTypeCellDelegate, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
}

enum ForgotViewEnum: Int, CaseIterable, ForgotViewDataSource {
    case header
    case email
    case submit
    case backToLogin
    
    func inputPlaceHolder() -> String {
        switch self {
        case .email: return "Enter your email address"
        default: return ""
        }
    }
    
    func headerTxt() -> String {
        switch self {
        case .header: return "Forgot\npassword?"
        default: return ""
        }
    }
    
    func inputLeftImg() -> UIImage? {
        switch self {
        case .email: return Asset.Assets.inputUser.image
        default: return nil
        }
    }
    
    func isShowInputLeftImg() -> Bool {
        switch self {
        case .email: return true
        default: return false
        }
    }
    
    
    func submitTxt() -> String {
        switch self {
        case .submit: return "Submit"
        default: return ""
        }
    }
    
    func fullAndLinkedTxts() -> (String, String) {
        switch self {
        case .backToLogin:
            return ("I already remembered my password Login", "Login")
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
        case .email:
            guard let cell = tableView.dequeueCell(ofType: InputTableViewCell.self) else {return UITableViewCell()}
            cell.setupTxtField(placeHolder: self.inputPlaceHolder(),
                               type: InputEnum(rawValue: self.rawValue) ?? .none)
            cell.setInputComponents(delegate: delegate,
                                    isShowLeftImg: self.isShowInputLeftImg(),
                                    isShowRightImg: false,
                                    leftImg: self.inputLeftImg(),
                                    rightImg: nil)
            return cell
        case .submit:
            guard let cell = tableView.dequeueCell(ofType: ContinueBtnTableViewCell.self) else {return UITableViewCell()}
            cell.setTxt(self.submitTxt())
            return cell
        case .backToLogin:
            guard let cell = tableView.dequeueCell(ofType: DynamicCreateAccountTableViewCell.self) else {return UITableViewCell()}
            let (full, linked) = self.fullAndLinkedTxts()
            cell.setTxts(fullTxt: full, linkedTxt: linked)
            return cell
        }
    }
}
