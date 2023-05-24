//
//  QuotesViewController.swift
//  IOSFinal
//
//  Created by Assylzhan Kagirov on 23.05.2023.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fetchRandomQuote(_ sender: UIButton) {
        let url = URL(string: "https://api.example.com/random-quote")! // Replace with your API endpoint
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Error fetching quote: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let quote = json?["quote"] as? String {
                        DispatchQueue.main.async {
                            self?.quoteLabel.text = quote
                        }
                    }
                } catch {
                    print("Error parsing quote JSON: \(error)")
                }
            }
        }.resume()
    }
}

