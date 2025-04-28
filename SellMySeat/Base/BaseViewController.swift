//
//  BaseViewController.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

typealias BaseVCAndProtocols = BaseViewController & BaseVCProtocol

@objc protocol BaseVCProtocol: AnyObject {
    func initUIElements()
}

enum ReloadState {
    case none
    case needsReload
}

class BaseViewController: UIViewController, VMToVCExchange, UIGestureRecognizerDelegate {
    
    var reloadState: ReloadState = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vm = self.getVM()
        vm?.baseDelegate = self
        if self.conforms(to: BaseVCProtocol.self) {
            if let strongSelf = self as? BaseVCProtocol {
                strongSelf.initUIElements()
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguage),
                                               name: Notification.Name(rawValue: "changeLanguage"),
                                               object: nil)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        if reloadState == .needsReload {
            if self.conforms(to: BaseVCProtocol.self) {
                if let strongSelf = self as? BaseVCProtocol {
                    strongSelf.initUIElements()
                }
            }
            reloadState = .none
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return baseBackSwipeNavigation()
    }
    
    func baseBackSwipeNavigation() -> Bool {
        if let navVc = navigationController {
            return navVc.viewControllers.count > 1 && !(navVc.topViewController is HomeVC)
        }
        if let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
           let navVc = (scene.windows.first { $0.isKeyWindow })?.rootViewController?.topViewController()?.navigationController {
            return navVc.viewControllers.count > 1 && !(navVc.topViewController is HomeVC)
        }

        return false
    }
    
    private func getVM() -> BaseVM? {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first(where: { $0.label == "vm" || $0.label == "viewModel" })?.value as? BaseVM
    }
    
    @objc internal func changeLanguage() {
        self.reloadState = .needsReload
    }
    
    // MARK: base delegate protocols mehtod's
    
    func dataFetched<T>(type: T.Type, data: [T], observerName: ObserverNameEnum) {
        
    }
    
    func dataFetched<T>(type: T.Type, data: T, observerName: ObserverNameEnum) {
        
    }
    
    func invalidDataErrorReceived<T>(fieldType: T.Type, error: NetworkError) {
        
    }
    
    func errorReceived(error: NetworkError) {
        self.view.endEditing(true)
        LoadingManager.shared.stopAnimating()
        if error.isUnathorized() {
            return
        }
        PopUpMsgManager.shared.addMsg(text: error.getDisplayDescription)
        if error.isUnathorized() {
            #warning("discuss logic, in UNAUTHORIZED")
            PopUpMsgManager.shared.addMsg(text: "discuss logic, in UNAUTHORIZED")
        }
    }
    
    func text(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
