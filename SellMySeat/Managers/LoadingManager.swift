//
//  LoadingManager.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

struct LanguageSectionsModel {
    var language: LanguageManager.Language
}

final class LoadingManager {
    
    static let shared  = LoadingManager()
    
    func startAnimating() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            return
        }
        let activityIndWidth: CGFloat = UIActivityIndicatorView().frame.width
        let activityIndHeight: CGFloat = UIActivityIndicatorView().frame.height
        let windowWidth: CGFloat = window.frame.width
        let windowHeight: CGFloat = window.frame.height
        let activityInd = UIActivityIndicatorView(frame: CGRect(x: windowWidth/2 - activityIndWidth/2,
                                                                y: windowHeight/2 - activityIndHeight/2, width: activityIndWidth, height: activityIndHeight))
        activityInd.style = .large
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
        loadingView.backgroundColor = .black.withAlphaComponent(0.2)
        loadingView.alpha = 0
        loadingView.tag = 777
        loadingView.addSubview(activityInd)
        window.addSubview(loadingView)
        UIView.animate(withDuration: 0.2) {
            loadingView.alpha = 1
            activityInd.startAnimating()
        }
    }
    
    func stopAnimating() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            return
        }
        guard let viewWithTag = window.viewWithTag(777) else {
            return
        }
        UIView.animate(withDuration: 0.2) {
            viewWithTag.alpha = 0
            viewWithTag.layoutIfNeeded()
        } completion: { _ in
            viewWithTag.removeFromSuperview()
        }
    }
}
