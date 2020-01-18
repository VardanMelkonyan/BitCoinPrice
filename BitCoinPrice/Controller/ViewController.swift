//
//  ViewController.swift
//  BitCoinPrice
//
//  Created by Vardan on 1/18/20.
//  Copyright © 2020 Poseidon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    
    var curencyOpthion = [String]()
    var pickerResult : String? = String()
    
    @IBOutlet weak var curencyPickerView: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        curencyPickerView.delegate = self
        curencyPickerView.dataSource = self
        
        curencyOpthion = ["USD","GBP", "EUR"]
    }
    
    let priceManager = PriceManager()
    
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return curencyOpthion.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        priceManager.preformRequest()
        pickerResult = curencyOpthion[row]
        
        return curencyOpthion[row]
    }
    
}

extension ViewController: PriceManagerDelegate{
    
    func didUpdatePrice( _ price: PriceModel) {
        print("Hi")
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}
