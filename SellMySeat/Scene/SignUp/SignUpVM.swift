//
//  SignUpVM.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 25.04.25.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

class SignUpVM: BaseVM {
    
    weak var coordinator: SignUpCoordinator?

    private var repo = AuthRepo()
    private var dataSource: [SignUpEnumDataSource] = SignUpEnum.allCases
    private var email: String?
    private var password: String?
    private var confirmPassword: String?

    func getDataSource() -> [SignUpEnumDataSource] {
        return self.dataSource
    }
    
    func setEmail(_ email: String?) {
        self.email = email
    }
    
    func setPassword(_ password: String?) {
        self.password = password
    }
    
    func setConfirmPassword(_ confirmPass: String?) {
        self.confirmPassword = confirmPass
    }
    
    func callForSignUp() {
        guard let email = self.email, let password = self.password else {return}
        self.repo.doSignUp(email: email, password: password) { [weak self] error in
            guard let strongSelf = self else {return}
            if let err = error {
                strongSelf.baseDelegate?.errorReceived(error: err)
            } else {
                strongSelf.baseDelegate?.dataFetched(type: String.self, data: "", observerName: .none)
                strongSelf.showHome()
            }
        }
    }
    
    // MARK: Navigations

    func showLogin() {
        self.coordinator?.goBack()
    }
    
    func showHome() {
        self.coordinator?.showHomeFromSignUp()
    }
}
