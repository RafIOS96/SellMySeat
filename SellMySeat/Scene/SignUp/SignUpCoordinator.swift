//
//  SignUpCoordinator.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 25.04.25.
//

import Foundation

protocol SignUpCoordinator: CoordinatorBase {
    func showHomeFromSignUp()
}

extension Coordinator: SignUpCoordinator {
    func showHomeFromSignUp() {
        let vc = StoryboardScene.TabBar.tabBarVC.instantiate()
        let vm = TabBarVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        self.navigationController.show(vc, sender: self)
    }
}
