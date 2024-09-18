//
//  HomeButton.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit

class HomeButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .tinted()
        configuration?.baseBackgroundColor = .systemTeal
        configuration?.baseForegroundColor = .systemTeal
        configuration?.title = "Refresh"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
