//
//  PriceManager.swift
//  BitCoinPrice
//
//  Created by Vardan on 1/19/20.
//  Copyright © 2020 Poseidon. All rights reserved.
//

import Foundation

protocol PriceManagerDelegate {
    func didUpdatePrice(_ price: PriceModel)
    func didFailWithError(_ error: Error)
}

struct PriceManager {
    
    var delegate: PriceManagerDelegate?
    
    func preformRequest() {
        let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let price = self.parseJSON(safeData){
                        self.delegate?.didUpdatePrice(price)
                        print("Hello")
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ priceData: Data) -> PriceModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(PriceData.self, from: priceData)
            let usd = decodedData.bpi.USD.rate
            let gbp = decodedData.bpi.GBP.rate
            let eur = decodedData.bpi.EUR.rate
            
            let price = PriceModel(USD: usd, GBP: gbp, EUR: eur)
            
            return price
        } catch{
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
