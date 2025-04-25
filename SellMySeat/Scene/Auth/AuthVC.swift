//
//  AuthVC.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 10.04.25.
//

import UIKit

class AuthVC: BaseVCAndProtocols {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var vm: AuthVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initUIElements() {
        self.setupTableView()
    }
    
    override func dataFetched<T>(type: T.Type, data: T, observerName: ObserverNameEnum) {
        LoadingManager.shared.stopAnimating()
    }
    
    override func errorReceived(error: NetworkError) {
        LoadingManager.shared.stopAnimating()
        PopUpMsgManager.shared.addMsg(text: error.getDisplayDescription)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.registerCell(ofType: InputTableViewCell.self)
        self.tableView.registerCell(ofType: HeaderTableViewCell.self)
        self.tableView.registerCell(ofType: ContinueBtnTableViewCell.self)
        self.tableView.registerCell(ofType: DynamicForgotTableViewCell.self)
        self.tableView.registerCell(ofType: DynamicOrTableViewCell.self)
        self.tableView.registerCell(ofType: DynamicSocialTableViewCell.self)
        self.tableView.registerCell(ofType: DynamicCreateAccountTableViewCell.self)
    }
    
    private func callForLogin() {
        LoadingManager.shared.startAnimating()
        self.vm?.callForLogin()
    }
}

extension AuthVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm?.getDataSource().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = self.vm?.getDataSource() else {return UITableViewCell()}
        return dataSource[indexPath.row].cellForRowAt(delegate: self, indexPath: indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch AuthViewEnum(rawValue: indexPath.row) {
        case .loginBtn:
            self.callForLogin()
        case .forgotPass:
            print("tapped forgot pass")
        case .social:
            print("tapped social")
        case .createAccount:
            print("tapped createAccount")
        default: break
        }
    }
}

extension AuthVC: InputTypeCellDelegate {
    func didChangedTxt(text: String?, inputType: InputEnum?) {
        switch inputType {
        case .email:
            self.vm?.setEmail(text)
        case .pass:
            self.vm?.setPassword(text)
        default:
            break
        }
    }
}

