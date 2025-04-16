//
//  BaseVM.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import UIKit

protocol VMToVCExchange: AnyObject {
    func dataFetched<T>(type: T.Type, data: [T], observerName: ObserverNameEnum)
    func dataFetched<T>(type: T.Type, data: T, observerName: ObserverNameEnum)
    func invalidDataErrorReceived<T>(fieldType: T.Type, error: NetworkError)
    func errorReceived(error: NetworkError)
}

class BaseVM {
    
    weak var baseDelegate: VMToVCExchange?

    func checkForErrorCase<T>(responseData: T?, error: NetworkError?,
                              completionHandler: @escaping (NetworkError?, T?) -> Void) {
        if error != nil {
            completionHandler(error, nil)
        } else if responseData == nil {
            let networkError = (NetworkError.init(error: ErrorDetails.init(message: "Response data model is nil")))
            self.baseDelegate?.errorReceived(error: networkError)
            completionHandler(nil, nil)
        }
        completionHandler(nil, responseData)
    }

    func analizeError<T>(error: NetworkError, errorFieldType: T.Type = Any.self) {
        if let _ = error.errors {
            self.baseDelegate?.invalidDataErrorReceived(fieldType: errorFieldType, error: error)
        } else {
            guard error.error != nil || error.errors != nil else {return}
            self.baseDelegate?.errorReceived(error: error)
        }
    }
}

extension BaseVM: VMToVCExchange {
    
    func dataFetched<T>(type: T.Type, data: [T], observerName: ObserverNameEnum) {
        
    }
    
    func dataFetched<T>(type: T.Type, data: T, observerName: ObserverNameEnum) {
        
    }
    
    func invalidDataErrorReceived<T>(fieldType: T.Type, error: NetworkError) {
        
    }
    
    func errorReceived(error: NetworkError) {
        
    }
    
    func dataFetched<T>(type: T.Type, data: [T]) {
        
    }
    
    func dataFetched<T>(type: T.Type, data: T) {
        
    }
    
    func text(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
