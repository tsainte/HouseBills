//
//  ViewController.swift
//  HouseBills
//
//  Created by Tiago Bencardino on 17/05/2018.
//  Copyright © 2018 Tiago Bencardino. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel(delegate: self)
    }

    @IBAction func starlingConnection(_ sender: Any) {
        viewModel.loginStarling()
    }
}

extension MainViewController: MainViewModelDelegate {

}

