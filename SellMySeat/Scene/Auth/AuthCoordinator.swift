//
//  AuthCoordinator.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import Foundation

protocol AuthCoordinator: CoordinatorBase {
    func showHomeFromAuth()
    func showSignUp()
    func showForgotScene()
}

extension Coordinator: AuthCoordinator {
    func showHomeFromAuth() {
        let vc = StoryboardScene.Home.homeVC.instantiate()
        let vm = HomeVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        self.navigationController.show(vc, sender: self)
    }
    
    func showSignUp() {
        let vc = StoryboardScene.SignUp.signUpVC.instantiate()
        let vm = SignUpVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        self.navigationController.show(vc, sender: self)
    }
    
    func showForgotScene() {
        let vc = StoryboardScene.Forgot.forgotVC.instantiate()
        let vm = ForgotVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        self.navigationController.show(vc, sender: self)
    }
}
