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
    var bankApi = APIManager.shared.bankApi(from: .starling)
    
    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
    }
}

extension MainViewModel {
    func loginStarling() {
        bankApi?.requestAuthenticationCode()
    }
}
