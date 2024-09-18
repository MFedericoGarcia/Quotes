//
//  ViewController.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit
import Combine

class HomeView: UIViewController {
    
    var homestack = HomeContainerView()
    private let vm = QuoteViewModel()
    private let input: PassthroughSubject<QuoteViewModel.Input, Never> = .init()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        input.send(.viewDidAppear)
    }
    
    private func configUI() {
        view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        view.addSubview(homestack)
        homestack.homeButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            homestack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homestack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            homestack.widthAnchor.constraint(equalToConstant: 250),
            homestack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func bind() {
        let outuput = vm.transform(input: input.eraseToAnyPublisher())
        outuput
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] event in
            switch event {
            case .fetchQuoteFail(let error):
                self?.homestack.homeLabel.text = error.localizedDescription
            case .techQuoteSuccess(let quote):
                print(quote)
                self?.homestack.homeLabel.text = "\(quote.quote)\n\n \(quote.author)"
            case .toggleButton(let isEnabled):
                self?.homestack.homeButton.isEnabled = isEnabled
            }
        }.store(in: &cancellables)
    }
    
    @objc func refreshButtonTapped() {
        input.send(.refreshButtonTap)
        homestack.homeButton.isEnabled = false
    }


}

