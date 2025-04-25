//
//  OnboardingVM.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 10.04.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class OnboardingVM: BaseVM {
    
    weak var coordinator: OnboardingCoordinator?

    func showAuth() {
        self.coordinator?.showAuth()
    }
}
