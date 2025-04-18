//
//  ViewController.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

extension UIViewController {
    
    func getSafeAreaHeight(top: Bool) -> CGFloat {
        let window = UIApplication.shared.windows.first!
        if top {
            return window.safeAreaInsets.top
        } else {
            return window.safeAreaInsets.bottom
        }
    }
}
