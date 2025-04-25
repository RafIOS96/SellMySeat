//
//  OnboardingCoordinator.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

protocol OnboardingCoordinator: CoordinatorBase {
    func showAuth()
}

extension Coordinator: OnboardingCoordinator {
    
    func showAuth() {
        let vc = StoryboardScene.Auth.authVC.instantiate()
        let vm = AuthVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        self.navigationController.pushViewController(vc, animated: true)
//        navigationController.setViewControllers([vc], animated: false)
    }
}
