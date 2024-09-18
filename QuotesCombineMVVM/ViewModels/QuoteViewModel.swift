//
//  QuoteViewModel.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 18/09/2024.
//

import Foundation
import Combine

protocol QuoteServiceProtocol {
    func getRandomQuote() -> AnyPublisher<Quote, Error>
}

class QuoteViewModel {
    
    enum Input {
        case viewDidAppear
        case refreshButtonTap
    }
    
    enum Output {
        case fetchQuoteFail(error: Error)
        case techQuoteSuccess(quote: Quote)
        case toggleButton(isEnabled: Bool)
    }
    
    private let quoteService: QuoteService
    private let output: PassthroughSubject<Output, Never> = .init()
    private var cancellables: Set<AnyCancellable> = []
    
    init(quoteService: QuoteService = QuoteService()) {
        self.quoteService = quoteService
    }
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input.sink { [weak self] event in
            switch event {
            case .viewDidAppear , .refreshButtonTap:
                self?.handleGetRandomQuotes()
            }
        }.store(in: &cancellables)
        return output.eraseToAnyPublisher()
    }
    
    private func handleGetRandomQuotes() {
        quoteService.getRandomQuote().sink { [weak self] completion in
            if case .failure(let error) = completion {
                self?.output.send(.fetchQuoteFail(error: error))
            }
        } receiveValue: { [weak self] quote in
            self?.output.send(.techQuoteSuccess(quote: quote))
            self?.output.send(.toggleButton(isEnabled: true))
        }.store(in: &cancellables)

    }
    
}
