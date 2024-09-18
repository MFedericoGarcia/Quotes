//
//  QuoteService.swift
//  QuotesCombineMVVM
//
//  Created by Fede Garcia on 18/09/2024.
//
import Foundation
import Combine

class QuoteService: QuoteServiceProtocol {
    
    func getRandomQuote() -> AnyPublisher<Quote, Error> {
        let url = URL(string: "https://dummyjson.com/quotes/random")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .catch { error in
                return Fail(error: error).eraseToAnyPublisher()
            }.map { $0.data }
            .decode(type: Quote.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
