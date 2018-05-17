//
//  APIManager.swift
//  SaveIt
//
//  Created by Tiago Bencardino on 06/03/2018.
//  Copyright © 2018 Buildit. All rights reserved.
//

import Foundation

class APIManager: NSObject {

    static let shared = APIManager()

    // Injecting token onto the API services if available
    // TODO: grab token from user defaults..?
    let starlingAPI = StarlingAPI(token: nil)

    func bankApi(from bank: Bank) -> BankAPI? {
        switch bank.name {
        case Bank.starling.name:
            return starlingAPI
        default:
            return nil
        }
    }
}

// MARK: Fetch tokens
extension APIManager {

    func fetchStarlingToken(from url: URL) {
        starlingAPI.extractAuthenticationToken(from: url) { [unowned self] token in
            guard let token = token else { print("no token returned"); return }

            self.starlingAPI.token = token
//            DatabaseManager.updateToken(token)
        }
    }
}

// MARK: Fetch accounts
extension APIManager {

    func fetchAllAccounts() {
        fetchAccounts(for: starlingAPI)
    }

    func fetchAccounts(for bankAPI: BankAPI) {
        let failure: (BankError) -> Void = { (error) in
            print(error)
        }

        bankAPI.getAccounts(success: { (accounts) in
            for account in accounts {
                bankAPI.getBalance(account: account, success: { (balance) in
                    account.balance = balance
//                    DatabaseManager.saveAccount(account)
                }, failure: failure)
            }
        }, failure: failure)
    }
}

// MARK: Fetch transactions
extension APIManager {

    func fetchTransactions(for account: Account) {
        let failure: (BankError) -> Void = { (error) in
            print(error)
        }

        guard let bank = account.bank,
            let api = bankApi(from: bank) else {
                print("something is nil")
            return
        }
        api.getTransactions(
            account: account,
            success: { (transactions) in
//                DatabaseManager.saveTransactions(transactions, with: account)
        },
            failure: failure)
    }
}
