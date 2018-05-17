//
//  MainViewModel.swift
//  HouseBills
//
//  Created by Tiago Bencardino on 17/05/2018.
//  Copyright © 2018 Tiago Bencardino. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate: class {
}

class MainViewModel {
    weak var delegate: MainViewModelDelegate?
    var bankAPI = APIManager.shared.bankApi(from: .starling)
    let firebaseAPI = FirebaseAPI()

    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
    }
}

extension MainViewModel {
    func loginStarling() {
        bankAPI?.requestAuthenticationCode()
    }
    func fetchHousehold() {
        firebaseAPI.fetchHousehold()
    }
}
