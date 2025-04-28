//
//  ViewController.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

extension UIViewController {
    
    func getSafeAreaHeight(top: Bool) -> CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0
        }
        
        return top ? window.safeAreaInsets.top : window.safeAreaInsets.bottom
    }
    
    func topViewController(base: UIViewController? = {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            return scene.windows.first(where: { $0.isKeyWindow })?.rootViewController
        }
        return nil
    }()) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }

        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }

        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }

    
    // Get cell frame from superview by indexpath
    func getCurrentCellFrame(tableView: UITableView,
                             indexPath: IndexPath) -> CGRect {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
            
        if indexPath.row != -1 {
            let rectOfCell = tableView.rectForRow(at: indexPath)
            let rectOfCellInSuperview = tableView.convert(rectOfCell, to: tableView.superview)
            return rectOfCellInSuperview
        }
        
        return rect
    }
    
    // Get index path of tableView by edited textfield
    func getIndexPathByTxtField(textField: UITextField,
                                tableView: UITableView) -> IndexPath? {
        let textFieldPosition = textField.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: textFieldPosition) {
            return indexPath
        } else {
            return nil
        }
    }
}
