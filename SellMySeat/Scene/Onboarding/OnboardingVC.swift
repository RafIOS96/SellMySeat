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

class OnboardingVC: BaseVCAndProtocols {

    var vm: OnboardingVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.vm?.showAuth()
        })
    }
    
    func initUIElements() {
        
    }
}
