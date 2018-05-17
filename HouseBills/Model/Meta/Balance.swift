//
//  Balance.swift
//  SaveIt
//
//  Created by Tiago Bencardino on 27/02/2018.
//  Copyright © 2018 Buildit. All rights reserved.
//

import Foundation

class Balance: NSObject {

    var accountId: String = ""
    var amount: Double = 0
    var currency: String = ""
    var lastUpdate: Date = Date()

    convenience init(accountId: String, amount: Double, currency: String, lastUpdate: Date) {
        self.init()
        self.accountId = accountId
        self.amount = amount
        self.currency = currency
        self.lastUpdate = lastUpdate
    }
    
    convenience init(starlingBalance: StarlingBalance, accountId: String) {
        self.init(accountId: accountId,
                  amount: starlingBalance.effectiveBalance,
                  currency: starlingBalance.currency,
                  lastUpdate: Date())
    }
}
