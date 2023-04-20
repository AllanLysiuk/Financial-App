//
//  NetworkService.swift
//  BudgetApp
//
//  Created by Allan on 18.04.23.
//

import Foundation

final class NetworkService {
    private let domain: URL = URL(string: "https://currency-conversion-and-exchange-rates.p.rapidapi.com/")!
    
    private enum Path {
        static let symbols = "symbols"
    }
    
    private let headers = [
        "X-RapidAPI-Key": "ea5a848c05msh77b862077380330p133108jsn97910c61b72c",
        "X-RapidAPI-Host": "currency-conversion-and-exchange-rates.p.rapidapi.com"
    ]

    func loadListOfCurrencies(completion: @escaping (([CurrencyElement]) -> Void)) {
        let url = domain.appendingPathComponent(Path.symbols)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else if let currencyData = data {
                let model = try? JSONDecoder().decode([CurrencyElement].self, from: currencyData)
                print(model)
                
                DispatchQueue.main.async {
                    completion(model ?? [])
                }
            }
        }.resume()
    }

}
