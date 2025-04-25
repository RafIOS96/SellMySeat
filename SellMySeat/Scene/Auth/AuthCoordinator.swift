//
//  AuthCoordinator.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import Foundation

protocol AuthCoordinator: CoordinatorBase {
    func showHome()
}

extension Coordinator: AuthCoordinator {
    func showHome() {
        let vc = StoryboardScene.Home.homeVC.instantiate()
        let vm = HomeVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        self.navigationController.show(vc, sender: self)
    }
}
