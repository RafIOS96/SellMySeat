//
//  OnboardingVC.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 10.04.25.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class OnboardingVC: BaseViewController {

    private var vm = OnboardingVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = Auth.auth().currentUser {
            self.vm.updateInfo()
        }
    }
    
    override func dataFetched<T>(type: T.Type, data: T, observerName: ObserverNameEnum) {
        print("asd")
    }
}
