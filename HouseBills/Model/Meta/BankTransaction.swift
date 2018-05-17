//
//  Transaction.swift
//  SaveIt
//
//  Created by Tiago Bencardino on 17/04/2018.
//  Copyright © 2018 Buildit. All rights reserved.
//

import Foundation

class BankTransaction: NSObject {

    var account: Account?

    var id: String = ""
    var amount: Double = 0
    var balance: Double = 0
    var currency: String = ""
    var name: String = ""
    var created: Date = Date()

    convenience init(account: Account,
                     id: String,
                     amount: Double,
                     balance: Double,
                     currency: String,
                     name: String,
                     created: Date) {
        self.init()
        self.account = account
        self.id = id
        self.amount = amount
        self.balance = balance
        self.currency = currency
        self.name = name
        self.created = created
    }

    convenience init(starlingTransaction: StarlingTransaction, account: Account) {
        self.init(account: account,
                  id: starlingTransaction.id,
                  amount: starlingTransaction.amount,
                  balance: starlingTransaction.balance,
                  currency: starlingTransaction.currency,
                  name: starlingTransaction.narrative,
                  created: starlingTransaction.created)
    }
}
