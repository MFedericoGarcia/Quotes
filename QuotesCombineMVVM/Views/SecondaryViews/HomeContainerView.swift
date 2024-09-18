//
//  HomeContainerView.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit

class HomeContainerView: UIView {
    
    var homeButton = HomeButton()
    var homeLabel = HomeLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configUI() {
        addSubview(homeButton)
        addSubview(homeLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondaryLabel.withAlphaComponent(0.1)
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            
            homeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            homeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            homeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            homeLabel.heightAnchor.constraint(equalToConstant: 200),
            
            homeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            homeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            homeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            homeButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

}
