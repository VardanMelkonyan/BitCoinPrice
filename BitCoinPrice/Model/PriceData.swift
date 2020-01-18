//
//  PriceData.swift
//  BitCoinPrice
//
//  Created by Vardan on 1/19/20.
//  Copyright © 2020 Poseidon. All rights reserved.
//

import Foundation

struct PriceData : Codable{
    let bpi : Bpi
}

struct Bpi : Codable{
    let USD : Usd
    let GBP : Gbp
    let EUR : Eur
    
}
struct Usd : Codable{
    let rate : String
}

struct Gbp : Codable{
    let rate : String
}

struct Eur : Codable{
    let rate : String
}
