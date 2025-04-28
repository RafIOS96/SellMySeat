//
//  Helper.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 25.04.25.
//

import Foundation

struct Helper {
    
    static func regLogs(isSuccess: Bool, message: String) {
        print((isSuccess ? "✅✅✅✅✅✅✅" : "🆘🆘🆘🆘🆘🆘🆘") + message + (isSuccess ? "✅✅✅✅✅✅✅" : "🆘🆘🆘🆘🆘🆘🆘")) 
    }
}
