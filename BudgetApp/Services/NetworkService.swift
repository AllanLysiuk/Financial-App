//
//  NetworkService.swift
//  BudgetApp
//
//  Created by Allan on 18.04.23.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    private let domain: URL = URL(string: "https://openexchangerates.org/api/currencies.json")!

    func loadListOfCurrencies(completion: @escaping (([CurrencyElement]) -> Void)) {
        
        var request = URLRequest(url: domain)
        request.httpMethod = "GET"


        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else if let currencyData = data {
                let dictionary = try? JSONDecoder().decode([String: String].self, from: currencyData)
                
                var model: [CurrencyElement] = []
                dictionary?.map({ key, value in
                    model.append(CurrencyElement(key: key, value: value))
                })
                
                DispatchQueue.main.async {
                    completion(model)
                }
            }
        }.resume()
    }

}
