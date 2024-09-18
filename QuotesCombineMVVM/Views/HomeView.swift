//
//  ViewController.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit

class HomeView: UIViewController {
    
    var homestack = HomeContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        view.addSubview(homestack)
        
        NSLayoutConstraint.activate([
            homestack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homestack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            homestack.widthAnchor.constraint(equalToConstant: 250),
            homestack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }


}

