//
//  Account.swift
//  SaveIt
//
//  Created by Tiago Bencardino on 27/02/2018.
//  Copyright © 2018 Buildit. All rights reserved.
//

import Foundation

class Account: NSObject {

    var bank: Bank?

    var accountId: String = ""
    var name: String = ""
    var sortCode: String?
    var accountNumber: String?

    var balance: Balance?


    convenience init(bank: Bank,
                     accountId: String,
                     name: String,
                     sortCode: String? = nil,
                     accountNumber: String? = nil,
                     balance: Balance? = nil) {
        self.init()
        self.bank = bank
        self.accountId = accountId
        self.name = name
        self.sortCode = sortCode
        self.accountNumber = accountNumber
        self.balance = balance
    }

    convenience init(starlingAccount: StarlingAccount) {
        self.init(bank: .starling,
                  accountId: starlingAccount.id,
                  name: starlingAccount.name,
                  sortCode: starlingAccount.sortCode,
                  accountNumber: starlingAccount.accountNumber)
    }
}
