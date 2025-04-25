//
//  AuthVM.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 10.04.25.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

class AuthVM: BaseVM {
    
    private var repo = AuthRepo()
    private var dataSource: [AuthViewDataSource] = AuthViewEnum.allCases
    private var email: String?
    private var password: String?
    
    weak var coordinator: AuthCoordinator?
    
    func getDataSource() -> [AuthViewDataSource] {
        return self.dataSource
    }
    
    func setEmail(_ email: String?) {
        self.email = email
    }
    
    func setPassword(_ password: String?) {
        self.password = password
    }
    
    func callForLogin() {
        guard let email = self.email, let password = self.password else {return}
        self.repo.doSignIn(email: email, password: password) { [weak self] error in
            guard let strongSelf = self else {return}
            if let err = error {
                strongSelf.baseDelegate?.errorReceived(error: err)
            } else {
                strongSelf.baseDelegate?.dataFetched(type: String.self, data: "", observerName: .none)
            }
        }
    }
}
