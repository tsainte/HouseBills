//
//  BankAPI.swift
//  SaveIt
//
//  Created by Tiago Bencardino on 28/02/2018.
//  Copyright © 2018 Buildit. All rights reserved.
//

import Foundation

enum BankError: Error {
    case noAccounts
    case noBalance
    case noTransactions
    case noData
    case noToken
    case notImplemented
    case error(localizedDescription: String) // generic
}

enum BankEnvironment {
    case sandbox
    case production
}

// This protocol is implemented for being used with the 'Strategy' design pattern
protocol BankAPI: OAuth2 {
    var token: Token? { get set }
    var parser: BankParser { get set }

    init(token: Token?)

    func getAccounts(success: @escaping ([Account]) -> Void,
                     failure: @escaping (BankError) -> Void)

    func getBalance(account: Account,
                    success: @escaping (Balance) -> Void,
                    failure: @escaping (BankError) -> Void)

    func getTransactions(account: Account,
                         success: @escaping ([BankTransaction]) -> Void,
                         failure: @escaping (BankError) -> Void)
}
