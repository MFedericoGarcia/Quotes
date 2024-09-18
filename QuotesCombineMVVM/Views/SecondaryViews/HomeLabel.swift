//
//  HomeLabel.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit

class HomeLabel: UILabel {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        font = .preferredFont(forTextStyle: .body)
        font = .systemFont(ofSize: 16, weight: .medium)
        numberOfLines = 0
        text = "El conde de Montecristo es una novela de aventuras clásica de Alejandro Dumas, con la colaboración de Auguste Maquet.​ Esta obra es considerada como la mejor obra literaria de Dumas y está a menudo integrada en toda nómina de novela de aventuras."
        textAlignment = .center
        textColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
