//
//  ViewController.swift
//  RandomPhoto
//
//  Created by calatinalper on 14.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    let image1 = "https://source.unsplash.com/random/1920x1080"
    
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img1.load(urlString: image1)
        img1.layer.cornerRadius = 10
        
        
        if let url = URL(string: "https://zenquotes.io/api/random") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode([Quotes].self, from: data)
                        print(parsedJSON)
                        DispatchQueue.main.async {
                            self.label.text = "ss\(parsedJSON.last)"
                        }
                        
                    } catch{
                        print(error)
                    }
                    
                }
                
            }.resume()
            
        }
        
        
    }
    
   
    @IBAction func refreshButton(_ sender: UIButton) {
        img1.load(urlString: image1)
    }
    
}

struct Quotes: Codable {
    let q: String
    let a: String
}

