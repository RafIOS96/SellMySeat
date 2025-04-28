//
//  ForgotVM.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 25.04.25.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

class ForgotVM: BaseVM {
    
    weak var coordinator: ForgotCoordinator?
    
    private var repo = ForgotRepo()
    private var email: String?
    private var dataSource: [ForgotViewDataSource] = ForgotViewEnum.allCases

    func getDataSource() -> [ForgotViewDataSource] {
        return self.dataSource
    }
    
    func setEmail(_ email: String?) {
        self.email = email
    }
    
    func callForForgotPassword() {
        guard let email = self.email else {return}
        self.repo.forgotPassword(email: email, completion: { [weak self] error in
            guard let strongSelf = self else {return}
            if let err = error {
                strongSelf.baseDelegate?.errorReceived(error: err)
            } else {
                strongSelf.baseDelegate?.dataFetched(type: String.self, data: "", observerName: .none)
                strongSelf.showLogin()
            }
        })
    }
    
    // MARK: Navigations
    
    func showLogin() {
        self.coordinator?.goBack()
    }
}
