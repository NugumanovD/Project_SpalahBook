//  
//  MainViewController.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

protocol MainView: class {
    
}

final class MainViewController: UIViewController {
    private var output: MainViewOutput?
    
    @IBAction func onAddClick(_ sender: UIButton) {
        output?.addClickAdd()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didLoad()
    }
}

extension MainViewController {
    func attach(output: MainViewOutput) {
        self.output = output
    }
}

extension MainViewController: MainView {
    
}
