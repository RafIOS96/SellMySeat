//
//  BaseCoordinator.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 18.04.25.
//

import UIKit

protocol CoordinatorBase: AnyObject {
    func doubleBack()
    func goBack()
    func dismiss()
    func baseOpenHomePage()
}

class Coordinator {
    
    var navigationController: UINavigationController!
    
    func start() {
        let vc = StoryboardScene.Onboarding.onboardingVC.instantiate()
        let vm = OnboardingVM()
        vm.coordinator = self
        vm.baseCoordinator = self
        vc.vm = vm
        navigationController.show(vc, sender: self)
    }
    
    func doubleBack() {
        self.popBack(3)
    }
    
    func goBack() {
        self.navigationController.popViewController(animated: true)
    }
    
    private func popBack(_ count: Int) {
        if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            guard viewControllers.count < count else {
                self.navigationController?.popToViewController(viewControllers[viewControllers.count - count],
                                                               animated: true)
                return
            }
        }
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
    func baseOpenHomePage() {
//        for controller in navigationController.viewControllers as Array {
//            if controller.isKind(of: TabbarVC.self) {
//                let vc = controller as? TabbarVC
//                vc?.setSelectedIndex()
//                self.navigationController!.popToViewController(controller, animated: true)
//                break
//            }
//        }
    }
}
